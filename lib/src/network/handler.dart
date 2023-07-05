import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:tiktok_tool/src/utils/log.dart';

import '../data/network/dto/base_response_dto.dart';
import 'exception.dart';
import 'http.dart';
import 'request.dart';
import 'result.dart';

export 'common_error_handler.dart';

typedef XDataTransform<T> = T Function(dynamic json);

class XApiHandler {
  final XRestService restService;

  XApiHandler({required this.restService});

  Future<XApiSnapshot<T>> execute<T>(
      XRestRequest request, XDataTransform<T> transform) async {
    try {
      final response = await restService.execute(request);
      if (response.isUnAuthorize()) {
        response.catchUnAuthorize();
        return XApiSnapshot.withError(XHttpException(null), 'Vui lòng đăng nhập lại');
      }
      final BaseResponseDTO baseResponseDTO;
      if (kIsWeb) {
        baseResponseDTO = BaseResponseDTO.fromJson(jsonDecode(response.body));
      } else {
        baseResponseDTO = await Isolate.run(
            () => BaseResponseDTO.fromJson(jsonDecode(response.body)));
      }
      if (response.isSuccess() && baseResponseDTO.status == true) {
        T data;
        if (kIsWeb) {
          data = transform.call(baseResponseDTO.data);
        } else {
          data = await Isolate.run(() => transform.call(baseResponseDTO.data));
        }
        return XApiSnapshot.withData(data);
      } else {
        return XApiSnapshot.withError(
            XHttpException(response), baseResponseDTO.error);
      }
    } catch (e, s) {
      logE(e, null, s);
      return XApiSnapshot.withError(e, null, s);
    }
  }
}
