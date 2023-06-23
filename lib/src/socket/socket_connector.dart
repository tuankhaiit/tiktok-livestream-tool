import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tiktok_tool/src/configuration/env/ENV.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/utils/log.dart';

import '../domain/model/comment.dart';
import '../presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';

typedef CommentListener = void Function(CommentModel comment);

class SocketService {
  static IO.Socket? socket;

  static final StreamController<CommentModel> _commentStreamController =
      StreamController.broadcast();
  static Stream<CommentModel> commentStream = _commentStreamController.stream;

  static final StreamController<CommentModel> _socialStreamController =
      StreamController.broadcast();
  static Stream<CommentModel> socialStream = _socialStreamController.stream
      .throttleTime(const Duration(milliseconds: 50));

  static void connectServer(StreamStatusBloc bloc) {
    logI('Socket is connecting to server');
    SocketService.socket?.close();
    SocketService.socket = null;
    IO.Socket socket = IO.io(
        ENV.socketServer,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .enableForceNew()
            .enableReconnection()
            .setTimeout(10000)
            .setReconnectionDelay(10000)
            .setReconnectionDelayMax(20000)
            .setReconnectionAttempts(100000)
            .build());

    socket.onConnect((_) {
      bloc.serverOn();
      _listenStatistic(bloc);
    });
    socket.onConnecting((_) {
      logI('Server reconnecting');
    });
    socket.onReconnect((_) {
      logI('Server reconnect');
    });
    socket.onReconnecting((_) {
      bloc.status('Reconnecting to server');
    });
    socket.onConnectError((data) {
      _offLivestreamListen();
      bloc.serverError('Error occurred!');
      logE(data.toString());
    });
    socket.onError((data) {
      _offLivestreamListen();
      bloc.serverError('Error occurred!');
      logE(data.toString());
    });
    socket.onDisconnect((_) {
      bloc.status('Error occurred!');
      bloc.serverOff();
      _offLivestreamListen();
      _offServerListen();
    });
    SocketService.socket = socket;
    socket.connect();
  }

  static void disconnectServer(StreamStatusBloc bloc) {
    _offLivestreamListen();
    SocketService.socket?.close();
    SocketService.socket = null;
  }

  static void disconnectLivestream(StreamStatusBloc bloc) {
    bloc.emptyState();
    _offLivestreamListen();
    final socket = SocketService.socket;
    if (socket != null) {
      socket.emit('disconnectTiktok');
    }
  }

  static void _scheduleReconnectLivestream(StreamStatusBloc bloc, String uniqueId) {
    Future.delayed(const Duration(seconds: 5), () {
      connectLivestream(bloc, uniqueId);
    });
  }

  static Future connectLivestream(StreamStatusBloc bloc, String uniqueId) async {
    final socket = SocketService.socket;
    if (socket == null) return;
    _offLivestreamListen();

    bloc.emptyState();
    logI('Socket is connecting to $uniqueId');
    bloc.status('Connecting to $uniqueId');

    socket.once('streamEnd', (_) {
      bloc.offline();
      _offLivestreamListen();
    });
    socket.once('tiktokDisconnected', (_) {
      bloc.offline();
      _offLivestreamListen();
    });
    socket.once('tiktokConnected', (data) {
      final room = RoomModel(
        roomId: data['roomId'],
        userId: data['roomInfo']['owner_user_id'].toString(),
        uniqueId: data['roomInfo']['owner']['display_id'].toString(),
        nickname: data['roomInfo']['owner']['nickname'].toString(),
        avatar: (data['roomInfo']['owner']['avatar_thumb']['url_list']
                    as List<dynamic>?)
                ?.first
                .toString() ??
            '',
        status: 'Online',
        commentCount: 0,
        createTime: 0
      );
      bloc.online(room);

      _listenRoomMember(bloc);
      _listenComment((comment) {
        _commentStreamController.add(comment);
      }, (social) {
        _socialStreamController.add(social);
      });
    });

    socket.emit('setUniqueId', uniqueId);
  }

  static void _listenStatistic(StreamStatusBloc bloc) {
    final socket = SocketService.socket;
    if (socket == null) return;
    socket.on('statistic', (data) => bloc.updateStatistic(data));
  }

  static void _listenRoomMember(StreamStatusBloc bloc) {
    final socket = SocketService.socket;
    if (socket == null) return;
    socket.on(
        'roomUser', (data) => bloc.updateMember(int.parse(data.toString())));
  }

  static void _listenComment(
    CommentListener? commentListener,
    CommentListener? socialListener,
  ) {
    final socket = SocketService.socket;
    if (socket == null) return;
    if (commentListener != null) {
      socket.on('chat', (data) {
        final CommentModel comment = _parseModel(data);
        commentListener(comment.copyWith(comment: comment.comment));
      });
    }
    if (socialListener != null) {
      socket.on('member', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(comment: 'joined the LIVE'));
      });
      socket.on('like', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(
            comment: data['label'].toString().replaceAll('{0:user}', '')));
      });
      socket.on('social', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(
            comment: data['label'].toString().replaceAll('{0:user}', '')));
      });
    }
  }

  static void _offLivestreamListen() {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.off('chat');
      socket.off('member');
      socket.off('like');
      socket.off('social');
      socket.off('roomUser');
      socket.off('streamEnd');
      socket.off('tiktokConnected');
      socket.off('tiktokDisconnected');
    }
  }

  static void _offServerListen() {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.off('globalConnectionCount');
    }
  }

  static void startRecordLivestream() {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.emit('startRecord');
    }
  }

  static void stopRecordLivestream() {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.emit('stopRecord');
    }
  }

  static CommentModel _parseModel(dynamic data) {
    return CommentModel(
      id: data['msgId'] ?? '',
      userId: data['userId'] ?? '',
      uniqueId: data['uniqueId'] ?? '',
      nickname: data['nickname'] ?? '',
      avatar: data['profilePictureUrl'] ?? '',
      comment: data['comment']?.toString() ?? '',
      createTime: int.parse(data['createTime']),
    );
  }
}
