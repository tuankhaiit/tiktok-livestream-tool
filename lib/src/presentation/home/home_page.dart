import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_container.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiktok Livestream'),
      ),
      body: const LiveStreamContainerWidget(),
    );
  }
}