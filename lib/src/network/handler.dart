import 'dart:convert';
import 'dart:isolate';

import 'http.dart';
import 'result.dart';
import 'exception.dart';
export 'common_error_handler.dart';
import 'request.dart';

typedef XDataTransform<T> = T Function(dynamic json);

class XApiHandler {
  final XRestService restService;

  XApiHandler({required this.restService});

  Future<XApiSnapshot<T>> execute<T>(
      XRestRequest request, XDataTransform<T> transform) async {
    return const XApiSnapshot.nothing();
    // try {
    //   final response = await restService.execute(request);
    //   final baseResponseDTO = await Isolate.run(
    //       () => BaseResponseDTO.fromJson(jsonDecode(response.body)));
    //   if (response.isSuccess() && baseResponseDTO.status == 'true') {
    //     T data = await Isolate.run(() => transform.call(baseResponseDTO.data));
    //     return XApiSnapshot.withData(data);
    //   } else {
    //     return XApiSnapshot.withError(XHttpException(response),
    //         baseResponseDTO.error, baseResponseDTO.message);
    //   }
    // } catch (e, s) {
    //   return XApiSnapshot.withError(e, null, null, s);
    // }
  }
}
