import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_container.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_bloc.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/stream_container/stream_status/bloc/stream_status_state.dart';
import 'package:tiktok_tool/src/presentation/widget/action.dart';

@RoutePage()
class StreamPage extends StatefulWidget {
  final String uniqueId;

  const StreamPage({super.key, required this.uniqueId});

  @override
  State<StatefulWidget> createState() => _StreamState();
}

class _StreamState extends State<StreamPage> {
  late StreamStatusBloc bloc;

  @override
  void initState() {
    bloc = context.read<StreamStatusBloc>()..connectUniqueId(widget.uniqueId);
    super.initState();
  }

  @override
  void dispose() {
    bloc.disconnectUniqueId();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestream'),
        actions: [
          BlocBuilder<StreamStatusBloc, StreamStatusState>(
            builder: (context, state) {
              final hostId = state.uniqueId;
              final roomId = state.roomId;
              if (hostId.isNotEmpty && roomId.isNotEmpty) {
                return PotentialUserActionWidget(
                    hostId: hostId, roomId: roomId);
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: LiveStreamContainerWidget(onStatusTap: () {
        if (bloc.state.status != 'Online') {
          bloc.connectUniqueId(widget.uniqueId);
        }
      }),
    );
  }
}
