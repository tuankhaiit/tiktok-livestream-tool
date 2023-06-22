import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_tool/src/utils/date.dart';

part 'comment.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    required String userId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String comment,
    required int createTime,
  }) = _CommentModel;
}

extension RoomModelExtensions on CommentModel {
  String displayTime() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(createTime);
    return dateTime.shortDateTimeFormatted();
  }
}
