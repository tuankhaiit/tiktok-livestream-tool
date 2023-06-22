import 'package:flutter/material.dart';
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
