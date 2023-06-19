import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/room/widget/room_item.dart';

import '../../di/di.dart';

@RoutePage()
class RoomPage extends StatelessWidget {
  final String uniqueId;

  const RoomPage({super.key, required this.uniqueId});

  @override
  Widget build(BuildContext context) {
    final hostModel = XDI.I<HostRepository>().getHostModelFromCache(uniqueId);
    return Scaffold(
      appBar: AppBar(
        title: Text(hostModel?.nickname ?? ''),
      ),
      body: FutureBuilder<XApiSnapshot<Iterable<RoomModel>>>(
        future: XDI.I.get<HostRepository>().getRoomByHost(uniqueId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            if (data.hasData) {
              final rooms = data.requireData;
              return ListView.separated(
                itemBuilder: (context, index) {
                  final item = rooms.elementAt(index);
                  return RoomItemWidget(data: item);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: context.color.onPrimary,
                  );
                },
                itemCount: rooms.length,
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Text(data.error.toString()),
              );
            }
          }
          if (snapshot.hasError) {
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
