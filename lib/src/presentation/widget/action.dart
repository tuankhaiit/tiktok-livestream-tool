import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/domain/model/account.dart';
import 'package:tiktok_tool/src/presentation/account/account_bloc.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

class PotentialUserActionWidget extends StatelessWidget {
  final String? hostId;
  final String? roomId;

  const PotentialUserActionWidget({super.key, this.hostId, this.roomId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        XNavigator.potentialUsers(context, hostId, roomId);
      },
      icon: Icon(
        Icons.groups,
        color: context.color.primary,
      ),
    );
  }
}

class JoinLiveStreamActionWidget extends StatelessWidget {
  final String uniqueId;
  final bool? overrideRole;

  const JoinLiveStreamActionWidget({
    super.key,
    required this.uniqueId,
    this.overrideRole,
  });

  @override
  Widget build(BuildContext context) {
    final account = context.read<AccountBloc>().state.account;
    if (overrideRole == true && account?.isAdminRole == true) {
      return IconButton(
        onPressed: () async {
          XNavigator.livestream(context, uniqueId);
        },
        icon: const Icon(
          Icons.play_circle,
          size: 26,
          color: Colors.green,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
