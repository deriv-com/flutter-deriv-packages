
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  group('DerivAuthUtmModel', () {
    patrolTest('Constructor initializes all properties correctly', ($) async {
      final model = DerivAuthUtmModel(
        'source',
        'campaign',
        'campaignId',
        'adGroupId',
        'adId',
        'medium',
        'content',
        'term',
        'affiliateToken',
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

    patrolTest('Constructor initializes optional properties as null', ($) async {
      final model = DerivAuthUtmModel('source', 'campaign', null, null, null, null, null, null, null);

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
