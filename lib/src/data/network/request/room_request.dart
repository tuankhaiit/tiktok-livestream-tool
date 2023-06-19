import 'package:tiktok_tool/src/network/request.dart';

class GetRoomByHostRequest extends XRestRequest {
  @override
  String get path => 'room';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetRoomByHostRequest(String uniqueId) {
    queries = {'uniqueId': uniqueId};
  }
}
