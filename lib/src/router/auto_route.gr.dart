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
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentPage(
          key: args.key,
          hostId: args.hostId,
          roomId: args.roomId,
          uniqueId: args.uniqueId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HostPage(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomPage(
          key: args.key,
          hostId: args.hostId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    StreamRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StreamPage(),
      );
    },
    PotentialUsersRoute.name: (routeData) {
      final args = routeData.argsAs<PotentialUsersRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PotentialUsersPage(
          key: args.key,
          uniqueId: args.uniqueId,
          roomId: args.roomId,
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserProfilePage(
          key: args.key,
          uniqueId: args.uniqueId,
        ),
      );
    },
  };
}

/// generated route for
/// [CommentPage]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    Key? key,
    required String? hostId,
    required String? roomId,
    required String? uniqueId,
    List<PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            key: key,
            hostId: hostId,
            roomId: roomId,
            uniqueId: uniqueId,
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
    required this.hostId,
    required this.roomId,
    required this.uniqueId,
  });

  final Key? key;

  final String? hostId;

  final String? roomId;

  final String? uniqueId;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, hostId: $hostId, roomId: $roomId, uniqueId: $uniqueId}';
  }
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
/// [RoomPage]
class RoomRoute extends PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    Key? key,
    required String hostId,
    List<PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            hostId: hostId,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<RoomRouteArgs> page = PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.hostId,
  });

  final Key? key;

  final String hostId;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, hostId: $hostId}';
  }
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
/// [PotentialUsersPage]
class PotentialUsersRoute extends PageRouteInfo<PotentialUsersRouteArgs> {
  PotentialUsersRoute({
    Key? key,
    required String? uniqueId,
    required String? roomId,
    List<PageRouteInfo>? children,
  }) : super(
          PotentialUsersRoute.name,
          args: PotentialUsersRouteArgs(
            key: key,
            uniqueId: uniqueId,
            roomId: roomId,
          ),
          initialChildren: children,
        );

  static const String name = 'PotentialUsersRoute';

  static const PageInfo<PotentialUsersRouteArgs> page =
      PageInfo<PotentialUsersRouteArgs>(name);
}

class PotentialUsersRouteArgs {
  const PotentialUsersRouteArgs({
    this.key,
    required this.uniqueId,
    required this.roomId,
  });

  final Key? key;

  final String? uniqueId;

  final String? roomId;

  @override
  String toString() {
    return 'PotentialUsersRouteArgs{key: $key, uniqueId: $uniqueId, roomId: $roomId}';
  }
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    Key? key,
    required String uniqueId,
    List<PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(
            key: key,
            uniqueId: uniqueId,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<UserProfileRouteArgs> page =
      PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.uniqueId,
  });

  final Key? key;

  final String uniqueId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, uniqueId: $uniqueId}';
  }
}
