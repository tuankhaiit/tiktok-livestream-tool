import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configuration/constant/constants.dart';
import '../utils/color_utils.dart';
import 'colors.dart';
import 'fonts.dart';
import 'styles.dart';

extension XThemExtensions on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

class XTheme {
  static const barOverLayStyle = SystemUiOverlayStyle.dark;

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        fontFamily: XFonts.myriadpro,

        /// Colors
        primarySwatch: ColorUtils.generateMaterialColor(XColors.primaryColors),
        primaryColor: XColors.primaryColors,
        brightness: Brightness.light,
        textTheme: XStyles.textTheme,
        scaffoldBackgroundColor: XColors.scaffoldBackground,
        dividerColor: XColors.divider,
        dividerTheme: const DividerThemeData(
          color: XColors.divider,
          thickness: 1,
          space: 0
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: XColors.foreground,
        ),

        /// ColorScheme
        colorScheme: const ColorScheme.light(
            primary: XColors.primaryColors,
            onPrimary: XColors.white,
            secondary: XColors.primaryColors,
            background: XColors.background),

        /// Appbar
        appBarTheme: AppBarTheme(
          // default system appbar icon is white
          systemOverlayStyle: barOverLayStyle,
          centerTitle: true,
          shadowColor: XColors.black.withOpacity(0.5),
          backgroundColor: XColors.white,
          surfaceTintColor: XColors.white,
          elevation: 4,
          iconTheme: const IconThemeData(color: XColors.black),
          actionsIconTheme: const IconThemeData(color: XColors.black),
          titleTextStyle: XStyles.title.copyWith(color: Colors.black),
        ),

        /// Checkbook
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return XColors.link;
            }
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return XColors.link;
            }
          }),
        ),

        /// Input Decoration
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: XColors.textGreyLight,
            fontWeight: FontWeight.w300
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(K.borderRadius),
            borderSide: const BorderSide(
              color: XColors.divider,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(K.borderRadius),
            borderSide: const BorderSide(
              color: XColors.divider,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(K.borderRadius),
            borderSide: const BorderSide(
              color: XColors.divider,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(K.borderRadius),
            borderSide: const BorderSide(
              color: XColors.divider,
              width: 1,
            ),
          ),
        ),

        /// Button
        buttonTheme: const ButtonThemeData(
          height: K.buttonHeight,
        ),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
          fixedSize: const Size.fromHeight(K.buttonHeight),
          textStyle: XStyles.button,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(K.buttonHeight),
            textStyle: XStyles.button,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: XStyles.button,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(K.buttonHeight),
            textStyle: XStyles.button,
          ),
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),

        /// Icons
        iconTheme: const IconThemeData(
          color: XColors.iconBlack,
        ),
      );

  static ThemeData dark() => ThemeData.dark();
}
