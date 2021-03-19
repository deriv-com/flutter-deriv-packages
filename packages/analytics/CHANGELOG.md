## [0.1.0]
- Segment got replaced with rudder_sdk_flutter plugin.
- A new event to log push token called `logPushToken()`.

### Breaking changes:
**Android**:
- In app's build.gradle, replace segment_access_key resValue with
```
 buildConfigField 'String', 'rudderStackAccessKey', keyProperties['rudderStackAccessKey'] ? ("\"" + keyProperties['rudderStackAccessKey'] + "\""): ''
```

- In AndroidManifest.xml, remove all tags related to segment.
- Add method channel to retrieve and provide the rudder access key.

**iOS**:
- In Debug.xcconfig and Release.xcconfig, ensure the key's name is `RUDDER_STACK_KEY`.
- In Info.plist, remove all tags related to segment and add the following
```
        <key>RudderStackKey</key>
        <string>${RUDDER_STACK_KEY}</string>
```
- Add method channel to retrieve and provide the rudder access key.

**General**:
- `init()` function does not require a device token anymore.
- `init()` function requires rudderstack write key that is passed as `rudderWriteKey`.
- `deviceToken` is sent now with `logLoginEvent()`.
- Call the events using `Analytics()` instead of the instance `Analytics.instance`

## [0.0.1]

* Sends analytical information from the flutter app to 'Firebase' and 'Segment'.
