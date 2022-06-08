///App authorization response model.
class AppAuthorizationResponseModel {
  /// Initializes app authorization response model.
  AppAuthorizationResponseModel({required this.token});

  /// Converts the provided json to instance of this class.
  factory AppAuthorizationResponseModel.fromJson(Map<String, dynamic> json) =>
      AppAuthorizationResponseModel(token: json['token']);

  /// JWT token.
  final String token;
}
