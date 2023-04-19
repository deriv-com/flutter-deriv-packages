import 'package:deriv_datadog/datadog.dart';

/// An abstract class that defines the methods that a concrete class should implement to log user interactions and errors using the Datadog SDK.
abstract class BaseDatadogSdk {

/// A method to set user information, including id, name, email, and extraInfo.
///
/// This method sets user information in the Datadog SDK to associate logs and events with specific users.
void setUserInfo({String? id, String? name, String? email, Map<String, Object> extraInfo = const <String, Object>{}});

/// A method to log a tap event with the given name.
void tapEvent(String name);

/// A method to log a scroll event with the given name.
void scrollEvent(String name);

/// A method to log a swipe event with the given name.
void swipeEvent(String name);

/// A method to log a custom event with the given name.
void customEvent(String name);

/// A method to log an error with the given message and marks it as a source error.
void sourceError(String message);

/// A method to start the Datadog SDK with the given config and runner.
Future<void> runApp(DatadogSdkConfig config, AppRunner runner);
}