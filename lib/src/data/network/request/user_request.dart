import 'package:tiktok_tool/src/network/request.dart';

class GetPotentialUsersByHostRequest extends XRestRequest {
  final String hostId;

  @override
  String get path => 'host/$hostId/potentialUser';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetPotentialUsersByHostRequest({required this.hostId});
}

class GetPotentialUsersByRoomRequest extends XRestRequest {
  final String roomId;

  @override
  String get path => 'room/$roomId/potentialUser';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetPotentialUsersByRoomRequest({required this.roomId});
}

class GetUserProfileRequest extends XRestRequest {
  final String uniqueId;

  @override
  String get path => 'user/$uniqueId';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetUserProfileRequest({required this.uniqueId});
}

