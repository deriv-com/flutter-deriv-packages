import 'package:analytics/sdk/base_analytics.dart';
import 'package:analytics/sdk/datadog/core/datadog_configuration.dart';
import 'package:analytics/sdk/datadog/sdk/deriv_datadog.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:analytics/sdk/datadog/core/enums.dart' as deriv_datadog_enums;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DerivDatadog', () {
    late DerivDatadog derivDatadog;
    late DatadogSdk datadogSdk;
    late DerivDatadogConfiguration derivDatadogConfiguration;

    setUpAll(() {
      DatadogSdk.initializeForTesting();
      datadogSdk = DatadogSdk.instance;
      derivDatadog = DerivDatadog()..setDatadogSdk(datadogSdk);
      derivDatadogConfiguration = const DerivDatadogConfiguration(
        applicationId: 'applicationId',
        clientToken: 'clientToken',
        env: 'env',
        trackingConsent: deriv_datadog_enums.TrackingConsent.granted,
      );
    });

    test('should return correct instance of DerivDatadog', () {
      expect(derivDatadog, isA<DerivDatadog>());
      expect(derivDatadog, isA<BaseAnalytics<DerivDatadogConfiguration>>());
    });

    test('should return correct NavigatorObserver', () {
      final NavigatorObserver navigationObserver =
          derivDatadog.navigatorObserver;
      expect(navigationObserver, isNotNull);
      expect(navigationObserver, isA<datadog.DatadogNavigationObserver>());
    });

    test('should call setup with correct parameters', () async {
      final bool result = await derivDatadog.setup(derivDatadogConfiguration);
      expect(result, true);
    });
  });
}
