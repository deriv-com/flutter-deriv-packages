// Mocks generated by Mockito 5.4.0 from annotations
// in deriv_datadog/test/sdk/deriv_datadog_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as _i2;
import 'package:deriv_datadog/deriv_datadog.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDatadogNavigationObserver_0 extends _i1.SmartFake
    implements _i2.DatadogNavigationObserver {
  _FakeDatadogNavigationObserver_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DerivDatadog].
///
/// See the documentation for Mockito's code generation for more information.
class MockDerivDatadog extends _i1.Mock implements _i3.DerivDatadog {
  @override
  _i2.DatadogNavigationObserver get navigationObserver => (super.noSuchMethod(
        Invocation.getter(#navigationObserver),
        returnValue: _FakeDatadogNavigationObserver_0(
          this,
          Invocation.getter(#navigationObserver),
        ),
        returnValueForMissingStub: _FakeDatadogNavigationObserver_0(
          this,
          Invocation.getter(#navigationObserver),
        ),
      ) as _i2.DatadogNavigationObserver);
  @override
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object>? extraInfo = const {},
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setUserInfo,
          [],
          {
            #id: id,
            #name: name,
            #email: email,
            #extraInfo: extraInfo,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTapEvent(
    String? name, [
    Map<String, Object?>? attributes = const {},
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #onTapEvent,
          [
            name,
            attributes,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onSscrollEvent(
    String? name, [
    Map<String, Object?>? attributes = const {},
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #onSscrollEvent,
          [
            name,
            attributes,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onSwipeEvent(
    String? name, [
    Map<String, Object?>? attributes = const {},
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #onSwipeEvent,
          [
            name,
            attributes,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onCustomEvent(
    String? name, [
    Map<String, Object?>? attributes = const {},
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #onCustomEvent,
          [
            name,
            attributes,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onSourceError(
    String? message, [
    Map<String, Object?>? attributes = const {},
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #onSourceError,
          [
            message,
            attributes,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> runApp(
    _i3.DerivDatadogConfiguration? configuration,
    _i2.AppRunner? runner,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #runApp,
          [
            configuration,
            runner,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [DerivDatadogConfiguration].
///
/// See the documentation for Mockito's code generation for more information.
class MockDerivDatadogConfiguration extends _i1.Mock
    implements _i3.DerivDatadogConfiguration {
  @override
  String get applicationId => (super.noSuchMethod(
        Invocation.getter(#applicationId),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get clientToken => (super.noSuchMethod(
        Invocation.getter(#clientToken),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get env => (super.noSuchMethod(
        Invocation.getter(#env),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i3.TrackingConsent get trackingConsent => (super.noSuchMethod(
        Invocation.getter(#trackingConsent),
        returnValue: _i3.TrackingConsent.granted,
        returnValueForMissingStub: _i3.TrackingConsent.granted,
      ) as _i3.TrackingConsent);
}
