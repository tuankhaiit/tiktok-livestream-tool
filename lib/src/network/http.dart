import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiktok_tool/src/network/request.dart';

import '../utils/log.dart';


class XRestService {
  static const int _timeout = 120;

  late String? domain;
  Map<String, String>? headers;

  Future setup() async {
    headers = {
      'User-Agent': 'okHttp/4.x Android',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Uri _uriOf(String path, [Map<String, String>? queries]) {
    String parameters = '';
    if (queries != null && queries.isNotEmpty) {
      parameters = path.contains('?') ? '&' : '?';
      queries.forEach((key, value) {
        parameters += '&$key=$value';
      });
    }
    final uri = Uri.parse('$domain/$path$parameters');
    return uri;
  }

  Future<http.Response> execute(XRestRequest request) async {
    final path = '${request.service}/${request.path}';
    if (request.type == XRestRequestType.get) {
      return get(path, queries: request.queries);
    } else if (request.type == XRestRequestType.post) {
      return post(path, queries: request.queries, body: request.body);
    }
    return throw FlutterError(
        'Not support request type = ${request.type.toString()}');
  }

  Future<http.Response> get(String path, {Map<String, String>? queries}) async {
    logD(headers);
    try {
      final uri = _uriOf(path);
      logI('> GET REQUEST <${uri.toString()}>');
      final response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: _timeout));
      logI(
          '> GET RESPONSE [${response.statusCode}]<${uri.toString()}\n${response.body}');
      return response;
    } catch (e) {
      logW('> API CATCH Exception< $e');
      rethrow;
    }
  }

  Future<http.Response> post(String path,
      {Map<String, String>? queries, Object? body}) async {
    try {
      final uri = _uriOf(path);
      logI('> POST REQUEST [${uri.toString()}]< BODY = $body');
      final response = await http
          .post(uri, body: body, headers: headers)
          .timeout(const Duration(seconds: _timeout));
      logI(
          '> POST RESPONSE [${response.statusCode}]< $path ${response.body}');
      return response;
    } catch (e) {
      logW('> API CATCH Exception< $e');
      rethrow;
    }
  }
}

extension ResponseExtension on http.Response {
  bool isSuccess() => statusCode <= 299;
}
