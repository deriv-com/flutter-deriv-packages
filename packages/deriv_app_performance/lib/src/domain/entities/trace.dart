/// Represents a performance trace
class Trace {
  /// Creates a new trace
  const Trace({
    required this.name,
    this.attributes,
    this.metrics,
  });

  /// The name of the trace
  final String name;

  /// Attributes associated with the trace
  final Map<String, String>? attributes;

  /// Metrics associated with the trace
  final Map<String, int>? metrics;
}
