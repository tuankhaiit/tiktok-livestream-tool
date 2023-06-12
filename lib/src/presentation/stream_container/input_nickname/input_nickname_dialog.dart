import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/presentation/index.dart';

class InputNicknameDialog {
  InputNicknameDialog._();

  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: 'InputNickname',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return _InputNicknameWidget();
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}

class _InputNicknameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputNicknameState();
}

class _InputNicknameState extends State<_InputNicknameWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _fillCurrentNickname();
    super.initState();
  }

  Future _fillCurrentNickname() async {
    final nickname = await AppStorage().getUniqueId();
    _controller.text = nickname ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final width = min(MediaQuery.of(context).size.width * 0.85, 600.0);
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          decoration: BoxDecoration(
            color: context.theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '@nickname',
                  border: const OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _controller.text = '';
                    },
                    child: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text('Connect'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
