import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String userId,
    required String uniqueId,
    required String nickname,
    required String avatar,
    required String phoneNumber,
    required int createTime,
  }) = _UserModel;
}
