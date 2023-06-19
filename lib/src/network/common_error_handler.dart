import 'dart:async';
import 'package:tiktok_tool/src/utils/log.dart';

import 'result.dart';

extension XAPICommonErrorHandler<T> on Future<XApiSnapshot<T>> {
  Future<XApiSnapshot<T>> catchData(Function(T data) onData) async {
    return then((value) {
      if (value.hasData) {
        onData.call(value.data as T);
        return const XApiSnapshot.nothing();
      }
      return Future.value(value);
    });
  }

  Future<XApiSnapshot<T>> catchUnExpectError() async {
    return then((value) {
      if (value.hasError) {
        logE(value.error, value.stackTrace);
        return const XApiSnapshot.nothing();
      }
      return Future.value(value);
    });
  }
}
