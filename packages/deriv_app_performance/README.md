# App Performance

A Flutter plugin for tracking app performance metrics using various performance monitoring providers.

## Features

- Track custom traces and metrics
- Monitor page navigation performance
- Track network requests and data loading operations
- Support for multiple performance monitoring providers
- Extensible architecture for custom provider implementations

## Getting Started

### Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  deriv_app_performance: ^1.0.0
```

### Basic Usage

Initialize the performance monitoring system:

```dart
import 'package:deriv_app_performance/deriv_app_performance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize with Firebase Performance Monitoring (default)
  await AppPerformance.instance.init();
  
  runApp(MyApp());
}
```

### Tracking Custom Traces

```dart
// Start a trace
AppPerformance.instance.startTracing(
  traceName: 'my_custom_trace',
  attributes: {'key': 'value'},
);

// Perform some operations
await doSomething();

// Stop the trace
AppPerformance.instance.stopTracing(
  traceName: 'my_custom_trace',
  attributes: {'result': 'success'},
  metrics: {'duration_ms': 1500},
);
```

### Tracking Operations

```dart
// Track an operation from start to finish
final result = await AppPerformance.instance.trackOperation<String>(
  traceName: 'data_loading',
  operation: () async {
    // Your async operation here
    return await fetchData();
  },
  attributes: {'data_type': 'user_profile'},
);
```

### Tracking Page Navigation

```dart
// Start tracking page load
AppPerformance.instance.startPageLoadTrace('home_screen', fromPage: 'login_screen');

// Stop tracking page load
AppPerformance.instance.stopPageLoadTrace('home_screen');
```

## Custom Provider Implementation

The plugin supports custom performance monitoring providers, allowing you to integrate with any third-party performance monitoring service. This section provides a comprehensive guide on implementing and using custom providers.

> **Important Note**: As of the latest version, you must specify at least one provider when initializing the package with `enableFirebase: false`. If no providers are specified and Firebase is disabled, an assertion error will be thrown.

### 1. Create a Custom Provider Class

Implement the `PerformanceProvider` interface:

```dart
import 'package:deriv_app_performance/deriv_app_performance.dart';

class MyCustomProvider implements PerformanceProvider {
  const MyCustomProvider({
    required this.apiKey,
    required this.applicationId,
  });
  
  final String apiKey;
  final String applicationId;
  
  @override
  String get providerId => 'my_custom_provider';
  
  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) {
    return MyCustomDataSource(
      apiKey: apiKey,
      applicationId: applicationId,
      options: options,
    );
  }
}
```

The `providerId` is a unique identifier for your provider and is used to identify the provider in the options map. The `createDataSource` method creates an instance of your custom data source.

### 2. Create a Custom Data Source

Implement the `PerformanceDataSource` interface:

```dart
class MyCustomDataSource implements PerformanceDataSource {
  MyCustomDataSource({
    required this.apiKey,
    required this.applicationId,
    this.options,
  });
  
  final String apiKey;
  final String applicationId;
  final Map<String, dynamic>? options;
  
  // Track whether performance collection is enabled
  bool _collectionEnabled = true;
  
  // Track active traces
  final Map<String, _CustomTrace> _activeTraces = {};
  
  @override
  Future<void> initialize({bool enabled = true, Map<String, dynamic>? options}) async {
    // Initialize your custom monitoring SDK
    _collectionEnabled = enabled;
    
    // Example of initializing a third-party SDK:
    // await ThirdPartySDK.instance.initialize(
    //   apiKey: apiKey,
    //   applicationId: applicationId,
    //   options: options,
    // );
    // await ThirdPartySDK.instance.setEnabled(enabled);
    
    // Process any additional options
    if (options != null) {
      // Apply options to your SDK
    }
  }
  
  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    _collectionEnabled = enabled;
    
    // Example of enabling/disabling a third-party SDK:
    // await ThirdPartySDK.instance.setEnabled(enabled);
  }
  
  @override
  Future<bool> isCollectionEnabled() async {
    // Return the current collection status
    return _collectionEnabled;
    
    // Or get it from your SDK:
    // return await ThirdPartySDK.instance.isEnabled();
  }
  
  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (!_collectionEnabled) {
      return;
    }
    
    // Start a trace in your custom monitoring SDK
    // Example:
    // final trace = await ThirdPartySDK.instance.startTrace(traceName);
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     trace.setAttribute(entry.key, entry.value);
    //   }
    // }
    
    // Store the trace for tracking
    _activeTraces[traceName] = _CustomTrace(
      name: traceName,
      startTime: DateTime.now(),
      attributes: attributes ?? {},
    );
  }
  
  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    if (!_collectionEnabled) {
      return;
    }
    
    final trace = _activeTraces[traceName];
    if (trace == null) {
      // Handle the case where the trace doesn't exist
      return;
    }
    
    // Stop the trace in your custom monitoring SDK
    // Example:
    // final sdkTrace = ThirdPartySDK.instance.getTrace(traceName);
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     sdkTrace.setAttribute(entry.key, entry.value);
    //   }
    // }
    // if (metrics != null) {
    //   for (final entry in metrics.entries) {
    //     sdkTrace.setMetric(entry.key, entry.value);
    //   }
    // }
    // await sdkTrace.stop();
    
    // Remove the trace from active traces
    _activeTraces.remove(traceName);
  }
  
  @override
  bool isTraceActive(String traceName) {
    // Check if the trace is active
    return _activeTraces.containsKey(traceName);
  }
}

// Helper class to track active traces
class _CustomTrace {
  _CustomTrace({
    required this.name,
    required this.startTime,
    required this.attributes,
  });
  
  final String name;
  final DateTime startTime;
  final Map<String, String> attributes;
}
```

This implementation provides a template for integrating with any third-party performance monitoring SDK. The key aspects to note:

- **Trace Tracking**: The `_activeTraces` map keeps track of active traces, which is essential for implementing `isTraceActive` and ensuring proper trace management.
- **Collection Status**: The `_collectionEnabled` flag tracks whether performance collection is enabled.
- **SDK Integration**: The commented code shows how you might integrate with a third-party SDK.

### 3. Use Your Custom Provider

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize with your custom provider
  await AppPerformance.instance.init(
    providers: [
      MyCustomProvider(
        apiKey: 'your-api-key',
        applicationId: 'your-app-id',
      ),
    ],
    enableFirebase: false, // Disable Firebase if not needed
    providerOptions: {
      'my_custom_provider': {
        'additional_option': 'value',
        'debug_mode': true,
      },
    },
  );
  
  runApp(MyApp());
}
```

The `providerOptions` map allows you to pass provider-specific options. The keys in this map should match the `providerId` of your providers.

> **Note**: If you don't specify any providers and set `enableFirebase: false`, the package will throw an assertion error. You must specify at least one provider when disabling Firebase.

### 4. Creating a Custom Firebase Provider

If you want to use Firebase Performance Monitoring with your own implementation, you can create a custom provider with the ID 'firebase':

```dart
import 'package:deriv_app_performance/src/data/providers/firebase_performance_provider.dart';

class CustomFirebaseProvider implements PerformanceProvider {
  /// Static constant for the Firebase provider ID
  static const String PROVIDER_ID = FirebasePerformanceProvider.PROVIDER_ID;
  
  const CustomFirebaseProvider();
  
  @override
  String get providerId => PROVIDER_ID;
  
  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) {
    return CustomFirebaseDataSource(options: options);
  }
}

class CustomFirebaseDataSource implements PerformanceDataSource {
  CustomFirebaseDataSource({this.options});
  
  final Map<String, dynamic>? options;
  
  // Implement all required methods...
  
  @override
  Future<void> initialize({bool enabled = true, Map<String, dynamic>? options}) async {
    // Initialize Firebase Performance
    await FirebasePerformance.instance.setPerformanceCollectionEnabled(enabled);
    
    if (options != null || this.options != null) {
      // Apply options to Firebase Performance if supported
    }
  }
  
  // Implement other methods...
}
```

When you initialize the package with `enableFirebase: true`, it will check if a provider with ID 'firebase' already exists in the list. If it does, it will use your custom implementation instead of the built-in one.

### 5. Using Multiple Providers

You can use multiple providers simultaneously to send performance data to different monitoring services:

```dart
await AppPerformance.instance.init(
  providers: [
    MyCustomProvider(
      apiKey: 'your-api-key',
      applicationId: 'your-app-id',
    ),
    AnotherCustomProvider(
      clientId: 'your-client-id',
    ),
    CustomFirebaseProvider(), // Your custom Firebase implementation
  ],
  enableFirebase: false, // Don't add the built-in Firebase provider
  providerOptions: {
    'my_custom_provider': {
      'option1': 'value1',
    },
    'another_provider': {
      'option2': 'value2',
    },
    'firebase': {
      'debug': true,
    },
  },
  errorHandler: (operation, error, stackTrace) {
    // Custom error handling for provider operations
    print('Error in $operation: $error');
    // Log to your error reporting service
  },
);
```

When multiple providers are used, the package creates a `CompositePerformanceDataSource` that delegates operations to all providers. If an operation fails on one provider, it will still be attempted on the others.

The optional `errorHandler` callback allows you to handle errors that occur in any provider during operations like starting or stopping traces.

### 6. Provider Selection in UI

In a real application, you might want to allow users to select which providers to use. Here's an example from the example app:

```dart
// Provider selection UI
CheckboxListTile(
  title: const Text('Firebase Performance'),
  value: _selectedProviders.any((p) => p.providerId == 'firebase'),
  onChanged: (value) => _toggleProvider(
    const CustomFirebaseProvider(), 
    value ?? false
  ),
),

CheckboxListTile(
  title: const Text('My Custom Provider'),
  value: _selectedProviders.any((p) => p.providerId == 'my_custom_provider'),
  onChanged: (value) => _toggleProvider(
    MyCustomProvider(
      apiKey: 'your-api-key',
      applicationId: 'your-app-id',
    ), 
    value ?? false
  ),
),

// Update providers when selection changes
Future<void> _updateProviders() async {
  final hasFirebase = _selectedProviders.any((p) => p.providerId == 'firebase');
  
  await AppPerformance.instance.init(
    providers: _selectedProviders,
    enableFirebase: hasFirebase,
  );
}
```

Note that we're checking for providers by their `providerId` rather than their type, which is more flexible and allows for custom implementations of the same provider type.

## Best Practices for Custom Providers

### Error Handling

Implement robust error handling in your custom data source to prevent failures from affecting the rest of your application:

```dart
@override
void startTrace(String traceName, {Map<String, String>? attributes}) {
  if (!_collectionEnabled) {
    return;
  }
  
  try {
    // Start a trace in your custom monitoring SDK
    _activeTraces[traceName] = _CustomTrace(
      name: traceName,
      startTime: DateTime.now(),
      attributes: attributes ?? {},
    );
  } catch (e, stackTrace) {
    // Log the error but don't let it propagate
    print('Error starting trace $traceName: $e');
    // Optionally log to your error reporting service
  }
}
```

### Logging

Add appropriate logging to help with debugging:

```dart
@override
Future<void> initialize({bool enabled = true, Map<String, dynamic>? options}) async {
  print('Initializing custom provider with options: $options');
  
  try {
    _collectionEnabled = enabled;
    // Initialize your SDK
  } catch (e, stackTrace) {
    print('Error initializing custom provider: $e');
    // Handle initialization error
  }
}
```

### Testing

Create mock implementations for testing:

```dart
class MockCustomDataSource implements PerformanceDataSource {
  bool _enabled = true;
  final Map<String, bool> _activeTraces = {};
  
  @override
  Future<void> initialize({bool enabled = true, Map<String, dynamic>? options}) async {
    _enabled = enabled;
  }
  
  @override
  Future<bool> isCollectionEnabled() async => _enabled;
  
  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    _enabled = enabled;
  }
  
  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (_enabled) {
      _activeTraces[traceName] = true;
    }
  }
  
  @override
  void stopTrace(String traceName, {Map<String, String>? attributes, Map<String, int>? metrics}) {
    _activeTraces.remove(traceName);
  }
  
  @override
  bool isTraceActive(String traceName) => _activeTraces[traceName] ?? false;
}
```

### Performance Considerations

Be mindful of the performance impact of your custom provider:

- Avoid blocking operations in trace methods
- Consider using isolates for CPU-intensive operations
- Batch network requests when possible
- Implement rate limiting if necessary

## Under the Hood

### Provider Factory

The `PerformanceProviderFactory` is responsible for creating the appropriate data source based on the provided providers:

```dart
// This is handled internally by the package
PerformanceDataSource dataSource = PerformanceProviderFactory.createDataSource(
  providers,
  providerOptions: providerOptions,
  errorHandler: errorHandler,
  enableFirebase: enableFirebase,
);
```

If multiple providers are specified, it creates a `CompositePerformanceDataSource` that delegates to all providers. If only one provider is specified, it creates the data source directly from that provider for better performance.

### Composite Data Source

The `CompositePerformanceDataSource` delegates operations to all underlying data sources and handles errors gracefully:

```dart
// This is handled internally by the package
class CompositePerformanceDataSource implements PerformanceDataSource {
  CompositePerformanceDataSource(
    this._dataSources, {
    this.errorHandler,
  });

  final List<PerformanceDataSource> _dataSources;
  final ErrorHandler? errorHandler;
  
  // Methods delegate to all data sources with error handling
}
```

This allows the package to send performance data to multiple monitoring services simultaneously, with errors in one provider not affecting the others.

## Example App

Check out the example app for a complete demonstration of the plugin's features, including:

- Using different performance monitoring providers
- Tracking custom traces
- Monitoring page navigation
- Tracking data loading operations
- Implementing custom providers

The example app includes a sample custom provider implementation in `example/lib/custom_providers/sample_custom_provider.dart` that you can use as a reference for your own implementation.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
