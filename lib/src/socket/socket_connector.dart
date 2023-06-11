import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tiktok_tool/src/utils/log.dart';

import '../domain/model/comment.dart';

typedef CommentListener = void Function(CommentModel comment);

class SocketService {
  static IO.Socket? socket;

  static void connectSocket() {
    IO.Socket socket = IO.io('http://192.168.88.254:8081', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.onConnect((_) {
      logD('Server Connected');
    });
    socket.onError((data) => logD(data.toString()));
    // The host end livestream
    socket.on('streamEnd', (_) {
      logD('The host end livestream');
      offLivestreamListen();
    });
    socket.on('tiktokDisconnected', (_) {
      logD('End stream');
      offLivestreamListen();
    });
    socket.onDisconnect((_) => logD('Server Disconnected'));
    SocketService.socket = socket;
    socket.connect();
  }

  static void connectLivestream() {
    socket?.emit('setUniqueId', '@408gosh');
    socket?.once('tiktokConnected', (data) {
      logD('Start stream: roomId=${data['roomId']}');
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

  static void listenComment(CommentListener? commentListener, CommentListener? socialListener) {
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
