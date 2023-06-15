import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_tool/src/data/service/app_storage.dart';
import 'package:tiktok_tool/src/presentation/index.dart';
import 'package:tiktok_tool/src/presentation/stream_container/stream_status/bloc/stream_status_bloc.dart';

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
  String? _previousNickname;
  String _nickname = '';
  bool _enabled = false;

  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(() {
        final newValue = _controller.text;
        setState(() {
          if (newValue.startsWith('https://')) {
            final exp = RegExp(r'@(\w+)');
            final result = exp.firstMatch(newValue);
            if (result != null && result.groupCount > 0) {
              _nickname = result.group(0) ?? '';
            } else {
              _nickname = '';
            }
          } else {
            _nickname = newValue;
          }

          _enabled = _nickname.isNotEmpty && _nickname != _previousNickname;
        });
      });
    _fillCurrentNickname();
    super.initState();
  }

  Future _fillCurrentNickname() async {
    _previousNickname = await AppStorage().getUniqueId();
    _controller.text = _previousNickname ?? '';
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
                  hintText: 'nickname',
                  border: const OutlineInputBorder(),
                  prefix: Text('@', style: context.textTheme.bodyLarge),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _controller.text = '';
                    },
                    child: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _enabled
                    ? () async {
                        final nickname = _controller.text;
                        if (nickname.isNotEmpty) {
                          Navigator.of(context).pop();
                          context
                              .read<StreamStatusBloc>()
                              .reConnectServer(nickname);
                        }
                      }
                    : null,
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
