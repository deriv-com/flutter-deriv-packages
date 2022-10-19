import 'enums.dart';

/// Login request model.
class LoginRequestModel {
  ///Initializes Login request model.
  LoginRequestModel({
    this.type,
    this.email,
    this.password,
    this.appId,
    this.otp,
    this.oneAllConnectionToken,
  });

  /// Type of login, it can either be `system` or `social`.
  final LoginType? type;

  /// Email address
  final String? email;

  /// Password
  final String? password;

  /// Application id
  final int? appId;

  /// Two-factor-authentication code.
  final String? otp;

  /// One-All connection token.
  final String? oneAllConnectionToken;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type?.name,
        'email': email,
        'password': password,
        'app_id': appId,
        'one_time_password': otp,
        'connection_token': oneAllConnectionToken,
      };

  /// Generates a copy of instance with given parameters.
  LoginRequestModel copyWith({
    LoginType? type,
    String? email,
    String? password,
    int? appId,
    String? otp,
    String? oneAllConnectionToken,
  }) =>
      LoginRequestModel(
        type: type ?? this.type,
        email: email ?? this.email,
        password: password ?? this.password,
        appId: appId ?? this.appId,
        otp: otp ?? this.otp,
        oneAllConnectionToken:
            oneAllConnectionToken ?? this.oneAllConnectionToken,
      );
}
