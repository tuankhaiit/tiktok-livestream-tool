import 'package:flutter/material.dart';

class DismissKeyboardWidget extends StatelessWidget {
  final Widget child;

  const DismissKeyboardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.dismissKeyboard();
      },
      child: child,
    );
  }
}

extension FocusNodeExtensions on BuildContext {
  dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus &&
        currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}