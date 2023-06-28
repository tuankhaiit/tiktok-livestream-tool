import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/comment/widget/comment_list.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/bloc/room_page_horizontal_bloc.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/bloc/room_page_horizontal_state.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/widget/room_list.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';

class RoomPageHorizontalWrapper extends StatelessWidget {
  final String hostId;

  const RoomPageHorizontalWrapper({super.key, required this.hostId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoomPageHorizontalBloc(hostId: hostId),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RoomPageHorizontalBloc>();
          return Column(
            children: [
              HostProfileWidget(hostId: hostId),
              Divider(color: context.color.background),
              Expanded(
                child: BlocBuilder<RoomPageHorizontalBloc,
                    RoomPageHorizontalState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RoomListWidget(
                            hostId: hostId,
                            onItemTap: bloc.onRoomTap,
                          ),
                        ),
                        if (state.selectedRoom != null) ...[
                          VerticalDivider(
                            color: context.color.background,
                            thickness: 2,
                            width: 2,
                          ),
                          Expanded(
                            flex: state.selectedUserComment != null ? 3 : 6,
                            child: CommentListWidget(
                              roomId: state.selectedRoom?.roomId,
                              onCommentTap: bloc.onUserCommentTap,
                              future: state.roomFuture,
                            ),
                          )
                        ],
                        if (state.selectedUserComment != null) ...[
                          VerticalDivider(
                            color: context.color.background,
                            thickness: 2,
                            width: 2,
                          ),
                          Expanded(
                            flex: 3,
                            child: CommentListWidget(
                              roomId: state.selectedRoom?.roomId,
                              uniqueId: state.selectedUserComment?.uniqueId,
                              future: state.userCommentFuture,
                            ),
                          )
                        ],
                      ],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
