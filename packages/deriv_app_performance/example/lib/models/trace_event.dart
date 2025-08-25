/// Import for the Color class
import 'package:flutter/material.dart' show Color, Colors;

/// A class representing a performance trace event
class TraceEvent {
  /// The name of the trace
  final String name;
  
  /// When the trace started
  final DateTime startTime;
  
  /// When the trace ended
  final DateTime endTime;
  
  /// Additional attributes associated with the trace
  final Map<String, String> attributes;
  
  /// Metrics collected during the trace
  final Map<String, int> metrics;

  /// Constructor
  TraceEvent({
    required this.name,
    required this.startTime,
    required this.endTime,
    this.attributes = const {},
    this.metrics = const {},
  });

  /// Calculate the duration of the trace in milliseconds
  int get durationMs => endTime.difference(startTime).inMilliseconds;
  
  /// Get a formatted duration string
  String get formattedDuration {
    final ms = durationMs;
    if (ms >= 1000) {
      return '${(ms / 1000).toStringAsFixed(2)} s';
    }
    return '$ms ms';
  }
  
  /// Get a short name for display purposes
  String get shortName {
    // Extract just the base name without any prefixes
    final parts = name.split('.');
    return parts.last;
  }
  
  /// Get a color based on the duration
  /// This is a simple example - in a real app, you would have more sophisticated logic
  Color getDurationColor() {
    final ms = durationMs;
    if (ms < 100) return Colors.green;
    if (ms < 500) return Colors.green.shade700;
    if (ms < 1000) return Colors.orange;
    if (ms < 3000) return Colors.deepOrange;
    return Colors.red;
  }
}
