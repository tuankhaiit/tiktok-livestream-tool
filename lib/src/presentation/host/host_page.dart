import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/host/widget/host_item.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_container/input_nickname/input_nickname_dialog.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';

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
      appBar: MyAppBar(
        title: const Text('Danh sách Tiktoker'),
        actions: [
          IconButton(
            onPressed: () {
              InputNicknameDialog.show(context);
            },
            icon: Icon(
              Icons.add,
              color: context.color.primary,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            hosts.clear();
            snapshot = null;
          });
          _fetchData();
        },
        child: Column(
          children: [
            const StreamStatusBarWidget(),
            Divider(color: context.color.background),
            Expanded(child: _buildBody(context))
          ],
        ),
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
              host: item,
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
