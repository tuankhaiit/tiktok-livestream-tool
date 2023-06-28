import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/comment/widget/comment_list.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';

class CommentItemWidget extends StatelessWidget {
  final CommentModel comment;
  final OnCommentTap? onTap;

  const CommentItemWidget({super.key, required this.comment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap?.call(comment);
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
                  SelectableText(
                    comment.nickname,
                    maxLines: 1,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    comment.comment,
                    style: const TextStyle(
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.centerRight,
                    child: Text(
                      comment.displayTime(),
                      style: context.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
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
