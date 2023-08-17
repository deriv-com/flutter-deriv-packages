# analytics
***
This package is used for collecting and sending analytical information from the app to "Firebase" and "RudderStack".
## Installation
##### 1. Add to pubspec.yaml
```yaml
analytics:
       git:
         url: git@github.com:sahani-deriv/flutter-deriv-packages.git
         path: packages/analytics
         ref: <master/dev>
```
Setup the Android and iOS sources as described at rudderstack.com and generate the write keys for Android and iOS sources.

Set the WRITE_KEY in addition to enabling the plugin to track app lifecycle, screens, and whether to enable debug mode or not in Android and iOS as follows:

### Android
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.deriv.deriv_rudderstack_example">
    <application>
        <activity>
            [...]
        </activity>
        <meta-data
            android:name="com.deriv.rudderstack.WRITE_KEY"
            android:value="ADD-YOUR-KEY" />
        <meta-data
            android:name="com.deriv.rudderstack.TRACK_APPLICATION_LIFECYCLE_EVENTS"
            android:value="false" />
        <meta-data
            android:name="com.deriv.rudderstack.RECORD_SCREEN_VIEWS"
            android:value="false" />
        <meta-data android:name="com.deriv.rudderstack.DEBUG" android:value="false" />


    </application>
</manifest>
```

### iOS
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	[...]
    <key>com.deriv.rudderstack.WRITE_KEY</key>
    <string>ADD-YOUR-KEY</string>
	<key>com.deriv.rudderstack.TRACK_APPLICATION_LIFECYCLE_EVENTS</key>
    <false/>
    <key>com.deriv.rudderstack.RECORD_SCREEN_VIEWS</key>
    <false/>
    <key>com.deriv.rudderstack.DEBUG</key>
    <false/>
	[...]
</dict>
</plist>
```

## How to use
***
##### 1. Enabling analytics.
```dart
Analytics().init(
    isEnabled: true, // set value to false for disable 'Analytics'
  );
```
##### 2. To track PageRoute transitions.
```dart
MaterialApp(
    navigatorObservers: Analytics().observer == null
        ? []
        : [Analytics().observer],
  );
```
##### 3. Logging to 'RudderStack' in different scenarios.
###### when app is  opened.
```dart
Analytics().logAppOpened();
```
###### when app is in background.
```dart
Analytics().logAppBackgrounded();
```
###### when app is crashed.
```dart
Analytics().logAppCrashed();
```

##### 4. Sending information about current screen.
```dart
Analytics().setCurrentScreen(screenName: "<CURRENT_SCREEN_NAME_HERE>");
```
##### 4. Setting routes/screens which need to be ignored for analytics.
```dart
Analytics().setIgnoredRoutes([
      'IGNORED_SCREEN_NAME_1',
      'IGNORED_SCREEN_NAME_2',
      '.....................',
      'IGNORED_SCREEN_NAME_N'
    ]);
```
##### 4. Sending information during user login.
```dart
Analytics().logLoginEvent(userId: "<USER_ID_HERE", deviceToken: "<FIREBASE_TOKEN_HERE>",);
```
##### 7. Sending information during user logout.
```dart
Analytics().logLogoutEvent();
```
##### 8. Sending information about important events to "Firebase".
```dart
Analytics().logToFirebase(
      name: "<EVENT_NAME_HERE>",
      params: <String, dynamic>{'PARAM_1': 'VALUE_1',
                                'PARAM_1': 'VALUE_1',
                                '.......': '.......',
                                'PARAM_N': 'VALUE_N'},
    );
```
