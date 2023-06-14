import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tiktok_tool/src/data/service/app_storage.dart';
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
    SocketService.socket?.close();
    IO.Socket socket = IO.io('http://10.0.2.2:8081', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'reconnectionDelay': 1000,
      'reconnectionDelayMax': 5000,
      'timeout': 5000,
    });
    socket.onConnect((_) {
      bloc.serverOn();
      connectLivestream(bloc);
    });
    socket.onConnecting((_) {
      bloc.status('Connecting to server');
    });
    socket.onReconnect((_) {
      bloc.status('Connecting to server');
    });
    socket.onReconnecting((_) {
      bloc.status('Connecting to server');
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
      _offLivestreamListen();
      bloc.serverOff();
    });
    SocketService.socket = socket;
    socket.connect();
  }

  static void _scheduleReconnectLivestream(StreamStatusBloc bloc) {
    Future.delayed(const Duration(seconds: 5), () {
      connectLivestream(bloc);
    });
  }

  static Future connectLivestream(StreamStatusBloc bloc) async {
    final socket = SocketService.socket;
    if (socket == null) return;

    final uniqueId = await AppStorage().getUniqueId();

    bloc.status('Connecting to $uniqueId');
    socket.emit('setUniqueId', uniqueId);

    socket.once('streamEnd', (_) {
      bloc.offline();
      _offLivestreamListen();
      _scheduleReconnectLivestream(bloc);
    });
    socket.once('tiktokDisconnected', (_) {
      bloc.offline();
      _offLivestreamListen();
      _scheduleReconnectLivestream(bloc);
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
      );
      bloc.online(room);

      _listenRoomMember(bloc);
      _listenComment((comment) {
        _commentStreamController.add(comment);
      }, (social) {
        _socialStreamController.add(social);
      });
    });
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

  static CommentModel _parseModel(dynamic data) {
    return CommentModel(
      id: data['msgId'] ?? '',
      userId: data['userId'] ?? '',
      nickname: data['nickname'] ?? '',
      avatar: data['profilePictureUrl'] ?? '',
      comment: data['comment']?.toString() ?? '',
      createTime: data['createTime'],
    );
  }
}
