/// DerivAuthUtmModel
class DerivAuthUtmModel {
  /// Initialize [DerivAuthUtmModel]
  DerivAuthUtmModel({
    this.utmSource,
    this.utmCampaign,
    this.utmCampaignId,
    this.utmAdGroupId,
    this.utmAdId,
    this.utmMedium,
    this.utmContent,
    this.utmTerm,
    this.affiliateToken,
  });

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

  /// Creates new copy of this object.
  DerivAuthUtmModel copyWith({
    String? utmSource,
    String? utmTerm,
    String? utmContent,
    String? affiliateToken,
    String? utmMedium,
    String? utmAdId,
    String? utmAdGroupId,
    String? utmCampaignId,
    String? utmCampaign,
  }) =>
      DerivAuthUtmModel(
        affiliateToken: affiliateToken ?? this.affiliateToken,
        utmCampaign: utmCampaign ?? this.utmCampaign,
        utmCampaignId: utmCampaignId ?? this.utmCampaignId,
        utmSource: utmSource ?? this.utmSource,
        utmAdId: utmAdId ?? this.utmAdId,
        utmTerm: utmTerm ?? this.utmTerm,
        utmContent: utmContent ?? this.utmContent,
        utmMedium: utmMedium ?? this.utmMedium,
        utmAdGroupId: utmAdGroupId ?? this.utmAdGroupId,
      );
}
