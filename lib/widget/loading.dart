import 'dart:async';

import 'package:flutter/material.dart';

class XLoading {
  XLoadingOverlayEntry? overlayEntry;

  Widget? _w;

  Widget? get w => _w;

  GlobalKey<XLoadingContainerState>? _key;

  GlobalKey<XLoadingContainerState>? get key => _key;

  Timer? _timer;

  XLoading._();
  XLoading._internal() {}

  static bool get isShow => instance.w != null && instance.key !=  null;

  static Future<void> show() {
    return instance._show();
  }

  static Future<void> dismiss() {
    return instance._dismiss();
  }

  Future<void> _show() async {
    if (_key != null) await dismiss();

    Completer<void> completer = Completer<void>();
    _key = GlobalKey<XLoadingContainerState>();

    _w = _XLoadingContainer(
      key: _key,
      completer: completer,
    );
    completer.future.whenComplete(() {
      _cancelTimer();
      _timer = Timer(const Duration(seconds: 30), () async {
        dismiss();
      });
    });
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss() async {
    if (key != null && key?.currentState == null) {
      _reset();
      return;
    }

    return key?.currentState?.dismiss().whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _w = null;
    _key = null;
    _cancelTimer();
    _markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, _XLoadingWidget(child: child));
      } else {
        return _XLoadingWidget(child: child);
      }
    };
  }

  static final XLoading _instance = XLoading._internal();

  static XLoading get instance => _instance;
}

class _XLoadingWidget extends StatefulWidget {
  final Widget? child;

  const _XLoadingWidget({required this.child});

  @override
  State<StatefulWidget> createState() => _XLoadingState();
}

class _XLoadingState extends State<_XLoadingWidget> {
  late XLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = XLoadingOverlayEntry(
      builder: (BuildContext context) => XLoading.instance.w ?? Container(),
    );
    XLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          XLoadingOverlayEntry(
            builder: (BuildContext context) {
              return widget.child ?? Container();
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}

class XLoadingOverlayEntry extends OverlayEntry {
  XLoadingOverlayEntry({
    required WidgetBuilder builder,
  }) : super(builder: builder);
}

class _XLoadingContainer extends StatefulWidget {
  final Completer<void>? completer;

  const _XLoadingContainer({super.key, required this.completer});

  @override
  State<StatefulWidget> createState() => XLoadingContainerState();
}

class XLoadingContainerState extends State<_XLoadingContainer> {
  @override
  void initState() {
    widget.completer?.complete(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: const IgnorePointer(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        )
      ],
    );
  }

  Future<void> dismiss() {
    return Future.sync(() => null);
  }
}
