/// App authorization challenge response model.
class AppAuthorizationChallengeResponseModel {
  /// Initializes app authorization challenge response model.
  AppAuthorizationChallengeResponseModel({
    required this.challenge,
    required this.expire,
  });

  /// Converts the provided json to instance of this class.
  factory AppAuthorizationChallengeResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AppAuthorizationChallengeResponseModel(
        challenge: json['challenge'],
        expire: json['expire'],
      );

  /// Expire in timestamp.
  final int expire;

  /// Challenge hash.
  final String challenge;
}
