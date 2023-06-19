// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseDTO _$CommentResponseDTOFromJson(Map<String, dynamic> json) =>
    CommentResponseDTO(
      msgId: json['msgId'],
      roomId: json['roomId'],
      userId: json['userId'],
      uniqueId: json['uniqueId'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      comment: json['comment'],
      createTime: json['createTime'],
    );

Map<String, dynamic> _$CommentResponseDTOToJson(CommentResponseDTO instance) =>
    <String, dynamic>{
      'msgId': instance.msgId,
      'roomId': instance.roomId,
      'userId': instance.userId,
      'uniqueId': instance.uniqueId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'comment': instance.comment,
      'createTime': instance.createTime,
    };
