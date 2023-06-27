// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HostModel {
  String get hostId => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  int get createTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HostModelCopyWith<HostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostModelCopyWith<$Res> {
  factory $HostModelCopyWith(HostModel value, $Res Function(HostModel) then) =
      _$HostModelCopyWithImpl<$Res, HostModel>;
  @useResult
  $Res call(
      {String hostId,
      String uniqueId,
      String nickname,
      String avatar,
      bool isRecording,
      int createTime});
}

/// @nodoc
class _$HostModelCopyWithImpl<$Res, $Val extends HostModel>
    implements $HostModelCopyWith<$Res> {
  _$HostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? uniqueId = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? isRecording = null,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
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
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostModelCopyWith<$Res> implements $HostModelCopyWith<$Res> {
  factory _$$_HostModelCopyWith(
          _$_HostModel value, $Res Function(_$_HostModel) then) =
      __$$_HostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hostId,
      String uniqueId,
      String nickname,
      String avatar,
      bool isRecording,
      int createTime});
}

/// @nodoc
class __$$_HostModelCopyWithImpl<$Res>
    extends _$HostModelCopyWithImpl<$Res, _$_HostModel>
    implements _$$_HostModelCopyWith<$Res> {
  __$$_HostModelCopyWithImpl(
      _$_HostModel _value, $Res Function(_$_HostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? uniqueId = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? isRecording = null,
    Object? createTime = null,
  }) {
    return _then(_$_HostModel(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
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
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HostModel implements _HostModel {
  const _$_HostModel(
      {required this.hostId,
      required this.uniqueId,
      required this.nickname,
      required this.avatar,
      required this.isRecording,
      required this.createTime});

  @override
  final String hostId;
  @override
  final String uniqueId;
  @override
  final String nickname;
  @override
  final String avatar;
  @override
  final bool isRecording;
  @override
  final int createTime;

  @override
  String toString() {
    return 'HostModel(hostId: $hostId, uniqueId: $uniqueId, nickname: $nickname, avatar: $avatar, isRecording: $isRecording, createTime: $createTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostModel &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hostId, uniqueId, nickname, avatar, isRecording, createTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostModelCopyWith<_$_HostModel> get copyWith =>
      __$$_HostModelCopyWithImpl<_$_HostModel>(this, _$identity);
}

abstract class _HostModel implements HostModel {
  const factory _HostModel(
      {required final String hostId,
      required final String uniqueId,
      required final String nickname,
      required final String avatar,
      required final bool isRecording,
      required final int createTime}) = _$_HostModel;

  @override
  String get hostId;
  @override
  String get uniqueId;
  @override
  String get nickname;
  @override
  String get avatar;
  @override
  bool get isRecording;
  @override
  int get createTime;
  @override
  @JsonKey(ignore: true)
  _$$_HostModelCopyWith<_$_HostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
