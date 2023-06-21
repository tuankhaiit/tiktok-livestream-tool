import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/domain/model/user.dart';
import 'package:tiktok_tool/src/domain/repository/host_repository.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/utils/log.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../di/di.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  final String uniqueId;

  const UserProfilePage({super.key, required this.uniqueId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder(
        future: XDI.I<HostRepository>().getUserProfile(uniqueId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.requireData.hasData) {
            return _buildPage(context, snapshot.requireData.requireData);
          } else if (snapshot.hasError) {
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.error?.toString() ?? ''),
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

  Widget _buildPage(BuildContext context, UserModel user) {
    const avatarSize = 100.0;
    final url = 'https://www.tiktok.com/@${user.uniqueId}';
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avatarSize / 2),
            child: Image.network(
              user.avatar,
              width: avatarSize,
              height: avatarSize,
              errorBuilder: (_, __, ___) {
                return Container(
                  alignment: Alignment.center,
                  width: avatarSize,
                  height: avatarSize,
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Text(
            user.nickname,
            style: context.textTheme.titleLarge,
          ),
          Text(
            '@${user.uniqueId}',
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          if (user.phoneNumber.isNotEmpty)
            GestureDetector(
              onTap: () {
                _call(user.phoneNumber);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: context.color.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 11),
                  Text(
                    user.phoneNumber,
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              _openProfile(url);
            },
            child: Row(
              children: [
                Icon(
                  Icons.link,
                  color: context.color.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  url,
                  style: context.textTheme.bodyMedium?.copyWith(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _openProfile(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      logE(e);
    }
  }

  void _call(String phoneNumber) async {
    try {
      await launchUrl(Uri.parse('tel:$phoneNumber'));
    } catch (e) {
      logE(e);
    }
  }
}
