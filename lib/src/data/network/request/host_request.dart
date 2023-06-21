
import 'package:tiktok_tool/src/network/request.dart';

class GetHostsRequest extends XRestRequest {
  @override
  String get path => 'api/host';

  @override
  XRestRequestType get type => XRestRequestType.get;

}

class GetHostDetailRequest extends XRestRequest {
  final String hostId;

  @override
  String get path => 'api/host/$hostId';

  @override
  XRestRequestType get type => XRestRequestType.get;


  GetHostDetailRequest({required this.hostId});
}