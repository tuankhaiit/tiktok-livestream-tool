import 'package:tiktok_tool/src/network/request.dart';

class GetRoomDetailRequest extends XRestRequest {
  final String roomId;

  @override
  String get path => 'api/room/$roomId';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetRoomDetailRequest({required this.roomId});
}

class GetRoomsRequest extends XRestRequest {
  final String hostId;

  @override
  String get path => 'api/host/$hostId/room';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetRoomsRequest({required this.hostId});
}
