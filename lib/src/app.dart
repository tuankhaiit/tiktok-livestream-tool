

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_tool/src/router/auto_route.dart';
import 'package:tiktok_tool/src/router/route_observer.dart';
import 'package:tiktok_tool/src/theme/theme.dart';

import '../widget/loading.dart';
import 'di/di.dart';
import 'localization/utils.dart';
import 'presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => StreamStatusBloc()),
      ],
      child: _buildMaterialApp(context),
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    final appRouter = XDI.I<XRouter>();
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
      builder: XLoading.init(),
    );
  }

}