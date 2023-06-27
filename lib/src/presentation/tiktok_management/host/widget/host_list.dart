import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/scroll.dart';

import '../../../../di/di.dart';
import '../../../../domain/model/host.dart';
import '../../../../domain/repository/host_repository.dart';
import 'host_item.dart';

class HostListWidget extends StatefulWidget {
  const HostListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HostListState();
}

class _HostListState extends State<HostListWidget> {
  final List<HostModel> hosts = [];
  bool loading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    XDI.I<HostRepository>().getHosts().then((snapshot) {
      if (snapshot.hasData) {
        hosts.clear();
        hosts.addAll(snapshot.requireData);
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

  void deleteHost(HostModel host) async {
    final account = await AppStorage().getAccount();
    if (account == null) return;
    XDI.I<HostRepository>().deleteHostAssignment(account.id.toString(), host.hostId);
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
                Divider(color: context.color.background),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = hosts.elementAt(index);
                        return HostItemWidget(
                          key: ValueKey('room_page_item_${item.uniqueId}'),
                          host: item,
                          onStop: () {
                            _stopRecord(context, index, item);
                          },
                          onRemove: () {
                            deleteHost(item);
                            setState(() {
                              hosts.remove(item);
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: context.color.onPrimary,
                        );
                      },
                      itemCount: hosts.length,
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Future _stopRecord(BuildContext context, int index, HostModel item) async {
    XDI.I<HostRepository>().stopRecord(item.uniqueId);
    setState(() {
      hosts[index] = item.copyWith(isRecording: false);
    });
  }
}
