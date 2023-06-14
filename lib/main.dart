import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/app.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/network/http.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/router/auto_route.dart';
import 'package:tiktok_tool/src/theme/theme.dart';
import 'package:tiktok_tool/src/utils/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);

  await _registerDI();
  await XDI.I<XRestService>().setup();

  Bloc.observer = AppBlocObserver();
  runApp(const TiktokApp());
}

Future _registerDI() async {
  XDI.I.registerSingleton(XRouter());
  XDI.I.registerLazySingleton<XRestService>(() => XRestService());

  // Repository
  _registerRepository();

  // Bloc
  XDI.I.registerLazySingleton(() => StreamStatusBloc());
}

void _registerRepository() {

}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logI(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logI(transition);
  }
}
