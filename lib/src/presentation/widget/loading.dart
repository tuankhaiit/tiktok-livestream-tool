import 'package:flutter_easyloading/flutter_easyloading.dart';

class XToast {
  static Future<void> showToast(
    String status, {
    Duration? duration,
    EasyLoadingToastPosition? toastPosition = EasyLoadingToastPosition.top,
    EasyLoadingMaskType? maskType = EasyLoadingMaskType.none,
    bool? dismissOnTap = true,
  }) {
    return EasyLoading.showToast(
      status,
      duration: duration,
      toastPosition: toastPosition,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }
}
