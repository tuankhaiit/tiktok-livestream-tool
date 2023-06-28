import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/comment.dart';
import 'package:tiktok_tool/src/presentation/widget/room.dart';

typedef OnCommentTap = void Function(CommentModel comment);

class CommentListWidget extends StatelessWidget {
  final String? hostId;
  final String? roomId;
  final String? uniqueId;
  final OnCommentTap? onCommentTap;
  final Future<XApiSnapshot<Iterable<CommentModel>>>? future;

  const CommentListWidget({
    super.key,
    this.hostId,
    this.roomId,
    this.uniqueId,
    this.onCommentTap,
    this.future,
  });

  @override
  Widget build(BuildContext context) {
    late final Future<XApiSnapshot<Iterable<CommentModel>>> ensureFuture;
    if (future == null) {
      if (hostId != null) {
        ensureFuture = XDI.I
            .get<HostRepository>()
            .getCommentsByHost(hostId ?? '', uniqueId);
      } else {
        ensureFuture = XDI.I
            .get<HostRepository>()
            .getCommentsByRoom(roomId ?? '', uniqueId);
      }
    } else {
      ensureFuture = future!;
    }
    return FutureBuilder(
      key: ValueKey(ensureFuture),
      future: ensureFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final apiSnapshot = snapshot.requireData;
          if (apiSnapshot.hasData) {
            return Column(
              children: [
                _buildHeader(context, apiSnapshot.requireData),
                Expanded(
                  child: _buildList(context, apiSnapshot.requireData),
                )
              ],
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.error.toString()),
            );
          }
        } else if (snapshot.hasError) {
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

  Widget _buildList(BuildContext context, Iterable<CommentModel> comments) {
    final controller = ScrollController();
    return Container(
      alignment: Alignment.topCenter,
      child: Scrollbar(
        controller: controller,
        thickness: 10,
        interactive: true,
        trackVisibility: true,
        radius: const Radius.circular(5),
        child: ListView.separated(
          key: ValueKey(
              'host_${hostId}_room_${roomId}_user_${uniqueId}_comments'),
          reverse: true,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) {
            final item = comments.elementAt(index);
            return CommentItemWidget(
              key: ValueKey(
                  'host_${hostId}_room_${roomId}_user_${uniqueId}_comment_${item.id}'),
              comment: item,
              onTap: (item) {
                if (uniqueId == null) {
                  onCommentTap?.call(item);
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
    );
  }

  _buildHeader(BuildContext context, Iterable<CommentModel> comments) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.primary,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          DefaultTextStyle(
            style: context.textTheme.titleSmall
                    ?.copyWith(color: context.color.onPrimary) ??
                const TextStyle(),
            child: Expanded(
              child: roomId != null
                  ? RoomInfoWidget(
                      key: ValueKey('room_profile_$roomId'), roomId: roomId!)
                  : const SizedBox.shrink(),
            ),
          ),
          Text(
            '${NumberFormat.compact().format(comments.length)}  bình luận',
            style: context.textTheme.titleSmall
                ?.copyWith(color: context.color.onPrimary),
          )
        ],
      ),
    );
  }
}
