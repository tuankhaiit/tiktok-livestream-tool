import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/http.dart';
import 'package:tiktok_tool/src/presentation/login/bloc/login_state.dart';
import 'package:tiktok_tool/src/socket/socket_connector.dart';

import '../../../di/di.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc()
      : super(const LoginState(
          username: '',
          password: '',
          message: null,
          account: null,
        )) {
    usernameController.addListener(() {
      onUsernameChange(usernameController.text);
    });
    passwordController.addListener(() {
      onPasswordChange(passwordController.text);
    });
  }

  final repository = XDI.I<HostRepository>();

  void onUsernameChange(String username) {
    emit(state.copyWith(username: username));
  }

  void onPasswordChange(String password) {
    emit(state.copyWith(password: password));
  }

  void onFocusUsername() {
    usernameFocus.requestFocus();
  }

  void onFocusPassword() {
    passwordFocus.requestFocus();
  }

  void submit() async {
    if (state.username.isEmpty) {
      emit(state.copyWith(message: 'Vui lòng nhật tài khoản'));
      usernameFocus.requestFocus();
    } else if (state.password.isEmpty) {
      emit(state.copyWith(message: 'Vui lòng nhập mật khẩu'));
      passwordFocus.requestFocus();
    } else {
      _login();
    }
  }

  void _login() async {
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final snapshot = await repository.login(state.username, state.password);
    EasyLoading.dismiss();
    if (snapshot.hasData) {
      _onLoggedIn(snapshot.requireData);
    } else {
      emit(state.copyWith(message: 'Tài khoản hoặc mật khẩu không đúng.'));
    }
  }

  void _onLoggedIn(AccountModel account) async {
    emit(state.copyWith(
      account: account,
    ));
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
}
