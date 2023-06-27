import 'package:tiktok_tool/src/network/request.dart';

class GetHostsRequest extends XRestRequest {
  @override
  String get path => 'api/host';

  @override
  XRestRequestType get type => XRestRequestType.get;
}

class GetHostDetailRequest extends XRestRequest {
  final String? hostId;
  final String? roomId;

  @override
  String get path => hostId != null ? 'api/host/$hostId' : 'api/host';

  @override
  XRestRequestType get type => XRestRequestType.get;

  GetHostDetailRequest({this.hostId, this.roomId}) {
    if (roomId != null) {
      queries = {
        'roomId': roomId ?? '',
      };
    }
  }
}

class DeleteHostAssignmentRequest extends XRestRequest {
  @override
  String get path => 'api/hostAssignment/remove';

  @override
  XRestRequestType get type => XRestRequestType.get;

  DeleteHostAssignmentRequest(
      {required String? accountId, required String? hostId}) {
    queries = {
      'accountId': accountId ?? '',
      'hostId': hostId ?? '',
    };
  }
}
