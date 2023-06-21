import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

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
          children: [
            const StreamStatusBarWidget(),
            Expanded(
              child: Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      XNavigator.host(context);
                    },
                    child: const Text('Host'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
