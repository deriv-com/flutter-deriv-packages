import 'package:flutter/material.dart';
import '../models/performance_metric.dart';

/// A card widget that displays a performance metric
class MetricCard extends StatelessWidget {
  /// The performance metric to display
  final PerformanceMetric metric;

  /// Constructor
  const MetricCard({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {
    final color = metric.getPerformanceColor();
    final formattedTime = '${metric.timestamp.hour}:${metric.timestamp.minute.toString().padLeft(2, '0')}:${metric.timestamp.second.toString().padLeft(2, '0')}';
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withOpacity(0.5), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metric name
            Text(
              _formatMetricName(metric.name),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            
            // Metric value
            Row(
              children: [
                Icon(
                  _getIconForMetric(metric.name),
                  color: color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  metric.formattedValue,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
            // Timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.access_time,
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Format the metric name for display
  String _formatMetricName(String name) {
    // Convert snake_case to Title Case
    final words = name.split('_');
    final formattedWords = words.map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1);
    });
    return formattedWords.join(' ');
  }
  
  /// Get an appropriate icon for the metric type
  IconData _getIconForMetric(String name) {
    if (name.contains('startup')) return Icons.play_arrow;
    if (name.contains('page') || name.contains('navigation')) return Icons.pageview;
    if (name.contains('api') || name.contains('network')) return Icons.cloud;
    if (name.contains('data') || name.contains('loading')) return Icons.storage;
    if (name.contains('user') || name.contains('interaction')) return Icons.touch_app;
    if (name.contains('memory')) return Icons.memory;
    if (name.contains('battery')) return Icons.battery_full;
    if (name.contains('login') || name.contains('auth')) return Icons.lock;
    if (name.contains('test')) return Icons.science;
    
    // Default icon
    return Icons.speed;
  }
}
