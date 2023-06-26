import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/presentation/account/account_state.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        if (context.read<AccountBloc>().state.isAnonymous) {
          context.router.removeWhere((route) => true);
          XNavigator.login(context);
        } else {
          XNavigator.home(context);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.theme.primaryColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tiktok Livestream Connector',
              style: context.textTheme.displayMedium?.copyWith(
                color: context.color.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Designed by: tuankhaiit',
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.color.onPrimary),
            )
          ],
        ),
      ),
    );
  }
}
