import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';

import '../../../data/service/app_storage.dart';
import '../../../router/navigator.dart';

class HostItemWidget extends StatelessWidget {
  final HostModel host;
  final VoidCallback? onStop;

  const HostItemWidget({super.key, required this.host, this.onStop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        XNavigator.room(context, host.uniqueId);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            AvatarWidget(
              key: ValueKey('user_avatar_${host.uniqueId}'),
              url: host.avatar,
              size: 60,
              uniqueId: host.uniqueId,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    host.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '@${host.uniqueId}',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            if (host.isRecording)
              IconButton(
                key: const ValueKey('host_page_stop_record_action'),
                onPressed: () {
                  onStop?.call();
                },
                icon: const Icon(
                  Icons.stop,
                  color: Colors.red,
                  size: 26,
                ),
              ),
            IconButton(
              key: const ValueKey('room_page_start_record_action'),
              onPressed: () async {
                XNavigator.livestream(context, host.uniqueId);
              },
              icon: const Icon(
                Icons.play_circle,
                size: 26,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
