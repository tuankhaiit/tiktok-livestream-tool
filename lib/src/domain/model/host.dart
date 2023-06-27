import 'package:freezed_annotation/freezed_annotation.dart';

part 'host.freezed.dart';

@freezed
class HostModel with _$HostModel {
  const factory HostModel({
    required String hostId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required bool isRecording,
    required int createTime,
  }) = _HostModel;
}
