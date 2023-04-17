import 'dart:developer';

import 'package:firebase_performance/firebase_performance.dart';

/// Class that collects and send app performance data  to `Firebase`.
class AppPerformance {
  /// Initializes AppPerformance instance.
  factory AppPerformance() => _instance ??= AppPerformance._internal();

  AppPerformance._internal();

  /// A public instance of the class [AppPerformance].
  static AppPerformance? _instance;

  /// Create an empty map.
  final Map<String, Trace> _traceMap = <String, Trace>{};

  late FirebasePerformance _firebasePerformance;

  /// Initializes the `AppPerformance`.
  Future<void> init() async {
    _firebasePerformance = FirebasePerformance.instance;
  }

  Future<Trace> _createTrace({required String traceName}) async =>
      _firebasePerformance.newTrace(traceName);

  /// Disables the `AppPerformance`.
  Future<void> disable() async {
    await _firebasePerformance.setPerformanceCollectionEnabled(false);
  }

  /// Starts tracing the App Performance.
  Future<void> startTracing({required String traceName}) async {
    if (_traceMap.containsKey(traceName)) {
      await stopTracing(traceName: traceName);
    }

    try {
      final Trace trace = await _createTrace(traceName: traceName);
      _traceMap[traceName] = trace;
      await trace.start();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Stops tracing the App Performance.
  Future<void> stopTracing({required String traceName}) async {
    try {
      final Trace? retrievedTrace = _traceMap[traceName];
      retrievedTrace?.stop();
    } catch (e) {
      log(e.toString());
    }
  }
}
