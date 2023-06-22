import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

class MyAppBar extends AppBar {
  // final List<Widget>? actions;

  MyAppBar({
    super.key,
    super.leading,
    super.title,
    List<Widget>? actions,
    super.elevation,
    super.backgroundColor,
    super.foregroundColor,
    super.centerTitle,
    super.toolbarHeight,
  }) : super(actions: _getActions(actions));
}

List<Widget> _getActions(List<Widget>? actions) {
  return [
    ...?actions,
    IconButton(
      onPressed: () {
        XNavigator.home(XNavigator.context);
      },
      icon: const Icon(Icons.home),
    ),
  ];
}
