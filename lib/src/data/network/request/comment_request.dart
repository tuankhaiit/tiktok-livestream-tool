import 'package:tiktok_tool/src/network/request.dart';

class GetCommentByRoomRequest extends XRestRequest {
  final String roomId;

  @override
  String get path => 'room/$roomId/comment';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetCommentByRoomRequest({required this.roomId});
}
