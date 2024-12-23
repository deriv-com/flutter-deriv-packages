# Deriv Datadog Flutter Package
## Overview
The Flutter package name is `Deriv Datadog`, and it uses the Datadog Plugin. This package helps you monitor the performance and user interactions of your Flutter app by sending data to Datadog.

## Installation
Add the following to your `pubspec.yaml`:
```
deriv_datadog:
  git:
    url: https://github.com/deriv-com/flutter-deriv-packages.git
    path: packages/deriv_datadog
    ref: dev
```
Then run `flutter pub get` to fetch the package.

## Installation
### 1. Import the package
Import the `deriv_datadog` package in the files where you need to use it:
```
import 'package:deriv_datadog/deriv_datadog.dart';
```
### 2. Initialize the DerivDatadog instance
Call `runApp` method of the `DerivDatadog` instance with the configuration to initialize the SDK:
```
Future<void> main() async {
  const configuration = DerivDatadogConfiguration(
    applicationId: 'APPLICAION_ID',
    clientToken: 'CLIENT_TOKEN',
    env: 'example',
    site: DatadogSite.us1,
    trackingConsent: TrackingConsent.granted,
    nativeCrashReportEnabled: true,
    sessionSamplingRate: 100,
    tracingSamplingRate: 100,
    serviceName: 'example',
  );

  DerivDatadog().runApp(configuration, () => runApp(const App()));
}
```
### 3. Add the DatadogNavigationObserver to your MaterialApp
Add the `DatadogNavigationObserver` to the `navigatorObservers` list of your `MaterialApp`:
```
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorObservers: [DerivDatadog().navigationObserver],
        // Other MaterialApp properties...
      );
}
```
### 4. Set user information (optional)
Call the `setUserInfo` method to set user information:
```
DerivDatadog().setUserInfo(
  id: "0",
  name: "Example App User",
  email: "example_user@deriv.com",
  extraInfo: {},
);
```
### 5. Record user actions and events
Use the following methods to record user actions and events:
- `onTapEvent`
- `onScrollEvent`
- `onSwipeEvent`
- `onCustomEvent`
- `onSourceError`

## Example App
Here's an example app demonstrating the usage of the `DerivDatadog` package:
```
import 'package:flutter/material.dart';

import 'package:deriv_datadog/deriv_datadog.dart';

import 'package:example/pages/first_page.dart';
import 'package:example/pages/second_page.dart';
import 'package:example/pages/splash_screen.dart';

Future<void> main() async {
  const configuration = DerivDatadogConfiguration(
    applicationId: 'APPLICAION_ID',
    clientToken: 'CLIENT_TOKEN',
    env: 'example',
    site: DatadogSite.us1,
    trackingConsent: TrackingConsent.granted,
    nativeCrashReportEnabled: true,
    sessionSamplingRate: 100,
    tracingSamplingRate: 100,
    serviceName: 'example',
  );

  DerivDatadog().runApp(configuration, () => runApp(const App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    DerivDatadog().setUserInfo(
      id: "0",
      name: "Example App User",
      email: "example_user@deriv.com",
      extraInfo: {},
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorObservers: [DerivDatadog().navigationObserver],
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/': (context) => const FirstPage(),
          '/second': (context) => const SecondPage(),
        },
      );
}
```
## Methods
The `DerivDatadog` class provides several methods for monitoring user interactions and events:
- `setUserInfo`: Sets user information such as ID, name, email, and extra information.
- `onTapEvent`: Records a tap event.
- `onScrollEvent`: Records a scroll event.
- `onSwipeEvent`: Records a swipe event.
- `onCustomEvent`: Records a custom event.
- `onSourceError`: Records an error from a source.