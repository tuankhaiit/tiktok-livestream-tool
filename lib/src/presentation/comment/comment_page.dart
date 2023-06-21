import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/comment.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../../di/di.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  final String? hostId;
  final String? roomId;
  final String? uniqueId;

  const CommentPage(
      {super.key,
      required this.hostId,
      required this.roomId,
      required this.uniqueId});

  @override
  Widget build(BuildContext context) {
    late final Future<XApiSnapshot<Iterable<CommentModel>>> feature;
    if (hostId != null) {
      feature =
          XDI.I.get<HostRepository>().getCommentsByHost(hostId ?? '', uniqueId);
    } else {
      feature =
          XDI.I.get<HostRepository>().getCommentsByRoom(roomId ?? '', uniqueId);
    }
    return Scaffold(
      appBar: AppBar(
        actions: _buildActions(context),
      ),
      body: FutureBuilder<XApiSnapshot<Iterable<CommentModel>>>(
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
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${NumberFormat.compact().format(comments.length)} bình luận',
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: context.color.onPrimary),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      thickness: 10,
                      interactive: true,
                      trackVisibility: true,
                      radius: const Radius.circular(5),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = comments.elementAt(index);
                          return CommentWidget(
                            key: ValueKey('comment_page_item_${item.uniqueId}'),
                            comment: item,
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
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      if (hostId != null || roomId != null)
        IconButton(
          onPressed: () {
            XNavigator.potentialUsers(context, hostId, roomId);
          },
          icon: Icon(
            Icons.person,
            color: context.color.primary,
          ),
        )
    ];
  }
}
