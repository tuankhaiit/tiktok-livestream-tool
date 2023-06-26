import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/widget/room_item.dart';
import 'package:tiktok_tool/src/presentation/widget/scroll.dart';

class RoomListWidget extends StatefulWidget {
  final String hostId;

  const RoomListWidget({super.key, required this.hostId});

  @override
  State<StatefulWidget> createState() => _RoomListState();
}

class _RoomListState extends State<RoomListWidget> {
  final List<RoomModel> rooms = [];
  bool loading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      loading = true;
    });
    XDI.I<HostRepository>().getRooms(widget.hostId).then((snapshot) {
      if (snapshot.hasData) {
        rooms.clear();
        rooms.addAll(snapshot.requireData);
      } else {
        EasyLoading.showError(snapshot.errorMessage ?? '');
      }
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        fetchData();
      },
      child: loading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.color.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${NumberFormat.compact().format(rooms.length)}  phiên',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: context.color.onPrimary),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
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
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
