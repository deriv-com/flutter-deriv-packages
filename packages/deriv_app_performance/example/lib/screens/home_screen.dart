import 'package:deriv_app_performance_example/custom_providers/firebase_provider.dart';
import 'package:deriv_app_performance_example/custom_providers/sample_custom_provider.dart';
import 'package:deriv_app_performance_example/services/performance_service.dart';
import 'package:flutter/material.dart';
import 'package:deriv_app_performance/deriv_app_performance.dart';
import 'detail_page.dart';
import 'metrics_dashboard.dart';
import 'realistic_example.dart';

/// Home screen for the deriv_app_performance example app
class HomeScreen extends StatefulWidget {
  /// Constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isCollectionEnabled = true;
  final List<PerformanceProvider> _selectedProviders = [
    const CustomFirebaseProvider()
  ];
  bool _isTraceActive = false;
  String _activeTraceName = '';
  bool _isLoading = false;
  String _operationResult = '';

  @override
  void initState() {
    super.initState();
    _checkCollectionStatus();
  }

  Future<void> _checkCollectionStatus() async {
    final isEnabled = await PerformanceService.instance.isCollectionEnabled();
    if (mounted) {
      setState(() {
        _isCollectionEnabled = isEnabled;
      });
    }
  }

  Future<void> _toggleCollectionEnabled() async {
    final newStatus = !_isCollectionEnabled;
    await PerformanceService.instance.setCollectionEnabled(newStatus);
    await _checkCollectionStatus();
  }

  void _toggleProvider(PerformanceProvider provider, bool selected) {
    setState(() {
      if (selected) {
        if (!_selectedProviders
            .any((p) => p.providerId == provider.providerId)) {
          _selectedProviders.add(provider);
        }
      } else {
        _selectedProviders
            .removeWhere((p) => p.providerId == provider.providerId);
      }
    });
    _updateProviders();
  }

  Future<void> _updateProviders() async {
    // Check if Firebase is among the selected providers
    final hasFirebase =
        _selectedProviders.any((p) => p.providerId == 'firebase');

    // Ensure we have at least one provider
    if (_selectedProviders.isEmpty) {
      _selectedProviders.add(const MockPerformanceProvider());
    }

    await PerformanceService.instance.init(
      providers: _selectedProviders,
      enableFirebase: hasFirebase,
    );

    await _checkCollectionStatus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Updated providers:'
            ' ${_selectedProviders.map((p) => p.providerId).join(", ")}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _startTrace() {
    if (_isTraceActive) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A trace is already active. Stop it first.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isTraceActive = true;
      _activeTraceName = CustomTraces.userAuthentication;
    });

    PerformanceService.instance.startCustomTrace(
      CustomTraces.userAuthentication,
      attributes: {'method': 'email_password', 'screen': 'login_screen'},
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Trace started: $_activeTraceName'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _stopTrace() {
    if (!_isTraceActive) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No active trace to stop'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isTraceActive = false;
    });

    PerformanceService.instance.stopCustomTrace(
      _activeTraceName,
      attributes: {'success': 'true'},
      metrics: {'auth_time_ms': 1500},
    );

    setState(() {
      _activeTraceName = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trace stopped'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _performOperation() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _operationResult = '';
    });

    try {
      // Use the trackDataLoading method to track the operation
      final result = await PerformanceService.instance.trackDataLoading<String>(
        dataType: 'user_profile',
        loadOperation: () async {
          // Simulate a network request or other async operation
          await Future.delayed(const Duration(seconds: 2));
          return 'User profile loaded successfully';
        },
        additionalAttributes: {'user_id': '12345', 'source': 'home_screen'},
      );

      setState(() {
        _operationResult = result;
      });
    } catch (e) {
      setState(() {
        _operationResult = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'detail_page'),
        builder: (context) => const DetailPage(),
      ),
    );
  }

  void _navigateToMetricsDashboard() {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'metrics_dashboard'),
        builder: (context) => const MetricsDashboard(),
      ),
    );
  }

  void _navigateToRealisticExample() {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'realistic_example'),
        builder: (context) => const RealisticExampleScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('App Performance Example'),
          actions: [
            // Toggle for enabling/disabling performance collection
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enable Collection'),
                const SizedBox(width: 8),
                Switch(
                  value: _isCollectionEnabled,
                  onChanged: (_) => _toggleCollectionEnabled(),
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Provider selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Provider Selection',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select a performance monitoring provider:',
                    ),
                    const SizedBox(height: 16),

                    // Firebase provider option
                    CheckboxListTile(
                      title: const Text('Firebase Performance'),
                      value: _selectedProviders
                          .any((p) => p.providerId == 'firebase'),
                      onChanged: (value) => _toggleProvider(
                          const CustomFirebaseProvider(), value ?? false),
                    ),

                    // Mock provider option
                    CheckboxListTile(
                      title: const Text('Mock Provider (Development)'),
                      value:
                          _selectedProviders.any((p) => p.providerId == 'mock'),
                      onChanged: (value) => _toggleProvider(
                          const MockPerformanceProvider(), value ?? false),
                    ),

                    // Sample custom provider option (custom provider example)
                    CheckboxListTile(
                      title: const Text('Sample Custom Provider (Example)'),
                      value: _selectedProviders
                          .any((p) => p.providerId == 'sample_custom'),
                      onChanged: (value) => _toggleProvider(
                          const SampleCustomProvider(
                            apiKey: 'your-api-key',
                            applicationId: 'your-app-id',
                          ),
                          value ?? false),
                    ),

                    // Display active providers
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.blue.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Active Providers:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(_selectedProviders.isEmpty
                              ? 'None'
                              : _selectedProviders
                                  .map((p) => p.providerId)
                                  .join(", ")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Custom trace demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Custom Trace Demo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Demonstrates how to create and use custom traces specific to your app.',
                    ),
                    const SizedBox(height: 16),

                    // Current trace status
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _isTraceActive
                            ? Colors.green.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _isTraceActive ? Icons.timer : Icons.timer_off,
                            color: _isTraceActive ? Colors.green : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _isTraceActive
                                  ? 'Custom trace active: $_activeTraceName'
                                  : 'No active custom trace',
                              style: TextStyle(
                                color:
                                    _isTraceActive ? Colors.green : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Start/Stop buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _isTraceActive ? null : _startTrace,
                          child: const Text('Start Auth Trace'),
                        ),
                        ElevatedButton(
                          onPressed: _isTraceActive ? _stopTrace : null,
                          child: const Text('Stop Trace'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Data loading operation demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Loading Operation Demo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Demonstrates how to track data loading operations with custom attributes.',
                    ),
                    const SizedBox(height: 16),

                    // Operation result
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Operation Result:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          if (_isLoading)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          else if (_operationResult.isEmpty)
                            const Text('No operation performed yet')
                          else
                            Text(_operationResult),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Perform operation button
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _performOperation,
                        child: const Text('Load User Profile'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Page navigation demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Page Navigation Demo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Demonstrates how to track page navigation performance.',
                    ),
                    const SizedBox(height: 16),

                    // Navigation buttons
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _navigateToDetailPage,
                              child: const Text('Navigate to Detail Page'),
                            ),
                            ElevatedButton(
                              onPressed: _navigateToMetricsDashboard,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade700,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('View Metrics Dashboard'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: _navigateToRealisticExample,
                          icon: const Icon(Icons.image),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                          ),
                          label: const Text('Realistic Example: Image Gallery'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
