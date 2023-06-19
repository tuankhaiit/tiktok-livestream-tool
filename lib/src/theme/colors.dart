import 'package:flutter/material.dart';

extension XColorExtensions on BuildContext {
  ColorScheme get color {
    return Theme.of(this).colorScheme;
  }
}

class XColors {
  XColors._();

  static const Color primaryColors = greenColor;

  static const redColor = Color(0xFFE21838);
  static const orangeColor = Color(0xFFF78B10);
  static const greenColor = Color(0xFF008fff);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Background
  static const background = Color(0xFFFFFFFF);
  static const scaffoldBackground = Color(0xFFF6F7FB);

  // Text color
  static const textBlack = Color(0xFF363636);
  static const textGreyLight = Color(0xFFAFAFAF);
  static const textWhite = Color(0xFFFFFFFF);

  static const foreground = Color(0xFF000000);
  static final foreground5 = Colors.grey[50];
  static final foreground10 = Colors.grey[100];
  static final foreground20 = Colors.grey[200];
  static final foreground30 = Colors.grey[300];
  static final foreground35 = Colors.grey[350];
  static final foreground40 = Colors.grey[400];
  static final foreground50 = Colors.grey[500];
  static final foreground60 = Colors.grey[600];
  static final foreground70 = Colors.grey[700];
  static final foreground80 = Colors.grey[800];
  static final foreground85 = Colors.grey[850];
  static final foreground90 = Colors.grey[900];
  static const foreground100 = Colors.white;

  // Icons color
  static const iconBlack = Color(0xFF414141);

  static const divider = Color(0xFFDBDBDB);
  static const link = Color(0xFF005BAE);
}
