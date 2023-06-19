
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_tool/src/router/routes.dart';

import 'auto_route.dart';

class XNavigator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  static Future<dynamic> home(BuildContext context) {
    context.router.removeWhere((route) => route.name == SplashRoute.name);
    return context.router.pushNamed(XRoutes.home);
  }

  static Future<dynamic> livestream(BuildContext context) {
    return context.router.pushNamed(XRoutes.livestream);
  }

  static Future<dynamic> host(BuildContext context) {
    return context.router.pushNamed(XRoutes.host);
  }

  static Future<dynamic> room(BuildContext context, String uniqueId) {
    return context.router.push(RoomRoute(uniqueId: uniqueId));
  }

  static Future<dynamic> comment(BuildContext context, String roomId) {
    return context.router.push(CommentRoute(roomId: roomId));
  }
}
