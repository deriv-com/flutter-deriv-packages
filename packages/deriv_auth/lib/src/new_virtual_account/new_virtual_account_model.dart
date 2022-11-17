
import 'package:deriv_auth/src/core/helpers/number_helper.dart';

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "trading": TypeEnum.trading,
  "wallet": TypeEnum.wallet,
};

/// Type Enum.
enum TypeEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}
/// New account virtual model class.
abstract class NewAccountVirtualModel {
  /// Initializes New account virtual model class .
  const NewAccountVirtualModel({
    required this.oauthToken,
    required this.email,
    required this.currency,
    required this.clientId,
    required this.balance,
    this.refreshToken,
    this.type,
  });

  /// Oauth token for the client's login session (so that the user may be logged in immediately)
  final String oauthToken;

  /// Email of the new virtual-money account
  final String email;

  /// Account currency
  final String currency;

  /// ID of the new virtual-money account
  final String clientId;

  /// Account balance
  final double balance;

  /// Refresh token to perform PTA, only for the first ever created account
  final String? refreshToken;

  /// Account type
  final TypeEnum? type;
}

/// New account virtual class.
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes New account virtual class.
  const NewAccountVirtual({
    required double balance,
    required String clientId,
    required String currency,
    required String email,
    required String oauthToken,
    String? refreshToken,
    TypeEnum? type,
  }) : super(
          balance: balance,
          clientId: clientId,
          currency: currency,
          email: email,
          oauthToken: oauthToken,
          refreshToken: refreshToken,
          type: type,
        );

  /// Creates an instance from JSON.
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: getDouble(json['balance'])!,
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
        refreshToken: json['refresh_token'],
        type: json['type'] == null ? null : typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['client_id'] = clientId;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['oauth_token'] = oauthToken;
    resultMap['refresh_token'] = refreshToken;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountVirtual copyWith({
    double? balance,
    String? clientId,
    String? currency,
    String? email,
    String? oauthToken,
    String? refreshToken,
    TypeEnum? type,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
        refreshToken: refreshToken ?? this.refreshToken,
        type: type ?? this.type,
      );
}
