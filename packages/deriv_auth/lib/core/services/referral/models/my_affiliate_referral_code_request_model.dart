/// `MyAffiliate` referral code request model.
class MyAffiliateReferralCodeRequestModel {
  /// Initializes [MyAffiliateReferralCodeRequestModel].
  const MyAffiliateReferralCodeRequestModel({
    required this.authToken,
    required this.brandId,
    required this.host,
    required this.feedId,
  });

  /// Auth token which will be used in basic http auth.
  final String authToken;

  /// Brand id.
  final String brandId;

  /// Request host.
  final String host;

  /// Feed id.
  final String feedId;
}
