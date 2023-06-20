import 'package:tiktok_tool/src/network/request.dart';

class GetRoomsByHostRequest extends XRestRequest {
  @override
  String get path => 'room';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetRoomsByHostRequest(String hostId) {
    queries = {'hostId': hostId};
  }
}
