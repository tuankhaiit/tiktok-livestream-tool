import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/host/widget/host_list.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/input_nickname/input_nickname_dialog.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';

@RoutePage()
class HostPage extends StatelessWidget with DynamicLayout {
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
          Expanded(child: buildDynamicLayout(context))
        ],
      ),
    );
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return const XSinglePageLayoutBuilder(child: HostListWidget());
  }
}
