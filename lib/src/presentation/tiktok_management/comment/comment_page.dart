import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/comment.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';
import 'package:tiktok_tool/src/presentation/widget/room.dart';
import 'package:tiktok_tool/src/presentation/widget/scroll.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../../../di/di.dart';
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
    return XSinglePageLayoutBuilder(
      child: Column(
        children: [
          HostProfileWidget(hostId: hostId, roomId: roomId),
          Expanded(child: _buildComments(context))
        ],
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      if (uniqueId == null)
        PotentialUserActionWidget(hostId: hostId, roomId: roomId)
    ];
  }

  Widget _buildComments(BuildContext context) {
    late final Future<XApiSnapshot<Iterable<CommentModel>>> feature;
    if (hostId != null) {
      feature =
          XDI.I.get<HostRepository>().getCommentsByHost(hostId ?? '', uniqueId);
    } else {
      feature =
          XDI.I.get<HostRepository>().getCommentsByRoom(roomId ?? '', uniqueId);
    }
    return FutureBuilder<XApiSnapshot<Iterable<CommentModel>>>(
      future: feature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.requireData;
          if (data.hasData) {
            final comments = data.requireData;
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.color.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      DefaultTextStyle(
                        style: context.textTheme.titleSmall
                                ?.copyWith(color: context.color.onPrimary) ??
                            const TextStyle(),
                        child: Expanded(
                          child: roomId != null
                              ? RoomInfoWidget(roomId: roomId!)
                              : Container(),
                        ),
                      ),
                      Text(
                        '${NumberFormat.compact().format(comments.length)}  bình luận',
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: context.color.onPrimary),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: Scrollbar(
                      thickness: 10,
                      interactive: true,
                      trackVisibility: true,
                      radius: const Radius.circular(5),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = comments.elementAt(index);
                          return CommentItemWidget(
                            key: ValueKey('comment_page_item_${item.uniqueId}'),
                            comment: item,
                            onClick: (item) {
                              if (uniqueId == null) {
                                XNavigator.comment(
                                    context, hostId, roomId, item.uniqueId);
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: context.color.onPrimary,
                          );
                        },
                        itemCount: comments.length,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Text(data.error.toString()),
            );
          }
        }
        if (snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
