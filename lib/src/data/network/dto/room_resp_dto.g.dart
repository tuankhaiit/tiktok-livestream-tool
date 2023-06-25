// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponseDTO _$RoomResponseDTOFromJson(Map<String, dynamic> json) =>
    RoomResponseDTO(
      roomId: json['roomId'],
      hostId: json['hostId'],
      uniqueId: json['uniqueId'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      commentCount: json['commentCount'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$RoomResponseDTOToJson(RoomResponseDTO instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'hostId': instance.hostId,
      'uniqueId': instance.uniqueId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'commentCount': instance.commentCount,
      'createTime': instance.createTime,
    };
