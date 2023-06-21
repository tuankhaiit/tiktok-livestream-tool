import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/model/comment.dart';
import 'package:tiktok_tool/src/domain/model/room.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/comment.dart';

import '../../di/di.dart';
import '../../domain/model/user.dart';
import '../widget/user.dart';

@RoutePage()
class PotentialUsersPage extends StatelessWidget {
  final String? uniqueId;
  final String? roomId;

  const PotentialUsersPage(
      {super.key, required this.uniqueId, required this.roomId});

  @override
  Widget build(BuildContext context) {
    late final Future<XApiSnapshot<Iterable<UserModel>>> feature;
    if (uniqueId != null) {
      feature =
          XDI.I.get<HostRepository>().getPotentialUsersByHost(uniqueId ?? '');
    } else {
      feature =
          XDI.I.get<HostRepository>().getPotentialUsersByRoom(roomId ?? '');
    }
    return Scaffold(
      appBar: AppBar(
        // title: Text(hostModel?.nickname ?? ''),
      ),
      body: FutureBuilder<XApiSnapshot<Iterable<UserModel>>>(
        future: feature,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            if (data.hasData) {
              final users = data.requireData;
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.color.primary,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${NumberFormat.compact().format(users.length)} users',
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: context.color.onPrimary),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      thickness: 10,
                      interactive: true,
                      trackVisibility: true,
                      radius: const Radius.circular(5),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = users.elementAt(index);
                          return UserWidget(
                            user: item,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: context.color.onPrimary,
                          );
                        },
                        itemCount: users.length,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Text(data.error.toString()),
              );
            }
          }
          if (snapshot.hasError) {
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
