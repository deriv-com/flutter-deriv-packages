import 'package:deriv_auth/core/services/referral/base_referral_code_service.dart';

/// Referral repository
class ReferralRepository implements BaseReferralCodeService {
  @override
  Future<String> getReferralToken(String referralCode) =>
      Future<String>.value('${referralCode}Token');
}
