# analytics
***
This package is used for collecting and sending analytical information from the app to "Firebase" and "RudderStack".
## Installation
##### 1. Add to pubspec.yaml
```yaml
analytics:
       git:
         url: git@github.com:regentmarkets/flutter-deriv-packages.git
         path: packages/analytics
         ref: master
```

## How to use
***
##### 1. Enabling analytics.
```dart
Analytics.instance.init(
    isEnabled: true, // set value to false for disable 'Analytics'
  );
```
##### 2. To track PageRoute transitions.
```dart
MaterialApp(
    navigatorObservers: Analytics.instance.observer == null
        ? []
        : [Analytics.instance.observer],
  );
```
##### 3. Logging to 'Segment' in different scenarios.
###### when app is  opened.
```dart
Analytics.instance.logAppOpened();
```
###### when app is in background.
```dart
Analytics.instance.logAppBackgrounded();
```
###### when app is crashed.
```dart
Analytics.instance.logAppCrashed();
```

##### 4. Sending information about current screen.
```dart
Analytics.instance.setCurrentScreen(screenName: "<CURRENT_SCREEN_NAME_HERE>");
```
##### 4. Setting routes/screens which need to be ignored for analytics.
```dart
Analytics.instance.setIgnoredRoutes([
      'IGNORED_SCREEN_NAME_1',
      'IGNORED_SCREEN_NAME_2',
      '.....................',
      'IGNORED_SCREEN_NAME_N'
    ]);
```
##### 4. Sending information during user login.
```dart
Analytics.instance.logLoginEvent("<USER_ID_HERE");
```
##### 7. Sending information during user logout.
```dart
Analytics.instance.logLogoutEvent();
```
##### 8. Sending information about important events to "Firebase".
```dart
Analytics.instance.logToFirebase(
      name: "<EVENT_NAME_HERE>",
      params: <String, dynamic>{'PARAM_1': 'VALUE_1',
                                'PARAM_1': 'VALUE_1',
                                '.......': '.......',
                                'PARAM_N': 'VALUE_N'},
    );
```
