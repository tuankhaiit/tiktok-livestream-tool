import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/login/bloc/login_bloc.dart';
import 'package:tiktok_tool/src/presentation/login/bloc/login_state.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';
import 'package:tiktok_tool/src/presentation/widget/textfield.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final account = state.account;
          if (account != null) {
            context.read<AccountBloc>().onUserLoggedIn(account);
            XNavigator.home(context);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return _buildPage(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, LoginState state) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Đăng nhập'),
      ),
      body: XSinglePageLayoutBuilder(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Tiktok Connector',
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 26),
                ),
                const SizedBox(height: 30),
                ClearableTextField(
                  controller: bloc.usernameController,
                  focusNode: bloc.usernameFocus,
                  decoration: const InputDecoration(hintText: 'Tên đăng nhập'),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    bloc.onFocusPassword();
                  },
                ),
                const SizedBox(height: 14),
                ClearableTextField(
                  obscureText: true,
                  controller: bloc.passwordController,
                  focusNode: bloc.passwordFocus,
                  decoration: const InputDecoration(hintText: 'Mật khẩu'),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    bloc.submit();
                  },
                ),
                const SizedBox(height: 16),
                if (state.message?.isNotEmpty == true)
                  Text(
                    state.message ?? '',
                    style: TextStyle(color: context.color.error),
                  ),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: () {
                    bloc.submit();
                  },
                  child: const Text('Đăng nhập'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
