# Deriv Analytics Library

A Flutter analytics library that integrates multiple analytics services including Datadog, Firebase, and RudderStack.

## Table of Contents

1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Configuration](#configuration)
    - [Datadog](#datadog)
    - [Firebase](#firebase)
    - [RudderStack](#rudderstack)
4. [Logging Events](#logging-events)
5. [User Identification](#user-identification)
6. [Tracking Screens](#tracking-screens)

## Installation

To install the package, add the following to your `pubspec.yaml`:

```yaml
dependencies:
  analytics:
       git:
         url: https://github.com/deriv-com/flutter-deriv-packages.git
         path: packages/analytics
         ref: <master/dev>
```

Run `flutter packages get` to fetch the package.

## Quick Start

Initialize the analytics services you want to use in your `main.dart`:

```dart
final datadog = DerivDatadog();
final firebase = DerivFirebaseAnalytics();
final rudderstack = DerivRudderstack();

void main() {

    WidgetsFlutterBinding.ensureInitialized();

    DerivDatadogConfiguration configuration = DerivDatadogConfiguration(
      applicationId: 'DATADOG_APPLICATION_ID',
      clientToken: 'DATADOG_CLIENT_TOKEN',
      env: 'DATADOG_ENVIRONMENT',
      serviceName: 'DATADOG_SERVICE_NAME',
      trackingConsent: TrackingConsent.granted,
    );

  DerivDatadog().setup(configuration);

  DerivRudderstack().setup(RudderstackConfiguration(
      dataPlaneUrl: 'RUDDERSTACK_DATA_PLANE_URL',
      writeKey: 'RUDDERSTACK_WRITE_KEY',
      debugEnabled: true,
    ));

    DerivFirebaseAnalytics(FirebaseAnalytics.instanceFor(app: await Firebase.initializeApp())).setup(
      FirebaseConfiguration(
        isAnalyticsCollectionEnabled: true,
      ),
    );
    
  runApp(MyApp());
}
```

## Configuration

### Datadog

```dart
await datadog.setup(DerivDatadogConfiguration(
  clientToken: 'your_client_token',
  applicationId: 'your_application_id',
  env: 'production',
  trackingConsent: TrackingConsent.granted,
));
```

### Firebase

```dart
await firebase.setup(FirebaseConfiguration(
  isAnalyticsCollectionEnabled: true,
));
```

### RudderStack

```dart
await rudderstack.setup(RudderstackConfiguration(
  dataPlaneUrl: 'your_data_plane_url',
  writeKey: 'your_write_key',
));
```

## Logging Events

You can log events as follows:

```dart
datadog.logEvent('button_click', {'label': 'cta_button'});
firebase.logEvent('button_click', {'label': 'cta_button'});
rudderstack.track('button_click');
```

## User Identification

To identify a user:

```dart
datadog.setUserInfo(id: '123', email: 'email@example.com');
firebase.setUserId(id: '123');
rudderstack.identify(userId: '123');
```

## Tracking Screens

```dart
datadog.screen(screenName: 'Home');
firebase.setCurrentScreen(screenName: 'Home');
rudderstack.screen(screenName: 'Home');
```
