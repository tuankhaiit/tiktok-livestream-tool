import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

enum XDialogActions {
  ok,
  cancel,
  delete,
}

class XDialogAction {
  final Widget child;
  final VoidCallback? onTap;
  final bool? dismissOnTap;

  XDialogAction(this.child, {this.onTap, this.dismissOnTap});

  factory XDialogAction.ok(BuildContext context, {VoidCallback? onTap}) =>
      XDialogAction(
        Text(
          'OK',
          style: TextStyle(color: context.color.primary),
        ),
        onTap: onTap,
        dismissOnTap: true,
      );

  factory XDialogAction.cancel(BuildContext context, {VoidCallback? onTap}) =>
      XDialogAction(
        Text(
          'Hủy',
          style: TextStyle(color: context.color.onBackground),
        ),
        onTap: onTap,
        dismissOnTap: true,
      );

  factory XDialogAction.delete(
    BuildContext context, {
    VoidCallback? onTap,
  }) =>
      XDialogAction(
        Text(
          'Xóa',
          style: TextStyle(color: context.color.error),
        ),
        onTap: onTap,
        dismissOnTap: true,
      );
}

class XDialog {
  XDialog._();

  static Future<dynamic> showDeleteConfirm(BuildContext context,
      {required Widget child, required VoidCallback deleteOnTap}) {
    return showBuilderDialog(context, (context) {
      return _ActionDialogWidget(
        actions: [
          XDialogAction.cancel(context),
          XDialogAction.delete(context, onTap: deleteOnTap),
        ],
        child: child,
      );
    });
  }

  static Future<dynamic> showActionDialog(BuildContext context,
      {required Widget child, Iterable<XDialogAction>? actions}) {
    return showBuilderDialog(context, (context) {
      return _ActionDialogWidget(
        actions: actions,
        child: child,
      );
    });
  }

  static Future<dynamic> showBuilderDialog(
      BuildContext context, WidgetBuilder builder) {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'CommonDialog',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, __, ___) {
        return builder(context);
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, .3), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, .3), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}

class _ActionDialogWidget extends StatelessWidget {
  final double radius = 12.0;
  final Widget child;
  final Iterable<XDialogAction>? actions;

  const _ActionDialogWidget({super.key, required this.child, this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          constraints: BoxConstraints(maxWidth: min(500, 85.w)),
          decoration: BoxDecoration(
            color: context.theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  color: context.color.onBackground,
                  fontSize: 16,
                  height: 1.6
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minHeight: 120),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: child,
                ),
              ),
              if (actions?.isNotEmpty == true) ..._buildActions(context)
            ],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> _buildActions(BuildContext context) {
    return [
      Divider(color: context.theme.dividerColor),
      DefaultTextStyle(
        style: TextStyle(
            color: context.color.onBackground,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            ),
          ),
          child: Row(
            children: [
              ...(actions?.map(
                    (e) => _buildAction(context, e),
                  ) ??
                  [])
            ],
          ),
        ),
      )
    ];
  }

  Widget _buildAction(BuildContext context, XDialogAction action) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          action.onTap?.call();
          if (action.dismissOnTap == true) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minHeight: 50),
          child: action.child,
        ),
      ),
    );
  }
}
