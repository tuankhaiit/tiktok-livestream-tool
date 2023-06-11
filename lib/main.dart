import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/socket/socket_connector.dart';

import 'src/presentation/stream_comment_list/widget/comment_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocketService.connectSocket();
  SocketService.connectLivestream();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                Text("Thông báo"),
                Expanded(child: StreamSocialListWidget())
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: const [
                Text("Bình luận"),
                Expanded(child: StreamCommentListWidget())
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
