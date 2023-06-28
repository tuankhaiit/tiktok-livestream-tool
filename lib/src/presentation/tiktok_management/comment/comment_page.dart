import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/comment/widget/comment_list.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../../widget/action.dart';
import '../../widget/appbar.dart';
import '../stream_container/stream_status/widget/stream_status_bar.dart';

@RoutePage()
class CommentPage extends StatelessWidget with DynamicLayout {
  final String? hostId;
  final String? roomId;
  final String? uniqueId;

  const CommentPage({
    super.key,
    required this.hostId,
    required this.roomId,
    required this.uniqueId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Bình luận'),
        actions: _buildActions(context),
      ),
      body: Column(
        children: [
          const StreamStatusBarWidget(),
          Divider(color: context.color.background),
          Expanded(child: buildDynamicLayout(context)),
        ],
      ),
    );
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return Column(
      children: [
        HostProfileWidget(hostId: hostId, roomId: roomId),
        Expanded(
          child: CommentListWidget(
            hostId: hostId,
            roomId: roomId,
            uniqueId: uniqueId,
            onCommentTap: (comment) {
              XNavigator.comment(context, hostId, roomId, comment.uniqueId);
            },
          ),
        )
      ],
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      if (uniqueId == null)
        PotentialUserActionWidget(hostId: hostId, roomId: roomId)
    ];
  }
}
