import 'dart:async';

import 'package:logger/logger.dart';

enum AppLogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
  success,
}

const Map<Level, AppLogLevel> _packageLogLevelToAppLogLevel = {
  Level.trace: AppLogLevel.success,
  Level.info: AppLogLevel.info,
  Level.warning: AppLogLevel.warning,
  Level.error: AppLogLevel.error,
  Level.fatal: AppLogLevel.fatal,
};

class AppLogger {
  AppLogger._();
  static late Logger _logger;
  static bool _enableDebugging = false;

  static late StreamController<LogDetails> _logController;

  /// Initialize the logger.
  static void initialize({bool enableDebugging = true}) {
    _enableDebugging = enableDebugging;

    _logger = Logger(
      filter: DevelopmentFilter(),
      printer: PrettyPrinter(
        methodCount: 0,
        levelColors: <Level, AnsiColor>{
          Level.trace: const AnsiColor.fg(2),
        },
      ),
    );
    _logController = StreamController<LogDetails>.broadcast();
  }

  ///  Stream of logs.
  static Stream<LogDetails> get logStream => _logController.stream;

  /// This logs [error] messages with red color.
  static void e(
    dynamic message, {
    DateTime? time,
    String? title,
    StackTrace? stackTrace,
  }) {
    _log(
      level: Level.error,
      message: message,
      title: title,
      time: time,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  /// This logs [information] message with blue color.
  static void i(
    dynamic message, {
    DateTime? time,
    String? title,
    StackTrace? stackTrace,
  }) {
    _log(
      message: message,
      stackTrace: stackTrace ?? StackTrace.empty,
      title: title,
      time: time,
    );
  }

  /// This logs [warning] message with yellow color.
  static void w(
    dynamic message, {
    DateTime? time,
    String? title,
    StackTrace? stackTrace,
  }) {
    _log(
      level: Level.warning,
      message: message,
      title: title,
      time: time,
      stackTrace: stackTrace ?? StackTrace.empty,
    );
  }

  /// This logs [fatal] messages with purple color.
  static void f(
    dynamic message, {
    DateTime? time,
    String? title,
    StackTrace? stackTrace,
  }) {
    _log(
      level: Level.fatal,
      message: message,
      title: title,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  /// This logs [successful] events/message with green color.
  static void s(
    dynamic message, {
    DateTime? time,
    String? title,
  }) {
    _log(
      level: Level.trace,
      message: message,
      title: title,
      stackTrace: StackTrace.empty,
      time: time,
    );
  }

  void dispose() {
    _logController.close();
  }

  static void _log({
    Level level = Level.info,
    dynamic message,
    DateTime? time,
    String? title,
    StackTrace? stackTrace,
  }) {
    if (!_enableDebugging) return;
    _logger.log(
      level,
      message,
      time: time,
      error: title,
      stackTrace: stackTrace,
    );
    _logController.sink.add(
      LogDetails(
        title: title ?? '',
        message: message,
        time: time ?? DateTime.now(),
        stackTrace: stackTrace,
        logLevel: _packageLogLevelToAppLogLevel[level]!,
      ),
    );
  }
}

class LogDetails {
  /// Details of the logs.
  LogDetails({
    required this.title,
    required this.message,
    required this.time,
    required this.logLevel,
    this.stackTrace,
  });

  final DateTime time;
  final String title;
  final dynamic message;
  final AppLogLevel logLevel;
  final StackTrace? stackTrace;
}
