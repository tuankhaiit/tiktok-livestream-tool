import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

extension XStylesExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

class XStyles {
  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: XFonts.myriadpro,
  );

  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: XFonts.myriadpro,
  );

  static const inputStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: XFonts.myriadpro,
  );

  static TextTheme get textTheme {
    return const TextTheme(
        // titleMedium: inputStyle,
        bodyLarge: inputStyle,
        // bodyMedium: body,
        // bodyLarge: bodyBold,
        // labelSmall: button,
        );
  }
}
