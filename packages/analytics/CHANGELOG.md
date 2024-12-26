## 4.2.0

 - **REFACTOR**: update_reference_to_git_dependencies ([#929](https://github.com/deriv-com/flutter-deriv-packages.git/issues/929)). ([0da684dc](https://github.com/deriv-com/flutter-deriv-packages.git/commit/0da684dc56251fe01991f6a5e36b76b627b379fd))
 - **FEAT**(analytics): Update datadog ([#937](https://github.com/deriv-com/flutter-deriv-packages.git/issues/937)). ([c0259328](https://github.com/deriv-com/flutter-deriv-packages.git/commit/c0259328988f40f605aa4e15ac72440f465c3c85))

## 4.1.1

 - **FIX**(analytics): Update rudderstack event for trading ([#898](https://github.com/regentmarkets/flutter-deriv-packages/issues/898)). ([434fc8b4](https://github.com/regentmarkets/flutter-deriv-packages/commit/434fc8b443eb429ad0bff1f5192f35f6489eb488))

## 4.1.0

 - **FEAT**(analytics): Add indicator events ([#846](https://github.com/regentmarkets/flutter-deriv-packages/issues/846)). ([1d30ddc9](https://github.com/regentmarkets/flutter-deriv-packages/commit/1d30ddc9c7510e280cc90fc7e1308b945d5758ed))

## 4.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(analytics): add auto trade rudderstack events ([#845](https://github.com/regentmarkets/flutter-deriv-packages/issues/845)). ([8c15aafd](https://github.com/regentmarkets/flutter-deriv-packages/commit/8c15aafda41428c9d19272117b0a5a49b16b4154))

## 3.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(analytics): [DRGO-1247] Ramin/update for flutter 3.24 ([#838](https://github.com/regentmarkets/flutter-deriv-packages/issues/838)). ([cfdf2d81](https://github.com/regentmarkets/flutter-deriv-packages/commit/cfdf2d812b4d4227f72b434f7db9ea182081ae6b))

## 2.3.0

 - **FEAT**(analytics): Amend tracking events Rudderstack ([#821](https://github.com/regentmarkets/flutter-deriv-packages/issues/821)). ([bd197376](https://github.com/regentmarkets/flutter-deriv-packages/commit/bd197376cf450ec375a9759c9511563a253a0c64))

## 2.2.2

 - **REFACTOR**(analytics): Amend virtual n real tracking events ([#771](https://github.com/regentmarkets/flutter-deriv-packages/issues/771)). ([fc8850f0](https://github.com/regentmarkets/flutter-deriv-packages/commit/fc8850f01c1bb0a6805b41b3ff10e2a6e33b6e0f))

## 2.2.1

 - **FIX**(analytics): ilya/TRHM-945/Amend_Virtual_n_Real_Tracking_Events ([#762](https://github.com/regentmarkets/flutter-deriv-packages/issues/762)). ([cbba6688](https://github.com/regentmarkets/flutter-deriv-packages/commit/cbba668827d72c971d1100ecafee5719d4617639))

## 2.2.0

 - **FEAT**(analytics): add trade page events to rudderstack events ([#691](https://github.com/regentmarkets/flutter-deriv-packages/issues/691)). ([b9e2b098](https://github.com/regentmarkets/flutter-deriv-packages/commit/b9e2b098fb76ea4f8f5f633c062a6cd20f4db6f0))

## 2.1.0

 - **FEAT**(analytics): ilya/DERG-2409/Add_tracking_to_real_account_sign_up_on_Deriv_Go ([#603](https://github.com/regentmarkets/flutter-deriv-packages/issues/603)). ([9ada725d](https://github.com/regentmarkets/flutter-deriv-packages/commit/9ada725ded271e2b94cffed622eff2e75539cb55))

## 2.0.0

> Note: This release has breaking changes.

 - **BREAKING** **REFACTOR**(analytics): added logAppOpen event ([#610](https://github.com/regentmarkets/flutter-deriv-packages/issues/610)). ([74f8d9c3](https://github.com/regentmarkets/flutter-deriv-packages/commit/74f8d9c3a7311ec7abb1cfe76c3f6f190fbcb81a))

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
