import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../di/di.dart';
import '../../domain/model/host.dart';
import '../../domain/repository/host_repository.dart';
import '../../network/result.dart';
import '../../router/navigator.dart';
import 'avatar.dart';

class HostProfileWidget extends StatefulWidget {
  final String? hostId;
  final String? roomId;

  const HostProfileWidget({super.key, this.hostId, this.roomId});

  @override
  State<StatefulWidget> createState() => _HostProfileState();
}

class _HostProfileState extends State<HostProfileWidget> {
  HostModel? data;

  @override
  void initState() {
    XDI.I<HostRepository>()
        .getHostDetail(widget.hostId, widget.roomId)
        .then((value) {
      if (mounted) {
        setState(() {
          data = value.data;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      final hostModel = data!;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            AvatarWidget(
              url: hostModel.avatar,
              size: 60,
              uniqueId: hostModel.uniqueId,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hostModel.nickname,
                      style: context.textTheme.titleMedium),
                  Text('@${hostModel.uniqueId}'),
                ],
              ),
            ),
            if (hostModel.isRecording)
              IconButton(
                key: const ValueKey('host_page_stop_record_action'),
                onPressed: () {
                  _stopRecord(context, hostModel.uniqueId);
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
                XNavigator.livestream(context, hostModel.uniqueId);
              },
              icon: const Icon(
                Icons.play_circle,
                size: 26,
                color: Colors.green,
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Future _stopRecord(BuildContext context, String uniqueId) async {
    XDI.I<HostRepository>().stopRecord(uniqueId);
    if (mounted) {
      setState(() {
        data = data?.copyWith(isRecording: false);
      });
    }
  }
}
