import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_status/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/stream_status/stream_status_state.dart';

class StreamStatusBarWidget extends StatefulWidget {
  const StreamStatusBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StreamStatusBarState();
}

class _StreamStatusBarState extends State<StreamStatusBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamStatusBloc, StreamStatusState>(
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: state.avatar.contains('http')
                    ? Image.network(
                        state.avatar,
                        width: 44,
                        height: 44,
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
                  if (state.uniqueId.isNotEmpty) Text('@${state.uniqueId}'),
                ],
              ),
              // Text(state.memberNum.toString()),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.status),
                      const SizedBox(width: 12),
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
              )
            ],
          ),
        );
      },
    );
  }
}
