import 'package:analytics/sdk/base_analytics_configuration.dart';
import 'package:flutter/widgets.dart';

/// Define the analytics interface
abstract class BaseAnalytics<T extends BaseAnalyticsConfiguration> {
  /// The [NavigatorObserver] instances used for tracking navigation events.
  NavigatorObserver get navigatorObserver;

  /// Sets up the analytics client.
  Future<bool> setup(T configuration);
}
