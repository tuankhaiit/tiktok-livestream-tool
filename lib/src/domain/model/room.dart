import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/utils/date.dart';

part 'room.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String roomId,
    required String userId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String status,
    required int commentCount,
    required int createTime,
  }) = _RoomModel;
}

extension RoomModelExtensions on RoomModel {
  String displayTitle() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(createTime * 1000);
    return dateTime.dateTimeFormatted();
  }
}
