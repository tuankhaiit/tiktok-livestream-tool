import 'package:http/http.dart' as http;

class XHttpException implements Exception {
  final http.Response? response;
  XHttpException(this.response);

  @override
  String toString() {
    Object? message = response?.body;
    if (message == null) return "XHttpException";
    return "XHttpException: $message";
  }
}