import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';

mixin DynamicLayout {
  Widget buildDynamicLayout(BuildContext context) {
    return XLayoutBuilder(
      portraitBuilder: buildPortraitLayout,
      largePortraitBuilder: buildLargePortraitLayout,
      smallLandscapeBuilder: buildSmallLandscapeLayout,
      landscapeBuilder: buildLandscapeLayout,
    );
  }

  Widget buildPortraitLayout(BuildContext context);

  Widget buildLargePortraitLayout(BuildContext context) {
    return buildPortraitLayout(context);
  }

  Widget buildSmallLandscapeLayout(BuildContext context) {
    return buildPortraitLayout(context);
  }

  Widget buildLandscapeLayout(BuildContext context) {
    return buildPortraitLayout(context);
  }
}
