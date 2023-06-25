import '../../../network/request.dart';

class BasicAuthenticationRequest extends XRestRequest {
  @override
  String get path => 'api/login';

  @override
  XRestRequestType get type => XRestRequestType.post;

  BasicAuthenticationRequest({required String username, required String password}) {
    body = {'username': username, 'password': password};
  }
}
