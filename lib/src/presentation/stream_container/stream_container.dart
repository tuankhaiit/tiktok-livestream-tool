import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_comment_list/widget/comment_list.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_state.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/widget/stream_status_bar.dart';

class LiveStreamContainerWidget extends StatelessWidget {
  const LiveStreamContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StreamStatusBarWidget(),
        Expanded(
          child: BlocBuilder<StreamStatusBloc, StreamStatusState>(
            buildWhen: (previous, next) {
              return previous.streamerOnline != next.streamerOnline;
            },
            builder: (context, state) {
              if (state.streamerOnline) {
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: const [
                          HeaderWidget(title: 'Notification'),
                          Expanded(child: StreamSocialListWidget())
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: const [
                          HeaderWidget(title: 'Comment'),
                          Expanded(child: StreamCommentListWidget())
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.color.background,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: TextStyle(color: context.color.onPrimary),
      ),
    );
  }
}
