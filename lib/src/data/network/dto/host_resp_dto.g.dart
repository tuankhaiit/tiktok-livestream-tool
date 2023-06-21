// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostResponseDTO _$HostResponseDTOFromJson(Map<String, dynamic> json) =>
    HostResponseDTO(
      userId: json['userId'],
      uniqueId: json['uniqueId'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      isRecording: json['isRecording'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$HostResponseDTOToJson(HostResponseDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'uniqueId': instance.uniqueId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'isRecording': instance.isRecording,
      'createTime': instance.createTime,
    };
