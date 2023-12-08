import 'package:analytics/sdk/datadog/core/datadog_configuration.dart';
import 'package:analytics/sdk/datadog/core/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DerivDatadogConfiguration', () {
    test('DerivDatadogConfiguration', () {
      const DerivDatadogConfiguration config = DerivDatadogConfiguration(
        applicationId: 'myAppId',
        clientToken: 'myClientToken',
        env: 'development',
        trackingConsent: TrackingConsent.granted,
        site: DatadogSite.ap1,
        nativeCrashReportEnabled: false,
        sessionSamplingRate: 10,
        tracingSamplingRate: 20,
        serviceName: 'myServiceName',
      );

      expect(config.applicationId, 'myAppId');
      expect(config.clientToken, 'myClientToken');
      expect(config.env, 'development');
      expect(config.trackingConsent, TrackingConsent.granted);
      expect(config.site, DatadogSite.ap1);
      expect(config.nativeCrashReportEnabled, false);
      expect(config.sessionSamplingRate, 10);
      expect(config.tracingSamplingRate, 20);
      expect(config.serviceName, 'myServiceName');
    });
  });
}
