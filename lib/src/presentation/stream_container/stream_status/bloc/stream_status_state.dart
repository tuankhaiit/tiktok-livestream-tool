import 'package:freezed_annotation/freezed_annotation.dart';

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
    required int connectionNum,
    required bool serverOnline,
  }) = _StreamStatusState;

  static StreamStatusState none() => const StreamStatusState(
      roomId: '',
      uniqueId: '',
      nickname: '',
      avatar: '',
      status: '',
      memberNum: 0,
      connectionNum: 0,
      serverOnline: false);

  static StreamStatusState empty(StreamStatusState state) => state.copyWith(
        roomId: '',
        uniqueId: '',
        nickname: '',
        avatar: '',
        status: '',
        memberNum: 0,
      );

  static StreamStatusState offline(StreamStatusState state) =>
      empty(state).copyWith(status: 'Offline');
}
