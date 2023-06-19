import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/comment.dart';

import '../../di/di.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  final String roomId;

  const CommentPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final roomModel = XDI.I<HostRepository>().getRoomModelFromCache(roomId);
    final hostModel =
        XDI.I<HostRepository>().getHostModelFromCache(roomModel?.uniqueId);
    return Scaffold(
      appBar: AppBar(
        title: Text(hostModel?.nickname ?? ''),
      ),
      body: FutureBuilder<XApiSnapshot<Iterable<CommentModel>>>(
        future: XDI.I.get<HostRepository>().getCommentByRoom(roomId),
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
                        return UserCommentWidget(
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
                  ))
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
}
