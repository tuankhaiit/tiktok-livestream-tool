import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiktok_tool/src/configuration/env/ENV.dart';
import 'package:tiktok_tool/src/network/request.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../utils/log.dart';

class XRestService {
  static const int _timeout = 120;
  static const String _domain = ENV.apiServer;
  static const String _tokenKey = 'Authorization';

  late final Map<String, String> _headers;

  Future setup() async {
    _headers = {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
  }

  void addAuthorization(String token) {
    _headers[_tokenKey] = token;
  }

  void removeAuthorization() {
    _headers.remove(_tokenKey);
  }

  Uri _uriOf(String path, [Map<String, String>? queries]) {
    String parameters = '';
    if (queries != null && queries.isNotEmpty) {
      parameters = path.contains('?') ? '&' : '?';
      queries.forEach((key, value) {
        parameters += '&$key=$value';
      });
    }
    final uri = Uri.parse('$_domain/$path$parameters');
    return uri;
  }

  Future<http.Response> execute(XRestRequest request) async {
    final path = request.path;
    if (request.type == XRestRequestType.get) {
      return get(path, queries: request.queries);
    } else if (request.type == XRestRequestType.post) {
      return post(path, queries: request.queries, body: request.body);
    }
    return throw FlutterError(
        'Not support request type = ${request.type.toString()}');
  }

  Future<http.Response> get(String path, {Map<String, String>? queries}) async {
    try {
      final uri = _uriOf(path, queries);
      logI('> GET REQUEST <${uri.toString()}>');
      final response = await http
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: _timeout));
      logI(
          '> GET RESPONSE [${response.statusCode}]<${uri.toString()}\n${response.body}');
      return response;
    } catch (e) {
      logW('> API CATCH Exception< ${e.toString()}');
      rethrow;
    }
  }

  Future<http.Response> post(String path,
      {Map<String, String>? queries, Object? body}) async {
    try {
      final uri = _uriOf(path, queries);
      logI('> POST REQUEST [${uri.toString()}]< BODY = $body');
      final response = await http
          .post(uri, body: body, headers: _headers)
          .timeout(const Duration(seconds: _timeout));
      logI('> POST RESPONSE [${response.statusCode}]< $path ${response.body}');
      return response;
    } catch (e) {
      logW('> API CATCH Exception< $e');
      rethrow;
    }
  }
}

extension ResponseExtension on http.Response {
  bool isSuccess() => statusCode <= 299;

  bool isUnAuthorize() {
    return statusCode == 401 || statusCode == 403;
  }

  http.Response catchUnAuthorize() {
    if (isUnAuthorize()) {
      XNavigator.login(XNavigator.context);
    }
    return this;
  }
}
