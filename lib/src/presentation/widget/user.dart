import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;

  const UserWidget({super.key, required this.user});

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
              user.avatar,
              width: avatarSize,
              height: avatarSize,
              errorBuilder: (_, __, ___) {
                return Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
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
          IconButton(
            onPressed: () {
              XNavigator.userProfile(context, user.uniqueId);
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
