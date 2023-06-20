import 'package:tiktok_tool/src/network/request.dart';

class GetCommentsByHostRequest extends XRestRequest {
  final String uniqueId;

  @override
  String get path => 'host/$uniqueId/comment';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetCommentsByHostRequest({required this.uniqueId});
}

class GetCommentsByRoomRequest extends XRestRequest {
  final String roomId;

  @override
  String get path => 'room/$roomId/comment';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetCommentsByRoomRequest({required this.roomId});
}
