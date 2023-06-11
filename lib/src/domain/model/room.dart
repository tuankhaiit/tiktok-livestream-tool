import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String roomId,
    required String userId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String status,
  }) = _RoomModel;
}
