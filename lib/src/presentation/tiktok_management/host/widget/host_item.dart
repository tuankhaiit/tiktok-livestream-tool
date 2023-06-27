import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/action.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';
import 'package:tiktok_tool/src/presentation/widget/dialog.dart';
import 'package:tiktok_tool/src/presentation/widget/loading.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

class HostItemWidget extends StatelessWidget {
  final HostModel host;
  final VoidCallback? onStop;
  final VoidCallback? onRemove;

  const HostItemWidget({
    super.key,
    required this.host,
    this.onStop,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('host_item_${host.hostId}'),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        child: Icon(
          Icons.delete_forever,
          color: context.color.onPrimaryContainer,
          size: 32,
        ),
      ),
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          XDialog.showDeleteConfirm(
            context,
            child: Text(
              'Bạn có chắc chắn muốn xóa ${host.nickname}?',
              textAlign: TextAlign.center,
            ),
            deleteOnTap: () {
              onRemove?.call();
              XToast.showToast('Đã xóa ${host.nickname}');
            },
          );
        }
        return null;
      },
      dismissThresholds: const {DismissDirection.startToEnd: .7},
      child: GestureDetector(
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
              JoinLiveStreamActionWidget(
                key: const ValueKey('room_page_start_record_action'),
                uniqueId: host.uniqueId,
                overrideRole: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
