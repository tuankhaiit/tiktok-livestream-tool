import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/room/widget/room_item.dart';
import 'package:tiktok_tool/src/presentation/widget/action.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';

import '../../di/di.dart';

@RoutePage()
class RoomPage extends StatefulWidget {
  final String hostId;

  const RoomPage({super.key, required this.hostId});

  @override
  State<StatefulWidget> createState() => _RoomState();
}

class _RoomState extends State<RoomPage> {
  HostModel? hostModel;
  XApiSnapshot? snapshot;
  List<RoomModel> rooms = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() {
    XDI.I<HostRepository>().getHostDetail(widget.hostId, null).then(
          (value) => setState(
            () {
              if (value.hasData) {
                hostModel = value.requireData;
              }
            },
          ),
        );
    XDI.I.get<HostRepository>().getRooms(widget.hostId).then(
          (value) => setState(
            () {
              snapshot = value;
              if (value.hasData) {
                rooms.clear();
                rooms.addAll(value.requireData);
              }
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            rooms.clear();
            snapshot = null;
          });
          _fetchData();
        },
        child: Column(
          children: [
            HostProfileWidget(hostId: widget.hostId),
            Divider(color: context.color.background),
            Expanded(
              child: _buildBody(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (snapshot != null) {
      if (snapshot?.hasData == true) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.color.primary,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
              alignment: Alignment.centerRight,
              child: Text(
                '${NumberFormat.compact().format(rooms.length)}  phiên',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: context.color.onPrimary),
              ),
            ),
            Expanded(
                child: ListView.separated(
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
            ))
          ],
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Text(snapshot?.error.toString() ?? ''),
        );
      }
    } else {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }
  }

  AppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: const Text('Phiên Livestream'),
      actions: [
        if (hostModel?.isRecording == true)
          IconButton(
            key: const ValueKey('room_page_stop_record_action'),
            onPressed: () async {
              setState(() {
                hostModel = hostModel?.copyWith(isRecording: false);
              });
              XDI.I<HostRepository>().stopRecord(widget.hostId);
            },
            icon: const Icon(
              Icons.stop,
              color: Colors.red,
            ),
          ),
        PotentialUserActionWidget(
          key: const ValueKey('room_page_users_action'),
          hostId: widget.hostId,
        )
      ],
    );
  }
}
