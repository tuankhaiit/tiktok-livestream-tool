
import 'package:tiktok_tool/src/network/request.dart';

class GetAllHostRequest extends XRestRequest {
  @override
  String get path => 'host';

  @override
  XRestRequestType get type => XRestRequestType.get;

}