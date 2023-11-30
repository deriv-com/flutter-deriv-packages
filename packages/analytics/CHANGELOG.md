## [2.0.0]
- Introduced a flexible configuration system to support multiple analytics providers.
- Added `BaseAnalyticsConfiguration` interface for standardizing analytics configuration.
- Internalized and restructured Datadog analytics by providing a `DerivDatadog` class that implements `BaseAnalytics<DerivDatadogConfiguration>`.
- Refined existing analytics services to have their own classes implementing `BaseAnalytics`.
- Introduced Enum types and extensions (`TrackingConsent`, `DatadogSite`) to aid in analytics configuration.
- Improved navigation observer support to work with multiple analytics providers.
- Enhanced exception handling to capture Flutter and Platform-specific errors.
- Added ability to set user information for analytics tracking.
- Replaced in-house Rudderstack plugin with the official Rudderstack SDK.

### Breaking changes:
**General**:
- `setup()` method for analytics providers now requires configuration classes implementing `BaseAnalyticsConfiguration`.
- Exception handling updated to include multiple analytics providers.
- Rudderstack: Now requires the official Rudderstack SDK for analytics. Update dependencies accordingly.
- Datadog: Migrated from a separate package to an internal implementation within this package.
- Existing analytics services have been restructured to implement `BaseAnalytics`, potentially changing function signatures and configurations.

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
