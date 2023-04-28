import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:deriv_datadog/deriv_datadog.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_deriv_datadog.mocks.dart';
import 'mocks/mock_deriv_datadog_configuration.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('DerivDatadog', () {
    late MockDerivDatadog mockDerivDatadog;
    late MockDerivDatadogConfiguration mockDerivDatadogConfiguration;

    setUp(() {
      mockDerivDatadog = MockDerivDatadog();
      mockDerivDatadogConfiguration = MockDerivDatadogConfiguration();
    });

    test('DerivDatadog constructor should return correct Object.', () {
      expect(mockDerivDatadog, isA<DerivDatadog>());
      expect(mockDerivDatadog, isA<BaseDerivDatadog>());
    });

    test('navigationObserver', () {
      final datadog.DatadogNavigationObserver navigationObserver =
          mockDerivDatadog.navigationObserver;
      expect(navigationObserver, isNotNull);
      expect(navigationObserver, isA<datadog.DatadogNavigationObserver>());
    });

    test('setUserInfo', () {
      mockDerivDatadog.setUserInfo(
          id: '123',
          name: 'John Doe',
          email: 'john.doe@example.com',
          extraInfo: <String, Object>{});

      verify<void>(() => mockDerivDatadog.setUserInfo(
          id: '123',
          name: 'John Doe',
          email: 'john.doe@example.com',
          extraInfo: <String, Object>{})).called(1);
    });

    test('onTapEvent', () {
      const String name = 'test event';
      const Map<String, Object?> attributes = <String, Object?>{
        'attribute': 'value'
      };

      mockDerivDatadog.onTapEvent(name, attributes);

      verify<void>(() => mockDerivDatadog.onTapEvent(name, attributes))
          .called(1);
    });

    test('onScrollEvent', () {
      mockDerivDatadog
          .onScrollEvent('test event', <String, Object?>{'attribute': 'value'});

      verify<void>(() => mockDerivDatadog.onScrollEvent(
          'test event', <String, Object?>{'attribute': 'value'})).called(1);
    });

    test('onSwipeEvent', () {
      mockDerivDatadog
          .onSwipeEvent('test event', <String, Object?>{'attribute': 'value'});

      verify<void>(() => mockDerivDatadog.onSwipeEvent(
          'test event', <String, Object?>{'attribute': 'value'})).called(1);
    });

    test('onCustomEvent', () {
      mockDerivDatadog
          .onCustomEvent('test event', <String, Object?>{'attribute': 'value'});

      verify<void>(() => mockDerivDatadog.onCustomEvent(
          'test event', <String, Object?>{'attribute': 'value'})).called(1);
    });

    test('onSourceError', () {
      mockDerivDatadog
          .onSourceError('test error', <String, Object?>{'attribute': 'value'});

      verify<void>(() => mockDerivDatadog.onSourceError(
          'test error', <String, Object?>{'attribute': 'value'})).called(1);
    });

    test('runApp', () async {
      void Function()? callback() => null;

      await mockDerivDatadog.runApp(mockDerivDatadogConfiguration, callback);

      verify(() =>
              mockDerivDatadog.runApp(mockDerivDatadogConfiguration, callback))
          .called(1);
    });
  });
}
