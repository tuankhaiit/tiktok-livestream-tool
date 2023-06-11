import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/utils/log.dart';

import '../domain/model/comment.dart';
import '../presentation/stream_status/stream_status_bloc.dart';

typedef CommentListener = void Function(CommentModel comment);

class SocketService {
  static IO.Socket? socket;

  static void connectServer(StreamStatusBloc bloc) {
    IO.Socket socket = IO.io('http://192.168.88.254:8081', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.onConnect((_) {
      bloc.serverOn();
    });
    socket.onError((data) {
      bloc.connectError('Error occurred!');
      logD('Connect server error: ${data.toString()}');
    });
    // The host end livestream
    socket.on('streamEnd', (_) {
      bloc.offline();
      logD('The host end livestream');
      offLivestreamListen();
    });
    socket.on('tiktokDisconnected', (_) {
      bloc.offline();
      logD('End stream');
      offLivestreamListen();
    });
    socket.onDisconnect((_) {
      bloc.serverOff();
    });
    SocketService.socket = socket;
    socket.connect();
  }

  static void connectLivestream(StreamStatusBloc bloc,
      [String uniqueId = '@my_vanh']) {
    bloc.connecting(uniqueId);
    socket?.emit('setUniqueId', uniqueId);
    socket?.once('tiktokConnected', (data) {
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
    });
  }

  static void offLivestreamListen() {
    final socket = SocketService.socket;
    if (socket != null) {
      socket.off('chat');
      socket.off('member');
      socket.off('like');
      socket.off('social');
    }
  }

  static void listenComment(
      CommentListener? commentListener, CommentListener? socialListener) {
    if (commentListener != null) {
      SocketService.socket?.on('chat', (data) {
        final CommentModel comment = _parseModel(data);
        commentListener(comment.copyWith(comment: comment.comment));
      });
    }
    if (socialListener != null) {
      SocketService.socket?.on('member', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(comment: 'joined the LIVE'));
      });
      SocketService.socket?.on('like', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(
            comment: data['label'].toString().replaceAll('{0:user}', '')));
      });
      SocketService.socket?.on('social', (data) {
        final CommentModel comment = _parseModel(data);
        socialListener(comment.copyWith(
            comment: data['label'].toString().replaceAll('{0:user}', '')));
      });
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
