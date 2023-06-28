import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tiktok_tool/src/app.dart';
import 'package:tiktok_tool/src/data/repository/host_repository_impl.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/http.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/router/auto_route.dart';
import 'package:tiktok_tool/src/theme/colors.dart';
import 'package:tiktok_tool/src/theme/theme.dart';

void run() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);

  await _registerDI();
  await XDI.I<XRestService>().setup();
  _setupEasyLoading();

  Bloc.observer = AppBlocObserver();
  runApp(const TiktokApp());
}

Future _registerDI() async {
  XDI.I.registerSingleton(XRouter());
  XDI.I.registerLazySingleton<XRestService>(() => XRestService());

  // Repository
  _registerRepository();

  // Bloc
  _registerBloc();
}

void _registerBloc() {
  XDI.I.registerLazySingleton(() => AccountBloc());
  XDI.I.registerLazySingleton(() => StreamStatusBloc());
}

void _registerRepository() {
  XDI.I
      .registerLazySingleton<HostRepository>(() => HostRepositoryImpl(XDI.I()));
}

void _setupEasyLoading() {
  final instance = EasyLoading.instance;
  instance.loadingStyle = EasyLoadingStyle.custom;
  instance.toastPosition = EasyLoadingToastPosition.top;
  instance.backgroundColor = XColors.primaryColors;
  instance.progressColor = XColors.white;
  instance.indicatorColor = XColors.white;
  instance.textColor = XColors.white;
  instance.boxShadow = [];
  instance.textStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: XColors.white,
    fontSize: 16,
  );
  instance.dismissOnTap = false;
  instance.userInteractions = false;
  instance.maskType = EasyLoadingMaskType.custom;
  instance.maskColor = XColors.black.withOpacity(0.5);
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // logI(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // logI(transition);
  }
}
