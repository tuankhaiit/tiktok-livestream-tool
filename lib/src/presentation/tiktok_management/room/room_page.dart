import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/widget/room_list.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/presentation/widget/action.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';

@RoutePage()
class RoomPage extends StatelessWidget with DynamicLayout {
  final String hostId;

  const RoomPage({super.key, required this.hostId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Phiên Livestream'),
        actions: [
          PotentialUserActionWidget(
            key: const ValueKey('room_page_users_action'),
            hostId: hostId,
          )
        ],
      ),
      body: Column(
        children: [
          const StreamStatusBarWidget(),
          Divider(color: context.color.background),
          Expanded(child: buildDynamicLayout(context))
        ],
      ),
    );
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return XSinglePageLayoutBuilder(
      child: Column(
        children: [
          HostProfileWidget(hostId: hostId),
          Divider(color: context.color.background),
          Expanded(child: RoomListWidget(hostId: hostId))
        ],
      ),
    );
  }
}
