import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';

typedef OnUserClick = void Function(UserModel comment);

class UserItemWidget extends StatelessWidget {
  final UserModel user;
  final OnUserClick? onClick;

  const UserItemWidget({super.key, required this.user, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onClick?.call(user);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(
              key: ValueKey('user_avatar_${user.uniqueId}'),
              url: user.avatar,
              size: 40,
              uniqueId: user.uniqueId,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(fontSize: 14),
                  ),
                  Text(
                    user.phoneNumber,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
