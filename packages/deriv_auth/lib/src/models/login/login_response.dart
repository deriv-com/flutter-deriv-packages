import 'package:collection/collection.dart';
import 'package:deriv_auth/src/models/account/account.dart';

import 'enums.dart';

/// Login response model.
class LoginResponseModel {
  /// Initializes login response model.
  LoginResponseModel({
    required this.tokens,
    required this.refreshToken,
    required this.socialType,
  });

  /// Converts the provided json to instance of this class.
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        tokens: getListFromMap<Token>(
          json['tokens'],
          itemToTypeCallback: (dynamic item) => Token.fromJson(item),
        ),
        refreshToken: json['refresh_token'],
        socialType: getSocialTypeByName(json['social_type']),
      );

  /// List of available tokens for logged in user.
  final List<Token?>? tokens;

  /// Refresh token.
  final String refreshToken;

  /// Social type to be `login`, `signup` or `null`.
  final SocialType? socialType;

  /// List of accounts that belong to this user.
  List<AccountModel> get accounts =>
      tokens
          ?.whereNotNull()
          .map<AccountModel>(
            (Token token) =>
                AccountModel(accountId: token.loginid, token: token.token),
          )
          .toList() ??
      [];
}

/// Token Model
class Token {
  /// Initializes token model.
  Token({required this.loginid, required this.token});

  /// Converts the provided json to instance of this class.
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        loginid: json['loginid'],
        token: json['token'],
      );

  /// Login id of logged in user.
  final String loginid;

  /// Token of logged in user.
  final String token;
}

/// Gets a list of models from a map
List<T?>? getListFromMap<T>(
  Iterable<dynamic>? mapList, {
  T Function(dynamic item)? itemToTypeCallback,
}) =>
    mapList == null || mapList.isEmpty
        ? null
        : mapList
            .map<T?>(
              (dynamic item) =>
                  itemToTypeCallback == null ? item : itemToTypeCallback(item),
            )
            .toList();

/// Gets a model from a map
T? getItemFromMap<T>(
  Map<String, dynamic>? map, {
  T Function(dynamic item)? itemToTypeCallback,
}) =>
    map == null ? null : itemToTypeCallback!(map);

/// Returns [SocialType] from string
SocialType? getSocialTypeByName(String? socialType) => SocialType.values
    .firstWhereOrNull((SocialType element) => socialType == element.name);
