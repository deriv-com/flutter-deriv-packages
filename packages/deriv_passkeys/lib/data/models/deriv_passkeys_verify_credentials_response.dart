final class DerivPasskeysVerifyCredentialsResponse {
  final bool success;

  DerivPasskeysVerifyCredentialsResponse({
    required this.success,
  });

  factory DerivPasskeysVerifyCredentialsResponse.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysVerifyCredentialsResponse(
        success: json['success'] as bool,
      );
}
