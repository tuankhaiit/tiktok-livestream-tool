import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

import '../../di/di.dart';
import '../../network/http.dart';
import '../../socket/socket_connector.dart';
import 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState(account: null)) {
    AppStorage().getAccount().then((account) {
      if (account != null) {
        _setupWithAccount(account);
      }
      emit(state.copyWith(account: account));
    });
  }

  _setupWithAccount(AccountModel account) {
    XDI.I<XRestService>().addAuthorization(account.token);
    SocketService.setAccountId(account.id.toString());
  }

  onUserLoggedIn(AccountModel account) async {
    AppStorage().saveAccount(account);
    _setupWithAccount(account);
    emit(state.copyWith(account: account));
  }

  onUserLoggedOut() async {
    final account = await AppStorage().getAccount();
    await AppStorage().saveAccount(
      AccountModel.empty().copyWith(username: account?.username ?? ''),
    );
    XDI.I<XRestService>().removeAuthorization();
    SocketService.setAccountId('');
    emit(state.copyWith(account: null));
  }
}
