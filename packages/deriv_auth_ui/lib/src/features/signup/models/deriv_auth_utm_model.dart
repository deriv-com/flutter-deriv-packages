/// DerivAuthUtmModel
class DerivAuthUtmModel {
  /// Initialize [DerivAuthUtmModel]
  DerivAuthUtmModel(
    this.utmSource,
    this.utmCampaign,
    this.utmCampaignId,
    this.utmAdGroupId,
    this.utmAdId,
    this.utmMedium,
    this.utmContent,
    this.utmTerm,
    this.affiliateToken,
  );

  /// SignUp utmSource
  final String? utmSource;

  /// SignUp utmCampaign
  final String? utmCampaign;

  /// SignUp utmCampaignId
  final String? utmCampaignId;

  /// SignUp utmAdGroupId
  final String? utmAdGroupId;

  /// SignUp utmAdId
  final String? utmAdId;

  /// SignUp utmMedium
  final String? utmMedium;

  /// SignUp utmContent
  final String? utmContent;

  /// SignUp utmTerm
  final String? utmTerm;

  /// SignUp affiliateToken
  final String? affiliateToken;
}
