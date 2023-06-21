import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../../data/service/app_storage.dart';
import '../../../router/navigator.dart';

class HostItemWidget extends StatelessWidget {
  final HostModel data;
  final VoidCallback? onStop;

  const HostItemWidget({super.key, required this.data, this.onStop});

  @override
  Widget build(BuildContext context) {
    const avatarSize = 60.0;
    return GestureDetector(
      onTap: () {
        XNavigator.room(context, data.uniqueId);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(avatarSize / 2),
              child: Image.network(
                data.avatar,
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.nickname,
                    style:
                        context.textTheme.titleMedium?.copyWith(fontSize: 18),
                  ),
                  Text(
                    '@${data.uniqueId}',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            if (data.isRecording)
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
                final storage = AppStorage();
                storage.setUniqueId(data.uniqueId);
                XNavigator.livestream(context);
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
