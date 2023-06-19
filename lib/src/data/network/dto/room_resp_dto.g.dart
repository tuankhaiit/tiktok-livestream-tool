// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponseDTO _$RoomResponseDTOFromJson(Map<String, dynamic> json) =>
    RoomResponseDTO(
      roomId: json['roomId'],
      userId: json['userId'],
      uniqueId: json['uniqueId'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      commentCount: json['commentCount'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$RoomResponseDTOToJson(RoomResponseDTO instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'userId': instance.userId,
      'uniqueId': instance.uniqueId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'commentCount': instance.commentCount,
      'createTime': instance.createTime,
    };
