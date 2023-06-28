import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/router/navigator.dart';
import 'package:tiktok_tool/src/utils/date.dart';

typedef OnRoomTap = void Function(RoomModel room);

class RoomItemWidget extends StatelessWidget {
  final RoomModel data;
  final OnRoomTap? onTap;

  const RoomItemWidget({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    final commentCountFormatted =
        NumberFormat.compact().format(data.commentCount);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap?.call(data);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.displayTitle(),
                  style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                Text(
                  '$commentCountFormatted bình luận',
                  style: context.textTheme.bodyLarge,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
