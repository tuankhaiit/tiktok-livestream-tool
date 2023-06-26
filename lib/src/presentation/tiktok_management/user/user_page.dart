import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/network/result.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/widget/appbar.dart';
import 'package:tiktok_tool/src/presentation/widget/host.dart';
import 'package:tiktok_tool/src/presentation/widget/layout.dart';
import 'package:tiktok_tool/src/presentation/widget/page.dart';
import 'package:tiktok_tool/src/presentation/widget/room.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

import '../../../di/di.dart';
import '../../../domain/model/user.dart';
import '../../widget/user.dart';

@RoutePage()
class PotentialUsersPage extends StatelessWidget with DynamicLayout {
  final String? hostId;
  final String? roomId;

  const PotentialUsersPage({
    super.key,
    required this.hostId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Khách hàng tiềm năng'),
      ),
      body: buildDynamicLayout(context),
    );
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return XSinglePageLayoutBuilder(
      child: Column(
        children: [
          HostProfileWidget(
            hostId: hostId,
            roomId: roomId,
          ),
          Expanded(child: _buildUsers(context))
        ],
      ),
    );
  }

  Widget _buildUsers(BuildContext context) {
    late final Future<XApiSnapshot<Iterable<UserModel>>> feature;
    if (hostId != null) {
      feature =
          XDI.I.get<HostRepository>().getPotentialUsersByHost(hostId ?? '');
    } else {
      feature =
          XDI.I.get<HostRepository>().getPotentialUsersByRoom(roomId ?? '');
    }
    return FutureBuilder<XApiSnapshot<Iterable<UserModel>>>(
      future: feature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.requireData;
          if (data.hasData) {
            final users = data.requireData;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.color.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                  child: Row(
                    children: [
                      DefaultTextStyle(
                        style: context.textTheme.titleSmall
                                ?.copyWith(color: context.color.onPrimary) ??
                            const TextStyle(),
                        child: Expanded(
                          child: roomId != null
                              ? RoomInfoWidget(roomId: roomId!)
                              : Container(),
                        ),
                      ),
                      Text(
                        '${NumberFormat.compact().format(users.length)}  khách hàng',
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: context.color.onPrimary),
                      )
                    ],
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
                        return UserItemWidget(
                          user: item,
                          onClick: (item) {
                            XNavigator.comment(
                                context, hostId, roomId, item.uniqueId);
                          },
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
    );
  }
}
