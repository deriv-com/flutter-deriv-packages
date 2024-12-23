# deriv_rudderstack

DerivRudderstack plugin is used to add RudderStack Android and iOS SDK support to Flutter. Through the plugin, various users' analaytical events could be logged.

### Supported methods

| Method | Android | iOS |
|---|---|---|
| `identify` | X | X |
| `track` | X | X |
| `screen` | X | X |
| `group` | X | X |
| `alias` | X | X |
| `reset` | X | X |
| `disable` | X | X |
| `enable` | X | X |
| `setContext` | X | X |

## Installation

In order to use the plugin, add the following to `pubspec.yaml` file. Refer to this [link](https://flutter.dev/docs/development/packages-and-plugins/using-packages) for more details.

```yaml
deriv_rudderstack:
       git:
         url: git@github.com:deriv-com/flutter-deriv-packages.git
         path: packages/deriv_rudderstack
         ref: master
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

## Usage

The plugin can be used by making a call to one of the supported methods as follows:

```dart
DerivRudderstack().enable();

DerivRudderstack().setContext(token: 'your-push-token');
DerivRudderstack().identify(userId: 'user-id');

DerivRudderstack().track(
   eventName: 'Application Opened',
   properties: {'entry1': 'test1', 'entry2': 'test2'});

DerivRudderstack().screen(screenName: 'screen-name');

DerivRudderstack().group(
   groupId: 'group-id-test',
   traits: {'entry1': 'test1', 'entry2': 'test2'});

DerivRudderstack().alias(alias: 'alias-test');

DerivRudderstack().reset();

DerivRudderstack().disable();

```
