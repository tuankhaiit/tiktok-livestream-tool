// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_route.dart';

abstract class _$XRouter extends RootStackRouter {
  // ignore: unused_element
  _$XRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    HostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HostPage(),
      );
    },
    StreamRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StreamPage(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomPage(
          key: args.key,
          uniqueId: args.uniqueId,
        ),
      );
    },
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentPage(
          key: args.key,
          roomId: args.roomId,
        ),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HostPage]
class HostRoute extends PageRouteInfo<void> {
  const HostRoute({List<PageRouteInfo>? children})
      : super(
          HostRoute.name,
          initialChildren: children,
        );

  static const String name = 'HostRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StreamPage]
class StreamRoute extends PageRouteInfo<void> {
  const StreamRoute({List<PageRouteInfo>? children})
      : super(
          StreamRoute.name,
          initialChildren: children,
        );

  static const String name = 'StreamRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomPage]
class RoomRoute extends PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    Key? key,
    required String uniqueId,
    List<PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            uniqueId: uniqueId,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<RoomRouteArgs> page = PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.uniqueId,
  });

  final Key? key;

  final String uniqueId;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, uniqueId: $uniqueId}';
  }
}

/// generated route for
/// [CommentPage]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    Key? key,
    required String roomId,
    List<PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            key: key,
            roomId: roomId,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentRoute';

  static const PageInfo<CommentRouteArgs> page =
      PageInfo<CommentRouteArgs>(name);
}

class CommentRouteArgs {
  const CommentRouteArgs({
    this.key,
    required this.roomId,
  });

  final Key? key;

  final String roomId;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, roomId: $roomId}';
  }
}
