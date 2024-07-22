import 'dart:convert';

import 'package:deriv_logger/controllers/network_logs_controller.dart';
import 'package:deriv_logger/services/network_service.dart';
import 'package:flutter/material.dart';

/// Controller for handling subscription logs.
class SubscriptionLogController extends NetworkLogsController {
  /// Constructor for SubscriptionLogController.
  SubscriptionLogController({
    NetworkLogEmitter? subscriptionEmitter,
  }) : super(emitter: subscriptionEmitter);

  final List<SubscriptionLogVM> _logs = <SubscriptionLogVM>[];

  /// List of network logs like request and response.
  List<SubscriptionLogVM> get logs => _logs.reversed.toList();

  @override
  void incomingLog(NetworkLogPayload log) {
    if (isRequest(log)) {
      _logs.add(SubscriptionLogVM(
        type: NetworkLogType.request,
        title: log.method,
        body: getReadableBody(log.body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      ));
    } else {
      final body = log.body;

      if (body is Map) {
        body.remove('echo_req');
      }

      final NetworkLogVM vm = NetworkLogVM(
        title: log.method,
        type: NetworkLogType.response,
        body: getReadableBody(body),
        time: DateTime.fromMillisecondsSinceEpoch(log.timeStamp),
      );
      final SubscriptionLogVM existingLog = _logs.firstWhere((log) =>
          jsonDecode(log.body)['req_id'] == jsonDecode(vm.body)['req_id']);
      existingLog.payloads = [...existingLog.payloads, vm];
    }
    notifyListeners();
  }
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

  @override
  Color get getColor =>
      hasError ? Colors.redAccent[400] ?? Colors.red : super.getColor;
}
