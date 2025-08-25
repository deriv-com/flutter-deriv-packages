# App Performance Example

This is an example app demonstrating how to use the `deriv_app_performance` package for monitoring performance in a Flutter application. The app has been designed to be immediately useful without requiring Firebase setup, while still showing how to integrate with Firebase Performance Monitoring if desired.

## Features

- **Real-time Performance Dashboard**: Visualize performance metrics directly in the app
- **Mock Provider by Default**: Run the example without Firebase setup
- **Multiple Provider Support**: Switch between Firebase and Mock providers
- **Comprehensive Demos**:
  - Custom trace creation and monitoring
  - Page navigation tracking
  - Data loading operations with performance tracking
  - Visual performance indicators

## Getting Started

1. Ensure you have Flutter installed and set up
2. Run `flutter pub get` in this directory
3. Run the app with `flutter run`

That's it! The example app uses the Mock provider by default, so you can see how the performance tracking works without any additional setup.

## Using the Example App

1. **Home Screen**: The main screen shows different performance tracking demos
   - Toggle performance collection on/off with the switch in the app bar
   - Select between Firebase and Mock providers
   - Start and stop custom traces
   - Perform tracked data loading operations
   - Navigate between pages with automatic performance tracking

2. **Metrics Dashboard**: View real-time performance metrics
   - See metrics displayed as cards with color-coded performance indicators
   - View a timeline of trace events
   - Generate test events to see how metrics are collected
   - Clear all metrics to start fresh

## Firebase Setup (Optional)

The example app works without Firebase, but if you want to use Firebase Performance Monitoring:

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/)
2. Register your app with Firebase
3. Download and add the configuration files:
   - For Android: `google-services.json` to the `android/app` directory
   - For iOS: `GoogleService-Info.plist` to the `ios/Runner` directory
4. In the app, select the "Firebase Performance" provider option

## Code Structure

- `lib/main.dart`: Entry point that initializes performance tracking with Mock provider by default
- `lib/services/performance_service.dart`: Service that wraps the deriv_app_performance API and adds local visualization
- `lib/screens/home_screen.dart`: Main screen with demos for different tracking scenarios
- `lib/screens/detail_page.dart`: Secondary screen to demonstrate page navigation tracking
- `lib/screens/metrics_dashboard.dart`: Dashboard for visualizing performance metrics
- `lib/models/`: Data models for performance metrics and trace events
- `lib/widgets/`: UI components for displaying performance data

## Key Concepts

### Initialization with Provider Selection

```dart
// Initialize with Mock provider (for development without Firebase)
await PerformanceService.instance.init(
  providers: [PerformanceProvider.mock],
);

// Or initialize with Firebase provider
await PerformanceService.instance.init(
  providers: [PerformanceProvider.firebase],
);
```

### Custom Traces

```dart
// Start a custom trace
PerformanceService.instance.startCustomTrace(
  'user_authentication',
  attributes: {'method': 'email_password', 'screen': 'login_screen'},
);

// Stop the trace and record metrics
PerformanceService.instance.stopCustomTrace(
  'user_authentication',
  attributes: {'success': 'true'},
  metrics: {'auth_time_ms': 1500},
);
```

### Tracking Operations

```dart
// Track a data loading operation
final result = await PerformanceService.instance.trackDataLoading<String>(
  dataType: 'user_profile',
  loadOperation: () async {
    // Your async operation here
    return 'User profile loaded successfully';
  },
  additionalAttributes: {'user_id': '12345', 'source': 'home_screen'},
);
```

### Automatic Page Navigation Tracking

```dart
// Add the navigator observer to your MaterialApp
MaterialApp(
  navigatorObservers: [
    PerformanceNavigatorObserver(),
  ],
  // ...
);
```

## Performance Visualization

The example app demonstrates two approaches to performance visualization:

1. **Firebase Console** (when using Firebase provider):
   - View detailed metrics in the Firebase Performance Monitoring console
   - Analyze trends and patterns over time
   - Compare performance across different app versions

2. **In-App Dashboard** (works with any provider):
   - View real-time metrics directly in the app
   - See a timeline of trace events
   - Color-coded performance indicators
   - No external dependencies or setup required

## Best Practices

- Use the Mock provider during development to avoid unnecessary data collection
- Create custom traces for important user flows in your app
- Add meaningful attributes to traces for better analysis
- Use consistent naming conventions for traces and metrics
- Track both successful and failed operations
- Consider performance implications when designing your app architecture
