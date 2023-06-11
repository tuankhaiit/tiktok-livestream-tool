import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/socket/socket_connector.dart';
import 'package:tiktok_tool/src/utils/log.dart';

import '../../../domain/model/comment.dart';
import 'comment.dart';

class StreamCommentListWidget extends StatefulWidget {
  const StreamCommentListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StreamCommentListState();
}

class _StreamCommentListState
    extends _CommentListState<StreamCommentListWidget> {
  @override
  void initState() {
    SocketService.listenComment((comment) => addComment(comment), null);
    super.initState();
  }
}

class StreamSocialListWidget extends StatefulWidget {
  const StreamSocialListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StreamSocialListState();
}

class _StreamSocialListState extends _CommentListState<StreamSocialListWidget> {
  @override
  void initState() {
    SocketService.listenComment(null, (comment) => addComment(comment));
    super.initState();
  }
}

abstract class _CommentListState<T extends StatefulWidget> extends State<T> {
  late final ScrollController controller;
  final List<CommentModel> comments = [];

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  addComment(CommentModel comment) {
    setState(() {
      comments.add(comment);
      scrollToEnd();
    });
  }

  scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (controller.hasClients) {
        final position = controller.position.maxScrollExtent;
        controller.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      child: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return UserCommentWidget(comment: comments[index]);
        },
        itemCount: comments.length,
      ),
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          logD(controller.position.pixels);
        }
        //How many pixels scrolled from pervious frame
        logD(notification.scrollDelta);

        //List scroll position
        logD(notification.metrics.pixels);
        return true;
      },
    );
  }
}
