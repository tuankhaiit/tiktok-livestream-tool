import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';

part 'comment_resp_dto.g.dart';

@JsonSerializable()
class CommentResponseDTO {
  @JsonKey(name: 'msgId')
  final dynamic msgId;
  @JsonKey(name: 'roomId')
  final dynamic roomId;
  @JsonKey(name: 'userId')
  final dynamic userId;
  @JsonKey(name: 'uniqueId')
  final dynamic uniqueId;
  @JsonKey(name: 'nickname')
  final dynamic nickname;
  @JsonKey(name: 'avatar')
  final dynamic avatar;
  @JsonKey(name: 'comment')
  final dynamic comment;
  @JsonKey(name: 'createTime')
  final dynamic createTime;

  CommentResponseDTO({
    required this.msgId,
    required this.roomId,
    required this.userId,
    required this.uniqueId,
    required this.nickname,
    required this.avatar,
    required this.comment,
    required this.createTime,
  });

  factory CommentResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseDTOFromJson(json);

  CommentModel toModel() => CommentModel(
        id: userId ?? '',
        userId: userId ?? '',
        nickname: nickname ?? '',
        avatar: avatar ?? '',
        comment: comment ?? '',
        createTime: createTime ?? 0,
      );
}
