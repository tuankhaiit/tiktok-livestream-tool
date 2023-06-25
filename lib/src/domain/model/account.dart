import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required int id,
    required String username,
    required String nickname,
    required String? avatar,
    required String token,
    required int createTime,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

  static AccountModel empty() => const AccountModel(
    id: -1,
    username: '',
    nickname: '',
    avatar: null,
    token: '',
    createTime: 0
  );
}

extension AccountModelExt on AccountModel {
  bool isAnonymous() {
    return id <= 0 || username.isEmpty;
  }
}
