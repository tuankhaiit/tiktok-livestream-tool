import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/host/widget/host_item.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

import '../../di/di.dart';

@RoutePage()
class HostPage extends StatelessWidget {
  const HostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Tiktoker'),
      ),
      body: FutureBuilder<XApiSnapshot<Iterable<HostModel>>>(
        future: XDI.I.get<HostRepository>().getHost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            if (data.hasData) {
              final hosts = data.requireData;
              return ListView.separated(
                itemBuilder: (context, index) {
                  final item = hosts.elementAt(index);
                  return HostItemWidget(data: item);
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
