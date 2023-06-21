import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/host/widget/host_item.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../di/di.dart';

@RoutePage()
class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<StatefulWidget> createState() => _HostState();
}

class _HostState extends State<HostPage> {
  List<HostModel> hosts = [];
  XApiSnapshot? snapshot;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() {
    XDI.I.get<HostRepository>().getHosts().then(
          (value) => setState(() {
            snapshot = value;
            if (value.hasData) {
              hosts.clear();
              hosts.addAll(value.requireData);
            }
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Tiktoker'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            hosts.clear();
            snapshot = null;
          });
          _fetchData();
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (snapshot != null) {
      if (snapshot?.hasData == true) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final item = hosts.elementAt(index);
            return HostItemWidget(
              key: ValueKey('room_page_item_${item.uniqueId}'),
              data: item,
              onStop: () {
                _stopRecord(context, index, item);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: context.color.onPrimary,
            );
          },
          itemCount: hosts.length,
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Text(snapshot?.error?.toString() ?? ''),
        );
      }
    } else {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }
  }

  Future _stopRecord(BuildContext context, int index, HostModel item) async {
    XDI.I<HostRepository>().stopRecord(item.uniqueId);
    setState(() {
      hosts[index] = item.copyWith(isRecording: false);
    });
  }
}
