import 'dart:convert';

import 'package:deriv_logger/core/app_logger.dart';
import 'package:flutter/material.dart';

/// The controller for console logs that is responsible for managing the logs
/// into readable streams.
class ConsoleLogController extends ChangeNotifier {
  /// Creates an instance of the controller.
  ConsoleLogController();

  final List<ConsoleLogVM> _logs = <ConsoleLogVM>[];

  /// This returns the logs in reverse order.
  List<ConsoleLogVM> get logs => _logs.reversed.toList();

  /// This will initialize the controller.
  void initialize() {
    AppLogger.logStream.listen((LogDetails log) {
      _logs.add(
        ConsoleLogVM(
          color: _getColorFromLevel(log.logLevel),
          level: log.logLevel.name.toUpperCase(),
          text: _getFormattedLog(log.message),
          time: _getFormattedTime(log.time),
          title: log.title,
          stackTrace: log.stackTrace?.toString(),
        ),
      );
      notifyListeners();
    });
  }

  /// Clears all the logs from the log list.
  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }

  String _getFormattedLog(dynamic object) {
    try {
      if (object is String) {
        return object;
      } else if (object is List || object is Map) {
        final String spaces = ' ' * 2;
        return JsonEncoder.withIndent(spaces).convert(object);
      } else {
        return object.toString();
      }
    } on Exception catch (_) {
      return object.toString();
    }
  }

  String _getFormattedTime(DateTime dateTime) {
    final DateTime dateInLocal = dateTime.toLocal();
    return dateInLocal.toString();
  }

  Color _getColorFromLevel(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return Colors.black;
      case AppLogLevel.info:
        return Colors.blue;
      case AppLogLevel.warning:
        return Colors.orange;
      case AppLogLevel.error:
        return Colors.red;
      case AppLogLevel.fatal:
        return Colors.pink;
      case AppLogLevel.success:
        return Colors.green;
    }
  }
}

/// This is the view model for the console log.
class ConsoleLogVM {
  ///  This is the view model for the console log.
  ConsoleLogVM({
    required this.level,
    required this.text,
    required this.time,
    required this.color,
    this.title,
    this.stackTrace,
  });

  /// The color of the log based on its severity.
  final Color color;

  /// The level of the log i.e
  final String level;

  /// The actual message to print in the console.
  final String text;

  /// THe time stamp
  final String time;

  /// Title of the log.
  final String? title;

  /// Stack trace of the log.
  final String? stackTrace;

  @override
  String toString() => jsonEncode({
        'level': level,
        'time': time,
        'title': title,
        'text': text,
        'stackTrace': stackTrace,
      });
}
