
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_tool/src/router/routes.dart';

import 'auto_route.dart';

class XNavigator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  // static Future<dynamic> dev(BuildContext context) {
  //   return context.router.push(const DevRoute());
  // }
  //
  // static Future<dynamic> login(BuildContext context) {
  //   return context.router.pushNamed(XRoutes.login);
  // }

  static Future<dynamic> home(BuildContext context) {
    context.router.removeWhere((route) => route.name != SplashRoute.name);
    return context.router.pushNamed(XRoutes.home);
  }
}
