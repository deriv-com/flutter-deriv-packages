import 'dart:convert';

import 'package:deriv_logger/services/network_service.dart';
import 'package:flutter/material.dart';

/// The controller for network logs that is responsible for managing the logs
abstract class NetworkLogsController extends ChangeNotifier {
  NetworkLogsController({NetworkLogEmitter? emitter}) {
    emitter?.stream.listen(incomingLog);
  }

  void incomingLog(NetworkLogPayload log);

  String getReadableBody(Object message) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(message);
  }

  bool isRequest(NetworkLogPayload log) => log.direction == LogDirection.sent;

  void searchLogs(String value) {
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

  Color get getColor =>
      isRequest ? Colors.deepPurple[300] ?? Colors.deepPurple : Colors.green;

  String get methodValue => jsonDecode(body)[title]?.toString() ?? '';

  bool get hasError => jsonDecode(body)['error'] != null;
}

/// Type of network log.
enum NetworkLogType {
  /// Request log
  request,

  /// Response log
  response,
}
