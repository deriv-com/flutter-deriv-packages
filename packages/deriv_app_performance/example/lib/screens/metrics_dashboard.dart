import 'dart:async';
import 'package:flutter/material.dart';
import 'package:deriv_app_performance/deriv_app_performance.dart';
import 'package:deriv_app_performance_example/services/performance_service.dart';
import 'package:deriv_app_performance_example/widgets/metric_card.dart';
import 'package:deriv_app_performance_example/widgets/trace_timeline.dart';
import 'package:deriv_app_performance_example/models/performance_metric.dart';
import 'package:deriv_app_performance_example/models/trace_event.dart';

/// A dashboard that displays performance metrics in real-time
class MetricsDashboard extends StatefulWidget {
  /// Constructor
  const MetricsDashboard({super.key});

  @override
  State<MetricsDashboard> createState() => _MetricsDashboardState();
}

class _MetricsDashboardState extends State<MetricsDashboard> {
  final List<PerformanceMetric> _metrics = [];
  final List<TraceEvent> _traceEvents = [];

  @override
  void initState() {
    super.initState();
    _loadData();

    // Subscribe to metrics updates
    PerformanceService.instance.metricsStream.listen((updatedMetrics) {
      setState(() {
        _metrics.clear();
        _metrics.addAll(updatedMetrics);
      });
    });

    // Subscribe to trace events updates
    PerformanceService.instance.traceEventsStream.listen((updatedEvents) {
      setState(() {
        _traceEvents.clear();
        _traceEvents.addAll(updatedEvents);
      });
    });
  }

  void _loadData() {
    // Load metrics from the PerformanceService
    setState(() {
      _metrics.addAll(PerformanceService.instance.metrics);
      _traceEvents.addAll(PerformanceService.instance.traceEvents);
    });

    // If we don't have any metrics yet, add some sample data
    if (_metrics.isEmpty) {
      setState(() {
        _metrics.addAll([
          PerformanceMetric(
            name: BasePerformanceMetrics.appStartup,
            value: 1200,
            unit: 'ms',
            timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
          ),
          PerformanceMetric(
            name: BasePerformanceMetrics.pageNavigation,
            value: 350,
            unit: 'ms',
            timestamp: DateTime.now().subtract(const Duration(seconds: 45)),
          ),
        ]);

        _traceEvents.addAll([
          TraceEvent(
            name: BasePerformanceMetrics.appStartup,
            startTime:
                DateTime.now().subtract(const Duration(minutes: 1, seconds: 2)),
            endTime: DateTime.now().subtract(const Duration(minutes: 1)),
            attributes: {'success': 'true'},
            metrics: {'duration_ms': 1200},
          ),
          TraceEvent(
            name: BasePerformanceMetrics.pageNavigation,
            startTime: DateTime.now().subtract(const Duration(seconds: 46)),
            endTime: DateTime.now().subtract(const Duration(seconds: 45)),
            attributes: {'from_page': 'home', 'to_page': 'detail'},
            metrics: {'duration_ms': 350},
          ),
        ]);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Performance Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadData,
              tooltip: 'Refresh Data',
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics section
              _buildSectionHeader('Performance Metrics', Icons.speed),

              // Display metrics in a grid
              _metrics.isEmpty
                  ? _buildEmptyState('No metrics recorded yet')
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _metrics.length,
                      itemBuilder: (context, index) {
                        final metric = _metrics[index];
                        return MetricCard(metric: metric);
                      },
                    ),

              const SizedBox(height: 24),

              // Trace Timeline section
              _buildSectionHeader('Trace Timeline', Icons.timeline),

              // Display trace timeline
              _traceEvents.isEmpty
                  ? _buildEmptyState('No trace events recorded yet')
                  : TraceTimeline(events: _traceEvents),

              const SizedBox(height: 24),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _simulateTestEvent,
                    icon: const Icon(Icons.add),
                    label: const Text('Generate Test Event'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      PerformanceService.instance.clearMetrics();
                      setState(() {
                        _metrics.clear();
                        _traceEvents.clear();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All metrics cleared'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red.shade900,
                    ),
                    label: const Text('Clear All'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.info_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _simulateTestEvent() {
    // Start a custom trace
    final traceName = 'test_event_${DateTime.now().millisecondsSinceEpoch}';
    PerformanceService.instance.startCustomTrace(
      traceName,
      attributes: {'source': 'dashboard', 'type': 'manual'},
    );

    // Simulate some work
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Simulating Work'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Performing test operation...'),
          ],
        ),
      ),
    );

    // After a delay, stop the trace and add it to our local list
    Future.delayed(const Duration(seconds: 2), () {
      // Stop the trace
      PerformanceService.instance.stopCustomTrace(
        traceName,
        attributes: {'result': 'success'},
        metrics: {'duration_ms': 2000},
      );

      // Add to our local lists for display
      setState(() {
        final now = DateTime.now();

        // Add a new trace event
        final newEvent = TraceEvent(
          name: traceName,
          startTime: now.subtract(const Duration(seconds: 2)),
          endTime: now,
          attributes: {
            'source': 'dashboard',
            'type': 'manual',
            'result': 'success'
          },
          metrics: {'duration_ms': 2000},
        );
        _traceEvents.add(newEvent);

        // Add a corresponding metric
        _metrics.add(
          PerformanceMetric(
            name: traceName,
            value: 2000,
            unit: 'ms',
            timestamp: now,
          ),
        );
      });

      // Close the dialog
      Navigator.of(context).pop();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Test event generated and added to dashboard'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
}
