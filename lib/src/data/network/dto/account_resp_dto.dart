import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

part 'account_resp_dto.g.dart';

@JsonSerializable()
class AccountResponseDTO {
  @JsonKey(name: 'id')
  final dynamic id;
  @JsonKey(name: 'username')
  final dynamic username;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'token')
  final dynamic token;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  AccountResponseDTO({
    required this.id,
    required this.username,
    required this.nickname,
    required this.avatar,
    required this.token,
    required this.createTime,
  });

  factory AccountResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseDTOFromJson(json);

  AccountModel toModel() => AccountModel(
        id: id ?? '',
        username: username ?? '',
        nickname: nickname,
        avatar: avatar ?? '',
        token: token ?? '',
        createTime: createTime ?? 0,
      );
}
