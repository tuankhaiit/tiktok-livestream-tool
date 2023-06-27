import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/widget/dialog.dart';

class ChangeServerDialog {
  static Future<dynamic> show(BuildContext context) {
    return XDialog.showBuilderDialog(context, (context) => Container());
  }
}
