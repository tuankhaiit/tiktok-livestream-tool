import 'package:tiktok_tool/src/configuration/env/ENV.dart';

import 'setup.dart' as setup;

void main() async {
  ENV.isDebug = true;

  setup.run();
}