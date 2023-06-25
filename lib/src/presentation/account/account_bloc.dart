import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';

import '../../di/di.dart';
import '../../network/http.dart';
import '../../socket/socket_connector.dart';
import 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState(account: null)) {
    AppStorage()
        .getAccount()
        .then((value) => emit(state.copyWith(account: value)));
  }

  onUserLoggedIn(AccountModel account) async {
    await AppStorage().saveAccount(account);
    XDI.I<XRestService>().addAuthorization(account.token);
    SocketService.setAccountId(account.id.toString());
    emit(state.copyWith(account: account));
  }

  onUserLoggedOut() async {
    await AppStorage().clearAccount();
    XDI.I<XRestService>().removeAuthorization();
    SocketService.setAccountId('');
    emit(state.copyWith(account: null));
  }
}
