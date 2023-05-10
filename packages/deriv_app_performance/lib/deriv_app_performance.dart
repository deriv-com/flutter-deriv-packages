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
  void init() => _firebasePerformance = FirebasePerformance.instance;

  Trace _createTrace({required String traceName}) =>
      _firebasePerformance.newTrace(traceName);

  /// Disables the `AppPerformance`.
  void disable() => _firebasePerformance.setPerformanceCollectionEnabled(false);

  /// Starts tracing the App Performance.
  void startTracing({required String traceName}) {
    if (_traceMap.containsKey(traceName)) {
      stopTracing(traceName: traceName);
    }

    try {
      final Trace trace = _createTrace(traceName: traceName);
      _traceMap[traceName] = trace;
      trace.start();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Stops tracing the App Performance.
  void stopTracing({required String traceName}) {
    try {
      final Trace? retrievedTrace = _traceMap[traceName];
      retrievedTrace?.stop();
    } catch (e) {
      log(e.toString());
    }
  }
}
