/// Base Referral Code Service.
abstract class BaseReferralCodeService {
  /// Retrieves a token for provided [referralCode].
  Future<String> getReferralToken(String referralCode);
}
