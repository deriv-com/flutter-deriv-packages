import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:deriv_datadog/core/deriv_datadog_configuration.dart';
import 'package:deriv_datadog/sdk/deriv_datadog.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_datadog_navigation_observer.mocks.dart';

class MockDerivDatadog extends Mock implements DerivDatadog {
  @override
  DatadogNavigationObserver get navigationObserver =>
      MockDatadogNavigationObserver();

  @override
  void setUserInfo(
      {String? id,
      String? name,
      String? email,
      Map<String, Object?>? extraInfo}) {
    super.noSuchMethod(
        Invocation.method(#setUserInfo, <Object?>[id, name, email, extraInfo]));
  }

  @override
  void onTapEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    super.noSuchMethod(
        Invocation.method(#onTapEvent, <Object?>[name, attributes]));
  }

  @override
  void onScrollEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    super.noSuchMethod(
        Invocation.method(#onScrollEvent, <Object?>[name, attributes]));
  }

  @override
  void onCustomEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    super.noSuchMethod(
        Invocation.method(#onCustomEvent, <Object?>[name, attributes]));
  }

  @override
  void onSourceError(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    super.noSuchMethod(
        Invocation.method(#onCustomError, <Object?>[name, attributes]));
  }

  @override
  Future<void> runApp(
    DerivDatadogConfiguration configuration,
    void Function() runner,
  ) async {
    super.noSuchMethod(
        Invocation.method(#runApp, <Object?>[configuration, runner]));
  }
}
