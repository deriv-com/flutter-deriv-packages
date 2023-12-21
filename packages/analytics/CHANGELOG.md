## 1.2.0

 - **FEAT**(analytics): add sokmething. ([c35a6fa9](https://github.com/regentmarkets/flutter-deriv-packages/commit/c35a6fa98e8608336bc238995fcc230bd3d3e143))

## 1.1.0

 - **FEAT**(analytics): add sokmething. ([c35a6fa9](https://github.com/regentmarkets/flutter-deriv-packages/commit/c35a6fa98e8608336bc238995fcc230bd3d3e143))

## 1.0.2

 - **REVERT**(analytics): versioning and CHANGELOG. ([81a3a0df](https://github.com/regentmarkets/flutter-deriv-packages/commit/81a3a0df27208bd200009415855c6cb944d016e3))
 - **REFACTOR**(analytics): [MOBC-546] Creating unified analytics package. ([#315](https://github.com/regentmarkets/flutter-deriv-packages/issues/315)). ([fd1d8ed3](https://github.com/regentmarkets/flutter-deriv-packages/commit/fd1d8ed345d4ecf91c5f6c1463c5196b40abcbf6))

## 1.0.1

 - **REVERT**(analytics): versioning and CHANGELOG. ([81a3a0df](https://github.com/regentmarkets/flutter-deriv-packages/commit/81a3a0df27208bd200009415855c6cb944d016e3))
 - **REFACTOR**(analytics): [MOBC-546] Creating unified analytics package. ([#315](https://github.com/regentmarkets/flutter-deriv-packages/issues/315)). ([fd1d8ed3](https://github.com/regentmarkets/flutter-deriv-packages/commit/fd1d8ed345d4ecf91c5f6c1463c5196b40abcbf6))

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
