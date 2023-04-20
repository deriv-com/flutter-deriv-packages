import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;

import 'package:deriv_datadog/deriv_datadog.dart';

/// An base class that defines structure of the [BaseDerivDatadog].
abstract class BaseDerivDatadog {
  /// A method to set the user info with the given [id], name, [email] and [extraInfo].
  /// The [extraInfo] is a map of key-value pairs that can be used to add any additional information about the user.
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object> extraInfo = const <String, Object>{},
  });

  /// A method to log a tap event with the given name.
  void onTapEvent(String name, [Map<String, Object?> attributes]);

  /// A method to log a scroll event with the given name.
  void onSscrollEvent(String name, [Map<String, Object?> attributes]);

  /// A method to log a swipe event with the given name.
  void onSwipeEvent(String name, [Map<String, Object?> attributes]);

  /// A method to log a custom event with the given name.
  void onCustomEvent(String name, [Map<String, Object?> attributes]);

  /// A method to log an error with the given message and marks it as a source error.
  void onSourceError(String message, [Map<String, Object?> attributes]);

  /// A method to start [Datadog] with the given config and runner.
  Future<void> runApp(
    DerivDatadogConfiguration configuration,
    datadog.AppRunner runner,
  );
}
