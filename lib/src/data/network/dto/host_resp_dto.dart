import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/host.dart';

part 'host_resp_dto.g.dart';

@JsonSerializable()
class HostResponseDTO {
  @JsonKey(name: 'hostId')
  final dynamic hostId;
  @JsonKey(name: 'uniqueId')
  final dynamic uniqueId;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'isRecording')
  final dynamic isRecording;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  HostResponseDTO({
    required this.hostId,
    required this.uniqueId,
    required this.nickname,
    required this.avatar,
    required this.isRecording,
    required this.createTime,
  });

  factory HostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$HostResponseDTOFromJson(json);

  HostModel toModel() => HostModel(
        hostId: hostId ?? '',
        uniqueId: uniqueId ?? '',
        nickname: nickname?.toString().trim() ?? '',
        avatar: avatar ?? '',
        isRecording: isRecording == 1,
        createTime: createTime ?? 0,
      );
}
