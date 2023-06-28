import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_comment_list/widget/comment_list.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_state.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/widget/stream_status_bar.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';

class LiveStreamContainerWidget extends StatelessWidget with DynamicLayout {
  final VoidCallback? onStatusTap;

  const LiveStreamContainerWidget({super.key, this.onStatusTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamStatusBarWidget(onTap: onStatusTap, showHostInfo: true),
        Container(
          height: 1,
          color: context.color.background,
        ),
        Expanded(
          child: BlocBuilder<StreamStatusBloc, StreamStatusState>(
            buildWhen: (previous, next) {
              return previous.status != next.status;
            },
            builder: (context, state) {
              if (state.status == 'Online') {
                return buildDynamicLayout(context);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        )
      ],
    );
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              HeaderWidget(title: 'Thông báo'),
              Expanded(child: StreamSocialListWidget())
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: const [
              HeaderWidget(title: 'Bình luận'),
              Expanded(child: StreamCommentListWidget())
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              HeaderWidget(title: 'Thông báo'),
              Expanded(child: StreamSocialListWidget())
            ],
          ),
        ),
        const VerticalDivider(),
        Expanded(
          flex: 3,
          child: Column(
            children: const [
              HeaderWidget(title: 'Bình luận'),
              Expanded(child: StreamCommentListWidget())
            ],
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
      alignment: Alignment.center,
      color: context.color.background,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: TextStyle(color: context.color.primary),
      ),
    );
  }
}
