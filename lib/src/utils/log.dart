import 'package:logger/logger.dart';
import 'package:tiktok_tool/src/configuration/env/ENV.dart';

class _MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return ENV.isDebug;
  }
}

class XLog {
  static final Logger _logger = Logger(
    filter: _MyFilter(),
    // Use the default LogFilter (-> only log in debug mode)
    printer: PrefixPrinter(PrettyPrinter(
        methodCount: 3,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        )),
    // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  XLog._();

  /// Log a message at level [Level.verbose].
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}

void logV(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.v(message, error, stackTrace);
}

void logD(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.d(message, error, stackTrace);
}

void logI(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.i(message, error, stackTrace);
}

void logW(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.w(message, error, stackTrace);
}

void logE(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.e(message, error, stackTrace);
}

void logWtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  XLog.wtf(message, error, stackTrace);
}
