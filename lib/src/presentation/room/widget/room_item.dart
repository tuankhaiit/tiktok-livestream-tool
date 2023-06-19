import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/router/navigator.dart';
class RoomItemWidget extends StatelessWidget {
  final RoomModel data;

  const RoomItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final timeFormatted = DateFormat('HH:mm dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(data.createTime * 1000));
    final commentCountFormatted =
        NumberFormat.compact().format(data.commentCount);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        XNavigator.comment(context, data.roomId);
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
                  timeFormatted,
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
