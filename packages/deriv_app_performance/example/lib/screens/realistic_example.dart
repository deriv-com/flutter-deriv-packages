import 'dart:math';

import 'package:flutter/material.dart';

import 'package:deriv_app_performance_example/services/performance_service.dart';

/// A simple example that demonstrates tracking performance of image loading
class RealisticExampleScreen extends StatefulWidget {
  /// Constructor
  const RealisticExampleScreen({super.key});

  @override
  State<RealisticExampleScreen> createState() => _RealisticExampleScreenState();
}

class _RealisticExampleScreenState extends State<RealisticExampleScreen> {
  final List<_ImageItem> _images = [];
  bool _isLoading = false;
  String _networkSpeed = 'Fast';
  int _loadedCount = 0;

  @override
  void initState() {
    super.initState();
    // Create 6 sample images
    for (int i = 0; i < 6; i++) {
      _images.add(
        _ImageItem(
          id: i,
          url: 'https://picsum.photos/400/300?random=$i',
          isLoaded: false,
          loadTimeMs: 0,
        ),
      );
    }
  }

  Future<void> _loadImages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _loadedCount = 0;

      // Reset all images
      for (final image in _images) {
        image.isLoaded = false;
        image.loadTimeMs = 0;
      }
    });

    // Start tracking the overall image loading process
    PerformanceService.instance.startCustomTrace(
      'image_gallery_loading',
      attributes: {
        'image_count': _images.length.toString(),
        'network_speed': _networkSpeed,
      },
    );

    // Load each image
    for (final image in _images) {
      await _loadImage(image);

      setState(() {
        _loadedCount++;
      });
    }

    // Stop tracking the overall process
    PerformanceService.instance.stopCustomTrace(
      'image_gallery_loading',
      attributes: {'success': 'true'},
      metrics: {'average_load_time_ms': _calculateAverageLoadTime()},
    );

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadImage(_ImageItem image) async {
    // Get simulated network delay
    final delay = _getNetworkDelay();

    // Track individual image load
    final traceName = 'image_${image.id}_load';
    PerformanceService.instance.startCustomTrace(traceName);

    // Simulate network delay
    await Future.delayed(Duration(milliseconds: delay));

    // Stop tracking
    PerformanceService.instance.stopCustomTrace(
      traceName,
      metrics: {'load_time_ms': delay},
    );

    // Update UI
    setState(() {
      image.isLoaded = true;
      image.loadTimeMs = delay;
    });
  }

  int _getNetworkDelay() {
    final random = Random();

    // Simulate network speed
    switch (_networkSpeed) {
      case 'Fast':
        return 200 + random.nextInt(300); // 200-500ms
      case 'Medium':
        return 500 + random.nextInt(500); // 500-1000ms
      case 'Slow':
        return 1000 + random.nextInt(1000); // 1000-2000ms
      default:
        return 300; // Default
    }
  }

  int _calculateAverageLoadTime() {
    if (_images.isEmpty) return 0;

    int total = 0;
    for (final image in _images) {
      if (image.isLoaded) {
        total += image.loadTimeMs;
      }
    }

    return _loadedCount > 0 ? total ~/ _loadedCount : 0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Image Loading Example'),
        ),
        body: Column(
          children: [
            // Controls
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Performance Tracking Demo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Network speed selector
                      Row(
                        children: [
                          const Text('Network Speed:'),
                          const SizedBox(width: 16),
                          DropdownButton<String>(
                            value: _networkSpeed,
                            onChanged: _isLoading
                                ? null
                                : (value) {
                                    if (value != null) {
                                      setState(() {
                                        _networkSpeed = value;
                                      });
                                    }
                                  },
                            items: const [
                              DropdownMenuItem(
                                value: 'Fast',
                                child: Text('Fast (200-500ms)'),
                              ),
                              DropdownMenuItem(
                                value: 'Medium',
                                child: Text('Medium (500-1000ms)'),
                              ),
                              DropdownMenuItem(
                                value: 'Slow',
                                child: Text('Slow (1-2s)'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Load button
                      Center(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _loadImages,
                          child:
                              Text(_isLoading ? 'Loading...' : 'Load Images'),
                        ),
                      ),

                      // Progress indicator
                      if (_isLoading) ...[
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: _images.isNotEmpty
                              ? _loadedCount / _images.length
                              : 0,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Image grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  final image = _images[index];
                  return _buildImageCard(image);
                },
              ),
            ),
          ],
        ),
      );

  Widget _buildImageCard(_ImageItem image) => Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image or placeholder
            image.isLoaded
                ? Image.network(
                    image.url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.error_outline, color: Colors.red),
                    ),
                  )
                : Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.grey),
                    ),
                  ),

            // Performance indicator
            if (image.isLoaded)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '${image.loadTimeMs}ms',
                    style: TextStyle(
                      color: _getColorForLoadTime(image.loadTimeMs),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );

  Color _getColorForLoadTime(int loadTimeMs) {
    if (loadTimeMs < 500) return Colors.green;
    if (loadTimeMs < 1000) return Colors.yellow;
    return Colors.red;
  }
}

/// A class representing an image item
class _ImageItem {
  /// The image ID
  final int id;

  /// The image URL
  final String url;

  /// Whether the image is loaded
  bool isLoaded;

  /// How long it took to load the image in milliseconds
  int loadTimeMs;

  /// Constructor
  _ImageItem({
    required this.id,
    required this.url,
    this.isLoaded = false,
    this.loadTimeMs = 0,
  });
}
