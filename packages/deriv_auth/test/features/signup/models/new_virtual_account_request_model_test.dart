import 'package:deriv_auth/features/signup/models/new_virtual_account_request_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/signup_mock_data.dart';

void main() {
  group('NewVirtualAccountRequestModel', () {
    test('has concise toString.', () {
      expect(validNewVirtualAccountModel.toString(),
          'newVirtualAccountModel: verificationCode: verificationCoderesidence: residence, type: trading, utmSource: null,utmCampaign: null utmCampaignId: null,utmAdGroupId: null, utmAdId: null,utmMedium: null, utmContent: null, utmTerm: null, affiliateToken: null');
    });

    test('has valid copyWith.', () {
      final NewVirtualAccountRequestModel updatedVirtualAccountModel =
          validNewVirtualAccountModel.copyWith(
              verificationCode: 'newVerificationCode');
      expect(
          updatedVirtualAccountModel.verificationCode, 'newVerificationCode');
    });
  });
}
