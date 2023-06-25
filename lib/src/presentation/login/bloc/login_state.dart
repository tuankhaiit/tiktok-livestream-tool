import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String username,
    required String password,
    required String? message,
    required AccountModel? account,
  }) = _LoginState;
}
