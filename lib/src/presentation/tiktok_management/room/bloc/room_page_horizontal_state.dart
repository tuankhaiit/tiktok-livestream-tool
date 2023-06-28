import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/network/result.dart';

part 'room_page_horizontal_state.freezed.dart';

@freezed
class RoomPageHorizontalState with _$RoomPageHorizontalState {
  factory RoomPageHorizontalState({
    required String hostId,
    RoomModel? selectedRoom,
    Future<XApiSnapshot<Iterable<CommentModel>>>? roomFuture,
    CommentModel? selectedUserComment,
    Future<XApiSnapshot<Iterable<CommentModel>>>? userCommentFuture,
  }) = _RoomPageHorizontalState;
}
