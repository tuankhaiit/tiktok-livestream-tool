// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_page_horizontal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomPageHorizontalState {
  String get hostId => throw _privateConstructorUsedError;
  RoomModel? get selectedRoom => throw _privateConstructorUsedError;
  Future<XApiSnapshot<Iterable<CommentModel>>>? get roomFuture =>
      throw _privateConstructorUsedError;
  CommentModel? get selectedUserComment => throw _privateConstructorUsedError;
  Future<XApiSnapshot<Iterable<CommentModel>>>? get userCommentFuture =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomPageHorizontalStateCopyWith<RoomPageHorizontalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomPageHorizontalStateCopyWith<$Res> {
  factory $RoomPageHorizontalStateCopyWith(RoomPageHorizontalState value,
          $Res Function(RoomPageHorizontalState) then) =
      _$RoomPageHorizontalStateCopyWithImpl<$Res, RoomPageHorizontalState>;
  @useResult
  $Res call(
      {String hostId,
      RoomModel? selectedRoom,
      Future<XApiSnapshot<Iterable<CommentModel>>>? roomFuture,
      CommentModel? selectedUserComment,
      Future<XApiSnapshot<Iterable<CommentModel>>>? userCommentFuture});

  $RoomModelCopyWith<$Res>? get selectedRoom;
  $CommentModelCopyWith<$Res>? get selectedUserComment;
}

/// @nodoc
class _$RoomPageHorizontalStateCopyWithImpl<$Res,
        $Val extends RoomPageHorizontalState>
    implements $RoomPageHorizontalStateCopyWith<$Res> {
  _$RoomPageHorizontalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? selectedRoom = freezed,
    Object? roomFuture = freezed,
    Object? selectedUserComment = freezed,
    Object? userCommentFuture = freezed,
  }) {
    return _then(_value.copyWith(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRoom: freezed == selectedRoom
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      roomFuture: freezed == roomFuture
          ? _value.roomFuture
          : roomFuture // ignore: cast_nullable_to_non_nullable
              as Future<XApiSnapshot<Iterable<CommentModel>>>?,
      selectedUserComment: freezed == selectedUserComment
          ? _value.selectedUserComment
          : selectedUserComment // ignore: cast_nullable_to_non_nullable
              as CommentModel?,
      userCommentFuture: freezed == userCommentFuture
          ? _value.userCommentFuture
          : userCommentFuture // ignore: cast_nullable_to_non_nullable
              as Future<XApiSnapshot<Iterable<CommentModel>>>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res>? get selectedRoom {
    if (_value.selectedRoom == null) {
      return null;
    }

    return $RoomModelCopyWith<$Res>(_value.selectedRoom!, (value) {
      return _then(_value.copyWith(selectedRoom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentModelCopyWith<$Res>? get selectedUserComment {
    if (_value.selectedUserComment == null) {
      return null;
    }

    return $CommentModelCopyWith<$Res>(_value.selectedUserComment!, (value) {
      return _then(_value.copyWith(selectedUserComment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoomPageHorizontalStateCopyWith<$Res>
    implements $RoomPageHorizontalStateCopyWith<$Res> {
  factory _$$_RoomPageHorizontalStateCopyWith(_$_RoomPageHorizontalState value,
          $Res Function(_$_RoomPageHorizontalState) then) =
      __$$_RoomPageHorizontalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hostId,
      RoomModel? selectedRoom,
      Future<XApiSnapshot<Iterable<CommentModel>>>? roomFuture,
      CommentModel? selectedUserComment,
      Future<XApiSnapshot<Iterable<CommentModel>>>? userCommentFuture});

  @override
  $RoomModelCopyWith<$Res>? get selectedRoom;
  @override
  $CommentModelCopyWith<$Res>? get selectedUserComment;
}

/// @nodoc
class __$$_RoomPageHorizontalStateCopyWithImpl<$Res>
    extends _$RoomPageHorizontalStateCopyWithImpl<$Res,
        _$_RoomPageHorizontalState>
    implements _$$_RoomPageHorizontalStateCopyWith<$Res> {
  __$$_RoomPageHorizontalStateCopyWithImpl(_$_RoomPageHorizontalState _value,
      $Res Function(_$_RoomPageHorizontalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? selectedRoom = freezed,
    Object? roomFuture = freezed,
    Object? selectedUserComment = freezed,
    Object? userCommentFuture = freezed,
  }) {
    return _then(_$_RoomPageHorizontalState(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRoom: freezed == selectedRoom
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      roomFuture: freezed == roomFuture
          ? _value.roomFuture
          : roomFuture // ignore: cast_nullable_to_non_nullable
              as Future<XApiSnapshot<Iterable<CommentModel>>>?,
      selectedUserComment: freezed == selectedUserComment
          ? _value.selectedUserComment
          : selectedUserComment // ignore: cast_nullable_to_non_nullable
              as CommentModel?,
      userCommentFuture: freezed == userCommentFuture
          ? _value.userCommentFuture
          : userCommentFuture // ignore: cast_nullable_to_non_nullable
              as Future<XApiSnapshot<Iterable<CommentModel>>>?,
    ));
  }
}

/// @nodoc

class _$_RoomPageHorizontalState implements _RoomPageHorizontalState {
  _$_RoomPageHorizontalState(
      {required this.hostId,
      this.selectedRoom,
      this.roomFuture,
      this.selectedUserComment,
      this.userCommentFuture});

  @override
  final String hostId;
  @override
  final RoomModel? selectedRoom;
  @override
  final Future<XApiSnapshot<Iterable<CommentModel>>>? roomFuture;
  @override
  final CommentModel? selectedUserComment;
  @override
  final Future<XApiSnapshot<Iterable<CommentModel>>>? userCommentFuture;

  @override
  String toString() {
    return 'RoomPageHorizontalState(hostId: $hostId, selectedRoom: $selectedRoom, roomFuture: $roomFuture, selectedUserComment: $selectedUserComment, userCommentFuture: $userCommentFuture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomPageHorizontalState &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.selectedRoom, selectedRoom) ||
                other.selectedRoom == selectedRoom) &&
            (identical(other.roomFuture, roomFuture) ||
                other.roomFuture == roomFuture) &&
            (identical(other.selectedUserComment, selectedUserComment) ||
                other.selectedUserComment == selectedUserComment) &&
            (identical(other.userCommentFuture, userCommentFuture) ||
                other.userCommentFuture == userCommentFuture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hostId, selectedRoom, roomFuture,
      selectedUserComment, userCommentFuture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomPageHorizontalStateCopyWith<_$_RoomPageHorizontalState>
      get copyWith =>
          __$$_RoomPageHorizontalStateCopyWithImpl<_$_RoomPageHorizontalState>(
              this, _$identity);
}

abstract class _RoomPageHorizontalState implements RoomPageHorizontalState {
  factory _RoomPageHorizontalState(
      {required final String hostId,
      final RoomModel? selectedRoom,
      final Future<XApiSnapshot<Iterable<CommentModel>>>? roomFuture,
      final CommentModel? selectedUserComment,
      final Future<XApiSnapshot<Iterable<CommentModel>>>?
          userCommentFuture}) = _$_RoomPageHorizontalState;

  @override
  String get hostId;
  @override
  RoomModel? get selectedRoom;
  @override
  Future<XApiSnapshot<Iterable<CommentModel>>>? get roomFuture;
  @override
  CommentModel? get selectedUserComment;
  @override
  Future<XApiSnapshot<Iterable<CommentModel>>>? get userCommentFuture;
  @override
  @JsonKey(ignore: true)
  _$$_RoomPageHorizontalStateCopyWith<_$_RoomPageHorizontalState>
      get copyWith => throw _privateConstructorUsedError;
}
