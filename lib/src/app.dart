import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/presentation/account/account_state.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/router/auto_route.dart';
import 'package:tiktok_tool/src/router/navigator.dart';
import 'package:tiktok_tool/src/router/route_observer.dart';
import 'package:tiktok_tool/src/theme/theme.dart';

import 'di/di.dart';
import 'localization/utils.dart';

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => XDI.I<AccountBloc>(),
          lazy: false,
        ),
        BlocProvider(create: (_) => XDI.I<StreamStatusBloc>()),
      ],
      child: _buildMaterialApp(),
    );
  }

  Widget _buildMaterialApp() {
    final appRouter = XDI.I<XRouter>();
    return BlocListener<AccountBloc, AccountState>(
      listener: (_, state) {
        final context = appRouter.navigatorKey.currentState?.context;
        if (context == null) return;
        final current = appRouter.current.name;
        const splash = SplashRoute.name;
        const login = LoginRoute.name;
        if (state.isAnonymous) {
          if (current != splash && current != login) {
            appRouter.removeWhere((route) => true);
            XNavigator.login(context);
          }
        }
      },
      child: Sizer(
        builder: (context, _, __) {
          return MaterialApp.router(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('vi', ''),
            ],
            onGenerateTitle: (BuildContext context) => S.of(context).appName,
            theme: XTheme.light(),
            darkTheme: XTheme.light(),
            routeInformationParser:
                appRouter.defaultRouteParser(includePrefixMatches: true),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [XRouteObserver()],
            ),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
