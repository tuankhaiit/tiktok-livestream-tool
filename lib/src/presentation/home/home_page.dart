import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/dialog.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../tiktok_management/stream_container/stream_status/widget/stream_status_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiktok Livestream'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const StreamStatusBarWidget(),
            Divider(color: context.color.background),
            FutureBuilder(
              future: AppStorage().getAccount(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.requireData != null) {
                  final account = snapshot.requireData!;
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          'Hello ${account.nickname}',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton(
                    onPressed: () {
                      XNavigator.host(context);
                    },
                    child: const Text('Danh sách Tiktoker'),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                XDialog.showActionDialog(
                  context,
                  child: const Text('Bạn có chắc chắn muốn đăng xuất?'),
                  actions: [
                    XDialogAction.cancel(context),
                    XDialogAction.ok(context, onTap: () {
                      XDI.I<AccountBloc>().onUserLoggedOut();
                    }),
                  ],
                );
              },
              child: const Text('Đăng xuất'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
