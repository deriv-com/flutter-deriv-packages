<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A debugging package that prints console and network logs in the UI.

## Features

- preetify terminal logs
- prints terminal logs in UI

## Getting started

Add the package to your pubspec.yaml file

```yaml
deriv_logger:
  git:
    url: https://github.com/deriv-com/flutter-deriv-packages.git
    path: packages/deriv_logger
```

## Usage

#### Initialize the App Logger

```dart
AppLogger.initialize();
```

#### View console logs in UI (Optional)

In order to enable this, Root widget under `MaterialApp` should be wrapped with DebugOverlay widget.

```dart
DebugOverlay(
    builder: (_) => SplashPage(),
    enabled: true,
    ),
```

#### Use its methods

```dart
/// Log for information
AppLogger.i('Log message', title: 'Title of logs');

/// Log for error
AppLogger.e('Log message', title: 'Title of logs');

/// Log for fatal
AppLogger.f('Log message', title: 'Title of logs');

/// Log for success
AppLogger.s('Log message', title: 'Title of logs');

/// Log for warning
AppLogger.w('Log message', title: 'Title of logs');
```
