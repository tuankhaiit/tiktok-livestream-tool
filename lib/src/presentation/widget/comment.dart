import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../router/navigator.dart';

typedef OnCommonClick = void Function(CommentModel comment);

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  final OnCommonClick? onClick;

  const CommentWidget({super.key, required this.comment, this.onClick});

  @override
  Widget build(BuildContext context) {
    const avatarSize = 40.0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avatarSize / 2),
            child: Image.network(
              comment.avatar,
              width: avatarSize,
              height: avatarSize,
              errorBuilder: (_, __, ___) {
                return Container(
                  alignment: Alignment.center,
                  width: avatarSize,
                  height: avatarSize,
                  child: const Icon(Icons.error),
                );
              },
            ),
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
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              XNavigator.userProfile(context, comment.uniqueId);
            },
            icon: Icon(
              Icons.contacts,
              color: context.color.primary,
            ),
          )
        ],
      ),
    );
  }
}
