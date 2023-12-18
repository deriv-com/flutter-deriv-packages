import 'package:flutter_test/flutter_test.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:deriv_datadog/deriv_datadog.dart';

void main() {
  group('Enums', () {
    test(
        'TrackingConsentExtension: consent should return the corresponding datadog.TrackingConsent value',
        () {
      expect(TrackingConsent.granted.consent, datadog.TrackingConsent.granted);
      expect(TrackingConsent.notGranted.consent,
          datadog.TrackingConsent.notGranted);
      expect(TrackingConsent.pending.consent, datadog.TrackingConsent.pending);
    });

    test(
        'DatadogSiteExtension: site should return the corresponding datadog.DatadogSite value',
        () {
      expect(DatadogSite.us1.site, datadog.DatadogSite.us1);
      expect(DatadogSite.us3.site, datadog.DatadogSite.us3);
      expect(DatadogSite.us5.site, datadog.DatadogSite.us5);
      expect(DatadogSite.eu1.site, datadog.DatadogSite.eu1);
      expect(DatadogSite.us1Fed.site, datadog.DatadogSite.us1Fed);
      expect(DatadogSite.ap1.site, datadog.DatadogSite.ap1);
    });
  });
}
