import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  factory AccountState({
    required AccountModel? account,
  }) = _AccountState;
}

extension AccountStateExt on AccountState {
  bool get isAnonymous {
    return account == null || account?.isAnonymous == true;
  }
}
