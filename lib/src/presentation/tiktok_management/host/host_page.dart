import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/host/widget/host_item.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/host/widget/host_list.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/input_nickname/input_nickname_dialog.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';

@RoutePage()
class HostPage extends StatelessWidget {
  const HostPage({super.key});

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
      body: Column(
        children: [
          const StreamStatusBarWidget(),
          Divider(color: context.color.background),
          const Expanded(child: HostListWidget())
        ],
      ),
    );
  }
}
