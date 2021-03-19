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

##### 2. Add the key to Info.plist in IOS.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	[...]
    <key>RudderStackKey</key>
    <string>${RUDDER_STACK_KEY}</string>
	[...]
</dict>
</plist>
```

#### 3. Add method channel for Android

```kotlin
    companion object {
        const val CHANNEL = "com.your.package"
    }


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getWriteKey" -> {
                    result.success(BuildConfig.rudderStackAccessKey)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
```

#### 4. Add method channel for iOS

```swift
        let buildInfoChannel = FlutterMethodChannel(name: "com.your.package",
                                                    binaryMessenger: flutterViewController.binaryMessenger)

        buildInfoChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            DispatchQueue.main.async {
                guard call.method == "getWriteKey" else {
                    result(FlutterMethodNotImplemented)
                    return
                }
                 if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
                            let nsDictionary: NSDictionary? = NSDictionary(contentsOfFile: path)
                            result(nsDictionary?["RudderStackKey"] as! String)
                 }
            }

        })

```

#### 5. Get the write key and pass it to the package in `init()` function.

## How to use
***
##### 1. Enabling analytics.
```dart
Analytics().init(
    rudderWriteKey: '<WRITE_KEY_HERE>
    isEnabled: true, // set value to false for disable 'Analytics'
  );
```
##### 2. To track PageRoute transitions.
```dart
MaterialApp(
    navigatorObservers: Analytics().observer == null
        ? []
        : [Analytics.instance.observer],
  );
```
##### 3. Logging to 'Segment' in different scenarios.
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
Analytics().logLoginEvent(deviceToken: <DEVICE_TOKEN_HERE>, userId: "<USER_ID_HERE>");
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
