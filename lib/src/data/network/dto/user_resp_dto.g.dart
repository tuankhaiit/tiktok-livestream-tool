// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseDTO _$UserResponseDTOFromJson(Map<String, dynamic> json) =>
    UserResponseDTO(
      userId: json['userId'],
      uniqueId: json['uniqueId'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      phoneNumber: json['phoneNumber'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$UserResponseDTOToJson(UserResponseDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'uniqueId': instance.uniqueId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'phoneNumber': instance.phoneNumber,
      'createTime': instance.createTime,
    };
