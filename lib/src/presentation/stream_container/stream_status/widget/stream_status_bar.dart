import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_state.dart';
import 'package:tiktok_tool/src/presentation/widget/avatar.dart';

class StreamStatusBarWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final bool? showHostInfo;

  const StreamStatusBarWidget({super.key, this.onTap, this.showHostInfo});

  @override
  State<StatefulWidget> createState() => _StreamStatusBarState();
}

class _StreamStatusBarState extends State<StreamStatusBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamStatusBloc, StreamStatusState>(
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Trạng thái server',
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                    Text(state.connectionNum.toString()),
                    const SizedBox(width: 14),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: state.serverOnline ? Colors.green : Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              if (widget.showHostInfo == true) ...[
                Divider(color: context.color.background),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    widget.onTap?.call();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        AvatarWidget(
                            url: state.avatar,
                            size: 44,
                            uniqueId: state.uniqueId),
                        const SizedBox(width: 8),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.nickname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleSmall,
                            ),
                            if (state.uniqueId.isNotEmpty)
                              Text('@${state.uniqueId}'),
                          ],
                        )),
                        const SizedBox(width: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (state.status == 'Online')
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    NumberFormat.compact()
                                        .format(state.memberNum),
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(fontSize: 13),
                                  ),
                                  const SizedBox(width: 2),
                                  const Icon(Icons.person, size: 16),
                                  const SizedBox(width: 20)
                                ],
                              ),
                            Text(
                              state.status,
                              style: context.textTheme.titleSmall?.copyWith(
                                  color: state.status == 'Online'
                                      ? Colors.green
                                      : Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
