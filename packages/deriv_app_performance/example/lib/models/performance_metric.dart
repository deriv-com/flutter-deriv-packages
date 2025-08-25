/// Import for the Color class
import 'package:flutter/material.dart' show Color, Colors;

/// A class representing a performance metric
class PerformanceMetric {
  /// The name of the metric
  final String name;
  
  /// The value of the metric
  final int value;
  
  /// The unit of measurement (e.g., 'ms', 'bytes', etc.)
  final String unit;
  
  /// The timestamp when the metric was recorded
  final DateTime timestamp;
  
  /// Optional category for grouping metrics
  final String? category;
  
  /// Optional description of the metric
  final String? description;

  /// Constructor
  PerformanceMetric({
    required this.name,
    required this.value,
    required this.unit,
    required this.timestamp,
    this.category,
    this.description,
  });

  /// Create a formatted display string for the metric value
  String get formattedValue {
    if (unit == 'ms' && value >= 1000) {
      return '${(value / 1000).toStringAsFixed(2)} s';
    }
    return '$value $unit';
  }

  /// Get a color based on the performance value
  /// This is a simple example - in a real app, you would have more sophisticated logic
  /// based on thresholds for different metric types
  Color getPerformanceColor() {
    if (unit == 'ms') {
      if (value < 100) return Colors.green;
      if (value < 500) return Colors.green.shade700;
      if (value < 1000) return Colors.orange;
      if (value < 3000) return Colors.deepOrange;
      return Colors.red;
    }
    
    // Default color for other units
    return Colors.blue;
  }
}
