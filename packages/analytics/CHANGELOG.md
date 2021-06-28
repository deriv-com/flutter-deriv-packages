## [1.0.0]
- Migrated the package to null safety.

## [0.1.0]
- Segment got replaced with deriv_rudderstack plugin.
- A new event to log push token called `logPushToken()`.

### Breaking changes:
**Android**:
- In app's build.gradle, replace segment_access_key with `rudderstack_access_key`
- In AndroidManifest.xml, replace segment package name with `com.deriv.rudderstack`.


**iOS**:
- In Debug.xcconfig and Release.xcconfig, ensure the key's name is `RUDDER_STACK_KEY`.
- In Info.plist, replace segment package name with `com.deriv.rudderstack`.

**General**:
- `init()` function does not require a device token anymore.
- `deviceToken` is sent now with `logLoginEvent()`.
- Call the events using `Analytics()` instead of the instance `Analytics.instance`

## [0.0.1]

* Sends analytical information from the flutter app to 'Firebase' and 'Segment'.
