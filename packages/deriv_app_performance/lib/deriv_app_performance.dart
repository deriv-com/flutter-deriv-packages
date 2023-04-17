import 'package:firebase_performance/firebase_performance.dart';

/// Class that collects and send app performance data  to `Firebase`.
class AppPerformance {
  /// Initializes AppPerformance instance.
  factory AppPerformance() => _instance;

  AppPerformance._internal();

  /// Create an empty map.
  final Map<String, Trace> _traceMap = <String, Trace>{};

  /// A public instance of the class [AppPerformance].
  static final AppPerformance _instance = AppPerformance._internal();

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
    final Trace trace = await _createTrace(traceName: traceName);
    _traceMap[traceName] = trace;
    await trace.start();
  }

  /// Stops tracing the App Performance.
  Future<void> stopTracing({required String traceName}) async {
    final Trace? retrievedTrace = _traceMap[traceName];

    return retrievedTrace?.stop();
  }
}
