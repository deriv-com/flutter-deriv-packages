import 'package:flutter/material.dart';
import '../models/trace_event.dart';

/// A widget that displays a timeline of trace events
class TraceTimeline extends StatelessWidget {
  /// The list of trace events to display
  final List<TraceEvent> events;

  /// Constructor
  const TraceTimeline({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'No trace events recorded yet',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      );
    }

    // Sort events by start time (most recent first)
    final sortedEvents = List<TraceEvent>.from(events)
      ..sort((a, b) => b.startTime.compareTo(a.startTime));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final event in sortedEvents) _buildTraceEventItem(event),
          ],
        ),
      ),
    );
  }

  Widget _buildTraceEventItem(TraceEvent event) {
    final color = event.getDurationColor();
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trace name and duration
          Row(
            children: [
              Icon(
                _getIconForTrace(event.name),
                color: color,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _formatTraceName(event.name),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withOpacity(0.5)),
                ),
                child: Text(
                  event.formattedDuration,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 4),
          
          // Timeline
          Row(
            children: [
              const SizedBox(width: 8),
              Container(
                width: 2,
                height: 24,
                color: Colors.grey.shade300,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start: ${_formatTime(event.startTime)}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'End: ${_formatTime(event.endTime)}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Attributes (if any)
          if (event.attributes.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Container(
                  width: 2,
                  height: 24,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (final entry in event.attributes.entries)
                        Chip(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          label: Text(
                            '${entry.key}: ${entry.value}',
                            style: const TextStyle(fontSize: 10),
                          ),
                          backgroundColor: Colors.grey.shade100,
                          padding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          
          // End marker
          Row(
            children: [
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Format the trace name for display
  String _formatTraceName(String name) {
    // Convert snake_case to Title Case
    final words = name.split('_');
    final formattedWords = words.map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1);
    });
    return formattedWords.join(' ');
  }
  
  /// Get an appropriate icon for the trace type
  IconData _getIconForTrace(String name) {
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
    return Icons.timeline;
  }
  
  /// Format time without using intl package
  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}.${(time.millisecond ~/ 10).toString().padLeft(2, '0')}';
  }
}
