import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/router/navigator.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  final double size;
  final String? uniqueId;

  const AvatarWidget({
    super.key,
    required this.url,
    required this.size,
    this.uniqueId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (uniqueId != null && uniqueId?.isNotEmpty == true) {
          XNavigator.userProfile(context, uniqueId!);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: url.startsWith('https://')
            ? Image.network(
                url,
                width: size,
                height: size,
                errorBuilder: (_, __, ___) {
                  return Container(
                    alignment: Alignment.center,
                    width: size,
                    height: size,
                    child: const Icon(Icons.error),
                  );
                },
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
