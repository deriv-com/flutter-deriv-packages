/// A model that holds new virtual account signUp request data.
class NewVirtualAccountRequestModel {
  /// Initializes NewVirtualAccountModel.
  const NewVirtualAccountRequestModel({
    required this.verificationCode,
    required this.clientPassword,
    required this.residence,
    this.type = 'dynamic',
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

  /// SignUp verificationCode
  final String verificationCode;

  /// SignUp clientPassword
  final String clientPassword;

  /// SignUp residence
  final String residence;

  /// SignUp type
  final String type;

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

  /// Generates a copy of instance with given parameters
  NewVirtualAccountRequestModel copyWith({
    String? verificationCode,
    String? clientPassword,
    String? residence,
    String? type,
    String? utmSource,
    String? utmCampaign,
    String? utmCampaignId,
    String? utmAdGroupId,
    String? utmAdId,
    String? utmMedium,
    String? utmContent,
    String? utmTerm,
    String? affiliateToken,
  }) =>
      NewVirtualAccountRequestModel(
        verificationCode: verificationCode ?? this.verificationCode,
        clientPassword: clientPassword ?? this.clientPassword,
        residence: residence ?? this.residence,
        type: type ?? this.type,
        utmSource: utmSource ?? this.utmSource,
        utmCampaign: utmCampaign ?? this.utmCampaign,
        utmCampaignId: utmCampaignId ?? this.utmCampaignId,
        utmAdGroupId: utmAdGroupId ?? this.utmAdGroupId,
        utmAdId: utmAdId ?? this.utmAdId,
        utmMedium: utmMedium ?? this.utmMedium,
        utmContent: utmContent ?? this.utmContent,
        utmTerm: utmTerm ?? this.utmTerm,
        affiliateToken: affiliateToken ?? this.affiliateToken,
      );

  @override
  String toString() =>
      'newVirtualAccountModel: verificationCode: $verificationCode'
      'residence: $residence, type: $type, utmSource: $utmSource,'
      'utmCampaign: $utmCampaign utmCampaignId: $utmCampaignId,'
      'utmAdGroupId: $utmAdGroupId, utmAdId: $utmAdId,'
      'utmMedium: $utmMedium, utmContent: $utmContent, '
      'utmTerm: $utmTerm, affiliateToken: $affiliateToken';
}
