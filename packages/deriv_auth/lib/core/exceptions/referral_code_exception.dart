/// Referral code exception.
class ReferralCodeException implements Exception {
  /// Initializes [ReferralCodeException].
  ReferralCodeException(this.message);

  /// Exception message.
  final String message;

  @override
  String toString() => message;
}
