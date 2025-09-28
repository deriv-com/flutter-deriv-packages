import 'package:collection/collection.dart';

import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:equatable/equatable.dart';

/// Get tokens response model that handles both login and signup responses.
///
/// Login Response Format example:
/// ```json
/// {
///   "tokens": [...],
///   "refresh_token": "...",
///   "social_type": "login"
/// }
/// ```
///
/// ```json
/// {
///   "signup_code": "...",
///   "social_type": "signup"
/// }
/// ```
class GetTokensResponseModel extends Equatable {
  /// Initializes get tokens response model.
  const GetTokensResponseModel({
    this.tokens,
    this.refreshToken,
    this.socialType,
    this.signupCode,
  });

  /// Converts the provided json to instance of this class.
  factory GetTokensResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      final SocialAuthType? socialType =
          getSocialTypeByName(json['social_type'] as String?);

      return GetTokensResponseModel(
        tokens: _parseTokens(json['tokens']),
        refreshToken: json['refresh_token'] as String?,
        socialType: socialType,
        signupCode: json['signup_code'] as String?,
      );
    } catch (e) {
      throw FormatException(
        'Failed to parse GetTokensResponseModel from JSON: $e\n'
        'JSON: $json',
      );
    }
  }

  /// List of available tokens for logged in user.
  /// Only present in login responses.
  final List<Token>? tokens;

  /// Refresh token for the user session.
  /// Only present in login responses.
  final String? refreshToken;

  /// Social type indicating whether this is a login or signup response.
  final SocialAuthType? socialType;

  /// Signup code for social signup flow.
  /// Only present in signup responses when user needs to complete registration.
  final String? signupCode;

  /// Returns true if this is a login response (contains tokens).
  bool get isLoginResponse => tokens != null && tokens!.isNotEmpty;

  /// Returns true if this is an incomplete social signup
  /// response(contains signup code).
  /// This means the user has initiated a social signup but needs to complete
  /// the signup process with additional steps/details.
  bool get isIncompleteSocialSignupResponse =>
      socialType == SocialAuthType.signup &&
      signupCode != null &&
      signupCode!.isNotEmpty;

  /// Returns true if this response is valid.
  bool get isValid => isLoginResponse || isIncompleteSocialSignupResponse;

  /// List of accounts that belong to this user.
  /// Only available for login responses.
  List<AccountModel> get accounts {
    if (!isLoginResponse) {
      return <AccountModel>[];
    }

    return tokens!
        .map<AccountModel>(
          (Token token) => AccountModel(
            accountId: token.loginid,
            token: token.token,
          ),
        )
        .toList();
  }

  /// Converts this model to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        if (tokens != null)
          'tokens': tokens!.map((Token token) => token.toJson()).toList(),
        if (refreshToken != null) 'refresh_token': refreshToken,
        if (socialType != null) 'social_type': socialType!.name,
        if (signupCode != null) 'signup_code': signupCode,
      };

  /// Creates a copy of this model with the given fields replaced.
  GetTokensResponseModel copyWith({
    List<Token>? tokens,
    String? refreshToken,
    SocialAuthType? socialType,
    String? signupCode,
  }) =>
      GetTokensResponseModel(
        tokens: tokens ?? this.tokens,
        refreshToken: refreshToken ?? this.refreshToken,
        socialType: socialType ?? this.socialType,
        signupCode: signupCode ?? this.signupCode,
      );

  /// Helper method to parse tokens from JSON.
  static List<Token>? _parseTokens(dynamic tokensJson) {
    if (tokensJson == null) {
      return null;
    }

    if (tokensJson is! List) {
      throw FormatException(
          'Expected tokens to be a List, got ${tokensJson.runtimeType}');
    }

    return tokensJson.map<Token>((dynamic item) {
      if (item is! Map<String, dynamic>) {
        throw FormatException(
          'Expected token item to be a Map, got ${item.runtimeType}',
        );
      }
      return Token.fromJson(item);
    }).toList();
  }

  @override
  List<Object?> get props => <Object?>[
        tokens,
        refreshToken,
        socialType,
        signupCode,
      ];
}

/// Token Model representing a user's account token.
class Token extends Equatable {
  /// Initializes token model.
  const Token({
    required this.loginid,
    required this.token,
  });

  /// Converts the provided json to instance of this class.
  factory Token.fromJson(Map<String, dynamic> json) {
    final String? loginid = json['loginid'] as String?;
    final String? token = json['token'] as String?;

    if (loginid == null || loginid.isEmpty) {
      throw const FormatException(
        'Token loginid is required and cannot be empty',
      );
    }

    if (token == null || token.isEmpty) {
      throw const FormatException(
        'Token value is required and cannot be empty',
      );
    }

    return Token(
      loginid: loginid,
      token: token,
    );
  }

  /// Login id of the account.
  final String loginid;

  /// Authentication token for the account.
  final String token;

  /// Converts this token to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'token': token,
      };

  /// Creates a copy of this token with the given fields replaced.
  Token copyWith({
    String? loginid,
    String? token,
  }) =>
      Token(
        loginid: loginid ?? this.loginid,
        token: token ?? this.token,
      );

  @override
  List<Object?> get props => <Object?>[loginid, token];
}

/// Returns [SocialAuthType] from string value.
SocialAuthType? getSocialTypeByName(String? socialType) {
  if (socialType == null || socialType.isEmpty) {
    return null;
  }

  return SocialAuthType.values.firstWhereOrNull(
    (SocialAuthType element) => element.name == socialType,
  );
}
