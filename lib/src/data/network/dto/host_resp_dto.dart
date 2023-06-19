import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';

part 'host_resp_dto.g.dart';

@JsonSerializable()
class HostResponseDTO {
  @JsonKey(name: 'userId')
  final dynamic userId;
  @JsonKey(name: 'uniqueId')
  final dynamic uniqueId;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  HostResponseDTO({
    required this.userId,
    required this.uniqueId,
    required this.nickname,
    required this.avatar,
    required this.createTime,
  });

  factory HostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$HostResponseDTOFromJson(json);

  HostModel toModel() => HostModel(
        userId: userId ?? '',
        uniqueId: uniqueId ?? '',
        nickname: nickname ?? '',
        avatar: avatar ?? '',
        createTime: createTime ?? 0,
      );
}
