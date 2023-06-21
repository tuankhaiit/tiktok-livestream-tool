import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';

part 'user_resp_dto.g.dart';

@JsonSerializable()
class UserResponseDTO {
  @JsonKey(name: 'userId')
  final dynamic userId;
  @JsonKey(name: 'uniqueId')
  final dynamic uniqueId;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'phoneNumber')
  final dynamic phoneNumber;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  UserResponseDTO({
    required this.userId,
    required this.uniqueId,
    required this.nickname,
    required this.avatar,
    required this.phoneNumber,
    required this.createTime,
  });

  factory UserResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDTOFromJson(json);

  UserModel toModel() => UserModel(
        userId: userId ?? '',
        uniqueId: uniqueId ?? '',
        nickname: nickname?.toString().trim() ?? '',
        avatar: avatar ?? '',
        phoneNumber: phoneNumber ?? '',
        createTime: createTime ?? 0,
      );
}
