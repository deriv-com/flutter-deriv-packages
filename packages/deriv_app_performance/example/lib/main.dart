import 'package:deriv_app_performance/deriv_app_performance.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/performance_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize performance tracking with Mock provider by default
  // This allows the example to run without Firebase setup
  // You can select multiple providers in the app UI
  await PerformanceService.instance.init(
    providers: [const MockPerformanceProvider()],
    enableFirebase: false,
  );

  // Start tracking app startup
  PerformanceService.instance.startCustomTrace(
    BasePerformanceMetrics.appStartup,
  );

  runApp(const AppPerformanceExampleApp());
}

/// The main example app widget
class AppPerformanceExampleApp extends StatefulWidget {
  /// Constructor
  const AppPerformanceExampleApp({super.key});

  @override
  State<AppPerformanceExampleApp> createState() =>
      _AppPerformanceExampleAppState();
}

class _AppPerformanceExampleAppState extends State<AppPerformanceExampleApp> {
  @override
  void initState() {
    super.initState();

    // Complete app startup tracking after the app is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PerformanceService.instance.stopCustomTrace(
        BasePerformanceMetrics.appStartup,
      );
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App Performance Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        navigatorObservers: [
          // Add a navigator observer to automatically track page navigation
          PerformanceNavigatorObserver(),
        ],
        home: const HomeScreen(),
      );
}

/// Navigator observer that automatically tracks page navigation
class PerformanceNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    final String routeName = route.settings.name ?? 'unknown';
    final String previousRouteName = previousRoute?.settings.name ?? 'unknown';

    PerformanceService.instance.startPageLoadTrace(
      routeName,
      fromPage: previousRouteName,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    final String routeName = previousRoute?.settings.name ?? 'unknown';
    PerformanceService.instance.stopPageLoadTrace(routeName);
  }
}
