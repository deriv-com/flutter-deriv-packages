import 'package:deriv_auth/core/services/referral/base_referral_code_service.dart';

class ExampleReferralRepository implements BaseReferralCodeService {
  @override
  Future<String> getReferralToken(String referralCode) =>
      Future.value('${referralCode}Token');
}
