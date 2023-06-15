// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreamStatusState {
  String get roomId => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get memberNum => throw _privateConstructorUsedError;
  bool? get recording => throw _privateConstructorUsedError;
  bool get streamerOnline => throw _privateConstructorUsedError;
  bool get serverOnline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamStatusStateCopyWith<StreamStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamStatusStateCopyWith<$Res> {
  factory $StreamStatusStateCopyWith(
          StreamStatusState value, $Res Function(StreamStatusState) then) =
      _$StreamStatusStateCopyWithImpl<$Res, StreamStatusState>;
  @useResult
  $Res call(
      {String roomId,
      String uniqueId,
      String nickname,
      String avatar,
      String status,
      int memberNum,
      bool? recording,
      bool streamerOnline,
      bool serverOnline});
}

/// @nodoc
class _$StreamStatusStateCopyWithImpl<$Res, $Val extends StreamStatusState>
    implements $StreamStatusStateCopyWith<$Res> {
  _$StreamStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? uniqueId = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? status = null,
    Object? memberNum = null,
    Object? recording = freezed,
    Object? streamerOnline = null,
    Object? serverOnline = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      memberNum: null == memberNum
          ? _value.memberNum
          : memberNum // ignore: cast_nullable_to_non_nullable
              as int,
      recording: freezed == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool?,
      streamerOnline: null == streamerOnline
          ? _value.streamerOnline
          : streamerOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      serverOnline: null == serverOnline
          ? _value.serverOnline
          : serverOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StreamStatusStateCopyWith<$Res>
    implements $StreamStatusStateCopyWith<$Res> {
  factory _$$_StreamStatusStateCopyWith(_$_StreamStatusState value,
          $Res Function(_$_StreamStatusState) then) =
      __$$_StreamStatusStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String uniqueId,
      String nickname,
      String avatar,
      String status,
      int memberNum,
      bool? recording,
      bool streamerOnline,
      bool serverOnline});
}

/// @nodoc
class __$$_StreamStatusStateCopyWithImpl<$Res>
    extends _$StreamStatusStateCopyWithImpl<$Res, _$_StreamStatusState>
    implements _$$_StreamStatusStateCopyWith<$Res> {
  __$$_StreamStatusStateCopyWithImpl(
      _$_StreamStatusState _value, $Res Function(_$_StreamStatusState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? uniqueId = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? status = null,
    Object? memberNum = null,
    Object? recording = freezed,
    Object? streamerOnline = null,
    Object? serverOnline = null,
  }) {
    return _then(_$_StreamStatusState(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      memberNum: null == memberNum
          ? _value.memberNum
          : memberNum // ignore: cast_nullable_to_non_nullable
              as int,
      recording: freezed == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool?,
      streamerOnline: null == streamerOnline
          ? _value.streamerOnline
          : streamerOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      serverOnline: null == serverOnline
          ? _value.serverOnline
          : serverOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StreamStatusState implements _StreamStatusState {
  const _$_StreamStatusState(
      {required this.roomId,
      required this.uniqueId,
      required this.nickname,
      required this.avatar,
      required this.status,
      required this.memberNum,
      required this.recording,
      required this.streamerOnline,
      required this.serverOnline});

  @override
  final String roomId;
  @override
  final String uniqueId;
  @override
  final String nickname;
  @override
  final String avatar;
  @override
  final String status;
  @override
  final int memberNum;
  @override
  final bool? recording;
  @override
  final bool streamerOnline;
  @override
  final bool serverOnline;

  @override
  String toString() {
    return 'StreamStatusState(roomId: $roomId, uniqueId: $uniqueId, nickname: $nickname, avatar: $avatar, status: $status, memberNum: $memberNum, recording: $recording, streamerOnline: $streamerOnline, serverOnline: $serverOnline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StreamStatusState &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.memberNum, memberNum) ||
                other.memberNum == memberNum) &&
            (identical(other.recording, recording) ||
                other.recording == recording) &&
            (identical(other.streamerOnline, streamerOnline) ||
                other.streamerOnline == streamerOnline) &&
            (identical(other.serverOnline, serverOnline) ||
                other.serverOnline == serverOnline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, uniqueId, nickname,
      avatar, status, memberNum, recording, streamerOnline, serverOnline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StreamStatusStateCopyWith<_$_StreamStatusState> get copyWith =>
      __$$_StreamStatusStateCopyWithImpl<_$_StreamStatusState>(
          this, _$identity);
}

abstract class _StreamStatusState implements StreamStatusState {
  const factory _StreamStatusState(
      {required final String roomId,
      required final String uniqueId,
      required final String nickname,
      required final String avatar,
      required final String status,
      required final int memberNum,
      required final bool? recording,
      required final bool streamerOnline,
      required final bool serverOnline}) = _$_StreamStatusState;

  @override
  String get roomId;
  @override
  String get uniqueId;
  @override
  String get nickname;
  @override
  String get avatar;
  @override
  String get status;
  @override
  int get memberNum;
  @override
  bool? get recording;
  @override
  bool get streamerOnline;
  @override
  bool get serverOnline;
  @override
  @JsonKey(ignore: true)
  _$$_StreamStatusStateCopyWith<_$_StreamStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}
