import 'package:tiktok_tool/src/network/request.dart';

class GetCommentsByHostRequest extends XRestRequest {
  final String hostId;
  final String? uniqueId;

  @override
  String get path => 'api/host/$uniqueId/comment';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetCommentsByHostRequest({required this.hostId, this.uniqueId}) {
    if (uniqueId != null) {
      queries = {
        'uniqueId': uniqueId ?? '',
      };
    }
  }
}

class GetCommentsByRoomRequest extends XRestRequest {
  final String roomId;
  final String? uniqueId;

  @override
  String get path => 'api/room/$roomId/comment';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetCommentsByRoomRequest({required this.roomId, this.uniqueId}) {
    if (uniqueId != null) {
      queries = {
        'uniqueId': uniqueId ?? '',
      };
    }
  }
}
