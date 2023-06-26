import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

class XLayoutBuilder extends StatelessWidget {
  final WidgetBuilder portraitBuilder;
  final WidgetBuilder? largePortraitBuilder;
  final WidgetBuilder? smallLandscapeBuilder;
  final WidgetBuilder? landscapeBuilder;

  const XLayoutBuilder({
    super.key,
    required this.portraitBuilder,
    this.largePortraitBuilder,
    this.smallLandscapeBuilder,
    this.landscapeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final maxHeight = constraints.maxHeight;
      if (maxWidth < 600) {
        return portraitBuilder(context);
      } else if (maxHeight < 480) {
        return smallLandscapeBuilder?.call(context) ?? portraitBuilder(context);
      } else if (maxWidth < 840) {
        return largePortraitBuilder?.call(context) ?? portraitBuilder(context);
      } else {
        return landscapeBuilder?.call(context) ?? portraitBuilder(context);
      }
    });
  }
}

class XSinglePageLayoutBuilder extends StatelessWidget {
  final Widget child;

  const XSinglePageLayoutBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: context.color.background,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 840),
        color: context.theme.scaffoldBackgroundColor,
        child: child,
      ),
    );
  }
}
