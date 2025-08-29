/// Represents a performance metric to be tracked
class PerformanceMetric {
  /// Creates a new performance metric
  const PerformanceMetric({
    required this.name,
    required this.category,
    required this.description,
  });

  /// The name of the metric
  final String name;

  /// The category of the metric
  final String category;

  /// Description of what this metric tracks
  final String description;
}
