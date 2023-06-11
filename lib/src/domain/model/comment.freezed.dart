// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get nickname => throw _privateConstructorUsedError;
  dynamic get avatar => throw _privateConstructorUsedError;
  dynamic get comment => throw _privateConstructorUsedError;
  dynamic get createTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {dynamic id,
      dynamic userId,
      dynamic nickname,
      dynamic avatar,
      dynamic comment,
      dynamic createTime});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? nickname = freezed,
    Object? avatar = freezed,
    Object? comment = freezed,
    Object? createTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as dynamic,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$_CommentModelCopyWith(
          _$_CommentModel value, $Res Function(_$_CommentModel) then) =
      __$$_CommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      dynamic userId,
      dynamic nickname,
      dynamic avatar,
      dynamic comment,
      dynamic createTime});
}

/// @nodoc
class __$$_CommentModelCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$_CommentModel>
    implements _$$_CommentModelCopyWith<$Res> {
  __$$_CommentModelCopyWithImpl(
      _$_CommentModel _value, $Res Function(_$_CommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? nickname = freezed,
    Object? avatar = freezed,
    Object? comment = freezed,
    Object? createTime = freezed,
  }) {
    return _then(_$_CommentModel(
      id: freezed == id ? _value.id! : id,
      userId: freezed == userId ? _value.userId! : userId,
      nickname: freezed == nickname ? _value.nickname! : nickname,
      avatar: freezed == avatar ? _value.avatar! : avatar,
      comment: freezed == comment ? _value.comment! : comment,
      createTime: freezed == createTime ? _value.createTime! : createTime,
    ));
  }
}

/// @nodoc

class _$_CommentModel implements _CommentModel {
  const _$_CommentModel(
      {required this.id,
      required this.userId,
      required this.nickname,
      required this.avatar,
      required this.comment,
      required this.createTime});

  @override
  final dynamic id;
  @override
  final dynamic userId;
  @override
  final dynamic nickname;
  @override
  final dynamic avatar;
  @override
  final dynamic comment;
  @override
  final dynamic createTime;

  @override
  String toString() {
    return 'CommentModel(id: $id, userId: $userId, nickname: $nickname, avatar: $avatar, comment: $comment, createTime: $createTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.createTime, createTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(createTime));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      __$$_CommentModelCopyWithImpl<_$_CommentModel>(this, _$identity);
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {required final dynamic id,
      required final dynamic userId,
      required final dynamic nickname,
      required final dynamic avatar,
      required final dynamic comment,
      required final dynamic createTime}) = _$_CommentModel;

  @override
  dynamic get id;
  @override
  dynamic get userId;
  @override
  dynamic get nickname;
  @override
  dynamic get avatar;
  @override
  dynamic get comment;
  @override
  dynamic get createTime;
  @override
  @JsonKey(ignore: true)
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
