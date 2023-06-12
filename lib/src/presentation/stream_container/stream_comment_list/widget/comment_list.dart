import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/socket/socket_connector.dart';
import 'package:tiktok_tool/src/utils/log.dart';

import '../../../../domain/model/comment.dart';
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
    SocketService.commentStream.listen((comment) {
      addComment(comment);
    });
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
    SocketService.socialStream.listen((comment) {
      addComment(comment);
    });
    super.initState();
  }
}

abstract class _CommentListState<T extends StatefulWidget> extends State<T> {
  static const int reachedToEndOffset = 50;
  late final ScrollController controller;
  final List<CommentModel> comments = [];
  bool isScrollManual = false;
  bool hasNewMessage = false;

  @override
  void initState() {
    controller = ScrollController()
      ..addListener(() {
        final offset = controller.offset;
        final maxExtent = controller.position.maxScrollExtent;
        if ((maxExtent - offset) < reachedToEndOffset && isScrollManual) {
          setState(() {
            isScrollManual = false;
            hasNewMessage = false;
          });
        }
      });
    super.initState();
  }

  addComment(CommentModel comment) {
    setState(() {
      comments.add(comment);

      final offset = controller.offset;
      final maxExtent = controller.position.maxScrollExtent;
      if (isScrollManual == true && (maxExtent - offset) > reachedToEndOffset) {
        hasNewMessage = true;
      }
    });
    scrollToEnd();
  }

  scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (controller.hasClients && isScrollManual == false) {
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
    return Stack(
      children: [
        GestureDetector(
          onTapDown: (_) {
            logD('onTapDown');
            isScrollManual = true;
          },
          onVerticalDragStart: (_) {
            logD('onVerticalDragStart');
            isScrollManual = true;
          },
          onVerticalDragDown: (_) {
            logD('onVerticalDragDown');
            isScrollManual = true;
          },
          onHorizontalDragDown: (_) {
            logD('onHorizontalDragDown');
            isScrollManual = true;
          },
          onLongPressDown: (_) {
            logD('onLongPressDown');
            isScrollManual = true;
          },
          onPanDown: (_) {
            logD('onPanDown');
            isScrollManual = true;
          },
          onDoubleTapDown: (_) {
            logD('onDoubleTapDown');
            isScrollManual = true;
          },
          child: ListView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return UserCommentWidget(comment: comments[index]);
            },
            itemCount: comments.length,
          ),
        ),
        if (hasNewMessage)
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(14),
              child: OutlinedButton(
                onPressed: () {
                  if (controller.hasClients) {
                    final position = controller.position.maxScrollExtent;
                    controller.animateTo(
                      position,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                  }
                  setState(() {
                    hasNewMessage = false;
                    isScrollManual = false;
                  });
                },
                child: const Text(
                  'New messages',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          )
      ],
    );
  }
}
