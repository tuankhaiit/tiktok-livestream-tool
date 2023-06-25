// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponseDTO _$AccountResponseDTOFromJson(Map<String, dynamic> json) =>
    AccountResponseDTO(
      id: json['id'],
      username: json['username'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      token: json['token'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$AccountResponseDTOToJson(AccountResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'token': instance.token,
      'createTime': instance.createTime,
    };
