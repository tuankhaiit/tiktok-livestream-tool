import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';

part 'room_resp_dto.g.dart';

@JsonSerializable()
class RoomResponseDTO {
  @JsonKey(name: 'roomId')
  final dynamic roomId;
  @JsonKey(name: 'userId')
  final dynamic userId;
  @JsonKey(name: 'uniqueId')
  final dynamic uniqueId;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'commentCount')
  final dynamic commentCount;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  RoomResponseDTO({
    required this.roomId,
    required this.userId,
    required this.uniqueId,
    required this.nickname,
    required this.avatar,
    required this.commentCount,
    required this.createTime,
  });

  factory RoomResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseDTOFromJson(json);

  RoomModel toModel() => RoomModel(
        roomId: roomId ?? '',
        userId: userId ?? '',
        uniqueId: uniqueId ?? '',
        nickname: nickname ?? '',
        avatar: avatar ?? '',
        status: '',
        commentCount: commentCount ?? 0,
        createTime: createTime ?? 0,
      );
}
