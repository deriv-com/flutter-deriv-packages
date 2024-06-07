import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/interfaces/call_history_provider.dart';

/// The controller for network logs that is responsible for managing the logs
class NetworkLogsController extends ChangeNotifier {
  /// Creates an instance of the controller.
  NetworkLogsController(CallHistoryProvider exposure) {
    exposure.stream.listen((NetworkPayload payload) => addLog(payload));
  }

  final List<NetworkLogVM> _logs = <NetworkLogVM>[];

  /// List of network logs like request and response.
  List<NetworkLogVM> get logs => _logs.reversed.toList();

  /// Add new log to the log list.
  void addLog(NetworkPayload log) {
    final NetworkLogVM vm = NetworkLogVM(
      type: log.direction == 'SENT'
          ? NetworkLogType.request
          : NetworkLogType.response,
      title: log.method,
      body: _getReadableBody(log.body),
      time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
    );
    _logs.add(vm);
    notifyListeners();
  }

  String _getReadableBody(Object message) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(message);
  }

  /// This will clear logs from the log list.
  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }
}

/// View model for Network log
class NetworkLogVM {
  /// Creates an instance of NetworkLogVM.
  /// [type] is the type of log i.e REQUEST or RESPONSE.
  /// [body] is the content of the log.
  /// [time] is the time when the log was created.
  /// [title] is the title of the log.
  NetworkLogVM({
    required this.type,
    required this.body,
    required this.time,
    this.title = '',
  });

  /// Type of log.
  final NetworkLogType type;

  /// Content of the log.
  final String body;

  /// Title of the log.
  final String title;

  /// Time when the log was created.
  final DateTime time;

  /// Returns true if the log is request.
  bool get isRequest => type == NetworkLogType.request;

  /// Get time in string format: HH:MM:SS:MS
  String get getTimeString =>
      '${time.hour}:${time.minute}:${time.second}:${time.millisecond}';

  Color get getColor =>
      isRequest ? Colors.deepPurple[300] ?? Colors.deepPurple : Colors.green;
}

/// Type of network log.
enum NetworkLogType {
  /// Request log
  request,

  /// Response log
  response,
}
