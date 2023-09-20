import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

import 'package:deriv_auth/core/services/token/models/enums.dart';

/// Get tokens request model.
class GetTokensRequestModel with EquatableMixin {
  ///Initializes get tokens request model.
  GetTokensRequestModel({
    this.type,
    this.email,
    this.password,
    this.appId,
    this.otp,
    this.oneAllConnectionToken,
    this.signupProvider,
    this.state,
    this.nonce,
    this.codeVerifier,
    this.code,
    this.callbackState,
  });

  /// Type of login, it can either be `system` or `social`.
  final AuthType? type;

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

  /// Signup Provider for Social Login
  final String? signupProvider;

  /// State for Social Login
  final String? state;

  /// Nonce for Social Login
  final String? nonce;

  /// Code verifier for Social Login
  final String? codeVerifier;

  /// Code for Social Login
  final String? code;

  /// Callback state for Social Login
  final String? callbackState;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type?.name.toSnakeCase(),
        'email': email,
        'password': password,
        'app_id': appId,
        'one_time_password': otp,
        'connection_token': oneAllConnectionToken,
        'provider': signupProvider,
        'state': state,
        'nonce': nonce,
        'code_verifier': codeVerifier,
        'code': code,
        'callback_state': callbackState,
      };

  /// Generates a copy of instance with given parameters.
  GetTokensRequestModel copyWith({
    AuthType? type,
    String? email,
    String? password,
    int? appId,
    String? otp,
    String? oneAllConnectionToken,
    String? signupProvider,
    String? state,
    String? nonce,
    String? codeVerifier,
    String? code,
    String? callbackState,
  }) =>
      GetTokensRequestModel(
        type: type ?? this.type,
        email: email ?? this.email,
        password: password ?? this.password,
        appId: appId ?? this.appId,
        otp: otp ?? this.otp,
        oneAllConnectionToken:
            oneAllConnectionToken ?? this.oneAllConnectionToken,
        signupProvider: signupProvider ?? this.signupProvider,
        state: state ?? this.state,
        nonce: nonce ?? this.nonce,
        codeVerifier: codeVerifier ?? this.codeVerifier,
        code: code ?? this.code,
        callbackState: callbackState ?? this.callbackState,
      );

  @override
  List<Object?> get props => <Object?>[
        type,
        email,
        password,
        appId,
        otp,
        oneAllConnectionToken,
        signupProvider,
        state,
        nonce,
        codeVerifier,
        code,
        callbackState,
      ];
}
