import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';

import '../../di/di.dart';
import '../../domain/repository/host_repository.dart';
import '../../network/result.dart';

class RoomInfoWidget extends StatelessWidget {
  final String roomId;

  const RoomInfoWidget({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<XApiSnapshot<RoomModel>>(
      future: XDI.I<HostRepository>().getRoomDetail(roomId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.requireData.hasData) {
          final roomModel = snapshot.requireData.requireData;
          return Text(roomModel.displayTitle());
        }
        return Container();
      },
    );
  }
}
