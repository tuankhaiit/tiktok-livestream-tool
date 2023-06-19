import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_container/input_nickname/input_nickname_dialog.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_state.dart';

class StreamStatusBarWidget extends StatefulWidget {
  const StreamStatusBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StreamStatusBarState();
}

class _StreamStatusBarState extends State<StreamStatusBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        InputNicknameDialog.show(context);
      },
      child: BlocBuilder<StreamStatusBloc, StreamStatusState>(
        builder: (BuildContext context, state) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: state.avatar.contains('http')
                          ? Image.network(
                              state.avatar,
                              width: 44,
                              height: 44,
                              errorBuilder: (_, __, ___) {
                                return Container(
                                  alignment: Alignment.center,
                                  width: 44,
                                  height: 44,
                                  child: const Icon(Icons.error),
                                );
                              },
                            )
                          : Container(),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.nickname,
                          style: context.textTheme.titleSmall,
                        ),
                        if (state.uniqueId.isNotEmpty)
                          Text('@${state.uniqueId}'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (state.status == 'Online')
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${state.memberNum}',
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
                            const SizedBox(width: 20),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: state.serverOnline
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
