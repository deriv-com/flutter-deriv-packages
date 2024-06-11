import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/interfaces/call_history_provider.dart';

/// The controller for network logs that is responsible for managing the logs
class NetworkLogsController extends ChangeNotifier {
  /// Creates an instance of the controller.
  /// Here, [exposure] is a provider for one time call.
  /// For eg: sending request for exchange_rate and getting a response for it.
  /// [subscriptionExposure] is a provider for subscription call.
  NetworkLogsController({
    required CallHistoryProvider exposure,
    required CallHistoryProvider subscriptionExposure,
  }) {
    exposure.stream.listen((NetworkPayload payload) => addToCallLog(payload));
    subscriptionExposure.stream
        .listen((NetworkPayload payload) => addToSubscriptionLog(payload));
  }

  final List<CallLogVM> _callLogs = <CallLogVM>[];
  final List<SubscriptionLogVM> _subscriptionLogs = <SubscriptionLogVM>[];

  /// List of network logs like request and response.
  List<CallLogVM> get logs => _callLogs.reversed.toList();

  /// List of network logs like request and response.
  List<SubscriptionLogVM> get subscriptionLogs =>
      _subscriptionLogs.reversed.toList();

  /// Add new log to the log list.
  void addToCallLog(NetworkPayload log) {
    if (isRequest(log)) {
      final CallLogVM vm = CallLogVM(
        type: NetworkLogType.request,
        title: log.method,
        body: _getReadableBody(log.body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      );
      _callLogs.add(vm);
      notifyListeners();
    } else {
      final CallLogVM vm = CallLogVM(
        type: NetworkLogType.response,
        title: log.method,
        body: _getReadableBody(log.body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      );
      final CallLogVM request = _callLogs.firstWhere(
        (CallLogVM element) =>
            json.decode(element.body)['req_id'] ==
            json.decode(vm.body)['req_id'],
      );
      if (request != null) {
        request.pair = vm;
      } else {
        _callLogs.add(vm);
      }
      notifyListeners();
    }
  }

  void addToSubscriptionLog(NetworkPayload payload) {
    if (isRequest(payload)) {
      _subscriptionLogs.add(SubscriptionLogVM(
        type: NetworkLogType.request,
        title: payload.method,
        body: _getReadableBody(payload.body),
        time: DateTime.fromMillisecondsSinceEpoch(payload.timeStamp),
      ));
    } else {
      final SubscriptionLogVM vm = SubscriptionLogVM(
        title: payload.method,
        type: NetworkLogType.response,
        body: _getReadableBody(payload.body),
        time: DateTime.fromMillisecondsSinceEpoch(payload.timeStamp),
      );
      final SubscriptionLogVM existingLog = _subscriptionLogs.firstWhere(
          (log) =>
              jsonDecode(log.body)['req_id'] == jsonDecode(vm.body)['req_id']);
      if (existingLog != null) {
        existingLog.payloads = [...existingLog.payloads, vm];
      } else {
        _subscriptionLogs.add(vm);
      }
    }
    notifyListeners();
  }

  /// This will clear logs from the log list.
  void clearLogs() {
    _callLogs.clear();
    notifyListeners();
  }

  String _getReadableBody(Object message) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(message);
  }

  bool isRequest(NetworkPayload log) => log.direction == 'SENT';
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
}

/// Type of network log.
enum NetworkLogType {
  /// Request log
  request,

  /// Response log
  response,
}

class CallLogVM extends NetworkLogVM {
  CallLogVM? pair;
  CallLogVM({
    required super.type,
    required super.body,
    required super.time,
    super.title = '',
    this.pair,
  }) : assert(pair == null || pair.type == NetworkLogType.response);

  bool get hasResponse => pair != null;

  /// Get time in string format: HH:MM:SS:MS
  String get getTimeString => pair != null
      ? '${pair!.time.difference(time).inMilliseconds.toString()} ms'
      : '-';

  bool get hasError => pair != null && jsonDecode(pair!.body)['error'] != null;

  @override
  Color get getColor =>
      hasError ? Colors.redAccent[400] ?? Colors.red : super.getColor;
}

class SubscriptionLogVM extends NetworkLogVM {
  List<NetworkLogVM> payloads;

  SubscriptionLogVM({
    required super.type,
    required super.body,
    required super.time,
    super.title = '',
    this.payloads = const <NetworkLogVM>[],
  });

  List<NetworkLogVM> get getPayloads => payloads.reversed.toList();
}
