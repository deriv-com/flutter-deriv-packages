/// Pass-through login response model.
class PTALoginResponseModel {
  /// Initializes Pass-through login response model.
  PTALoginResponseModel({required this.token});

  /// Converts the provided json to instance of this class.
  factory PTALoginResponseModel.fromJson(Map<String, dynamic> json) =>
      PTALoginResponseModel(token: json['one_time_token']);

  /// One-time access token.
  final String token;
}
