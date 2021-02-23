## [0.1.0]
- Segment got replaced with DerivRudderstack plugin.
- A new event to log push token called `logPushToken()`.

### Breaking changes:

**Android**:
- In app's build.gradle, replace `segment_access_key` with rudderstack_access_key and `segmentAccessKey` with rudderStackAccessKey.
- In AndroidManifest.xml, replace `com.claimsforce.segment.WRITE_KEY` with com.deriv.rudderstack.WRITE_KEY and `com.claimsforce.segment.TRACK_APPLICATION_LIFECYCLE_EVENTS` with com.deriv.rudderstack.TRACK_APPLICATION_LIFECYCLE_EVENTS.

**iOS**:
- In Debug.xcconfig and Release.xcconfig, ensure the key's name is `RUDDER_STACK_KEY`.
- In Info.plist, replace `com.claimsforce.segment.WRITE_KEY` with com.deriv.rudderstack.WRITE_KEY and `com.claimsforce.segment.TRACK_APPLICATION_LIFECYCLE_EVENTS` with com.deriv.rudderstack.TRACK_APPLICATION_LIFECYCLE_EVENTS.

**General**:
- `init()` function does not require a device token anymore.
- `deviceToken` is sent now with `logLoginEvent()`.

## [0.0.1]

* Sends analytical information from the flutter app to 'Firebase' and 'Segment'.
