import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';

part 'stream_status_state.freezed.dart';

@freezed
class StreamStatusState with _$StreamStatusState {
  const factory StreamStatusState({
    required String roomId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String status,
    required int memberNum,
    required bool streamerOnline,
    required bool serverOnline,
  }) = _StreamStatusState;

  static StreamStatusState empty() => const StreamStatusState(
      roomId: '',
      uniqueId: '',
      nickname: '',
      avatar: '',
      status: '',
      memberNum: 0,
      streamerOnline: false,
      serverOnline: false);

  static StreamStatusState offline() => const StreamStatusState(
      roomId: '',
      uniqueId: '',
      nickname: '',
      avatar: '',
      status: 'Offline',
      memberNum: 0,
      streamerOnline: false,
      serverOnline: true);
}
