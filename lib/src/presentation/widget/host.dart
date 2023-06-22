import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../di/di.dart';
import '../../domain/model/host.dart';
import '../../domain/repository/host_repository.dart';
import '../../network/result.dart';
import 'avatar.dart';

class HostProfileWidget extends StatelessWidget {
  final String? hostId;
  final String? roomId;

  const HostProfileWidget({super.key, this.hostId, this.roomId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<XApiSnapshot<HostModel>>(
      future: XDI.I<HostRepository>().getHostDetail(hostId, roomId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.requireData.hasData) {
          final hostModel = snapshot.requireData.requireData;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hostModel.nickname,
                        style: context.textTheme.titleMedium),
                    Text('@${hostModel.uniqueId}'),
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
