// ignore_for_file: always_specify_types

import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  group('DerivAuthUtmModel', () {
    patrolWidgetTest('Constructor initializes all properties correctly',
        (PatrolTester $) async {
      final model = DerivAuthUtmModel(
        affiliateToken: 'affiliateToken',
        utmAdGroupId: 'adGroupId',
        utmAdId: 'adId',
        utmCampaign: 'campaign',
        utmCampaignId: 'campaignId',
        utmContent: 'content',
        utmMedium: 'medium',
        utmSource: 'source',
        utmTerm: 'term',
      );

      expect(model.utmSource, 'source');
      expect(model.utmCampaign, 'campaign');
      expect(model.utmCampaignId, 'campaignId');
      expect(model.utmAdGroupId, 'adGroupId');
      expect(model.utmAdId, 'adId');
      expect(model.utmMedium, 'medium');
      expect(model.utmContent, 'content');
      expect(model.utmTerm, 'term');
      expect(model.affiliateToken, 'affiliateToken');
    });

    patrolWidgetTest('Constructor initializes optional properties as null',
        (PatrolTester $) async {
      final model =
          DerivAuthUtmModel(utmSource: 'source', utmCampaign: 'campaign');

      expect(model.utmCampaignId, isNull);
      expect(model.utmAdGroupId, isNull);
      expect(model.utmAdId, isNull);
      expect(model.utmMedium, isNull);
      expect(model.utmContent, isNull);
      expect(model.utmTerm, isNull);
      expect(model.affiliateToken, isNull);
    });
  });
}
