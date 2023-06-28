import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/di/di.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/tiktok_management/room/bloc/room_page_horizontal_state.dart';

class RoomPageHorizontalBloc extends Cubit<RoomPageHorizontalState> {
  RoomPageHorizontalBloc({required String hostId})
      : super(RoomPageHorizontalState(hostId: hostId));

  void onRoomTap(RoomModel room) {
    if (state.selectedRoom != room) {
      emit(state.copyWith(
          selectedRoom: room,
          roomFuture: genFuture(room.roomId, null),
          selectedUserComment: null));
    } else {
      emit(state.copyWith(selectedRoom: null, selectedUserComment: null));
    }
  }

  void onUserCommentTap(CommentModel comment) {
    if (state.selectedUserComment != comment) {
      emit(state.copyWith(
          selectedUserComment: comment,
          userCommentFuture:
              genFuture(state.selectedRoom?.roomId, comment.uniqueId)));
    } else {
      emit(state.copyWith(selectedUserComment: null));
    }
  }

  Future<XApiSnapshot<Iterable<CommentModel>>> genFuture(
      String? roomId, String? uniqueId) {
    return XDI.I
        .get<HostRepository>()
        .getCommentsByRoom(roomId ?? '', uniqueId);
  }
}
