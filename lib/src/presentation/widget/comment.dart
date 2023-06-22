import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';

typedef OnCommentClick = void Function(CommentModel comment);

class CommentItemWidget extends StatelessWidget {
  final CommentModel comment;
  final OnCommentClick? onClick;

  const CommentItemWidget({super.key, required this.comment, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onClick?.call(comment);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(
              key: ValueKey('user_avatar_${comment.uniqueId}'),
              url: comment.avatar,
              size: 40,
              uniqueId: comment.uniqueId,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    comment.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comment.comment,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.centerRight,
                    child: Text(
                      comment.displayTime(),
                      style: context.textTheme.labelMedium,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
