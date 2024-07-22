import 'dart:convert';

import 'package:deriv_logger/controllers/network_logs_controller.dart';
import 'package:deriv_logger/services/network_service.dart';
import 'package:flutter/material.dart';

class CallLogController extends NetworkLogsController {
  CallLogController({
    NetworkLogEmitter? callEmitter,
  }) : super(emitter: callEmitter);

  final TextEditingController _searchController = TextEditingController();
  final List<CallLogVM> _callLogs = <CallLogVM>[];

  /// Search controller for searching logs.
  TextEditingController get searchController => _searchController;

  @override
  void incomingLog(NetworkLogPayload log) {
    if (isRequest(log)) {
      final CallLogVM vm = CallLogVM(
        type: NetworkLogType.request,
        title: log.method,
        body: getReadableBody(log.body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      );
      _callLogs.add(vm);
      notifyListeners();
    } else {
      final CallLogVM vm = CallLogVM(
        type: NetworkLogType.response,
        title: log.method,
        body: getReadableBody(log.body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      );
      final CallLogVM request = _callLogs.firstWhere(
        (CallLogVM element) =>
            json.decode(element.body)['req_id'] ==
            json.decode(vm.body)['req_id'],
      );
      // ignore: unnecessary_null_comparison
      if (request != null) {
        request.pair = vm;
      } else {
        _callLogs.add(vm);
      }
      notifyListeners();
    }
  }

  /// List of network logs like request and response.
  List<CallLogVM> get logs => _searchController.text.isEmpty
      ? _callLogs.reversed.toList()
      : _callLogs
          .where((log) =>
              log.title.contains(_searchController.text.trim()) ||
              log.body.contains(_searchController.text.trim()))
          .toList();

  /// This will clear logs from the log list.
  void clearLogs() {
    _callLogs.clear();
    notifyListeners();
  }
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

  @override
  bool get hasError => pair != null && jsonDecode(pair!.body)['error'] != null;

  @override
  Color get getColor =>
      hasError ? Colors.redAccent[400] ?? Colors.red : super.getColor;
}
