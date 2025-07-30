import 'package:deriv_auth/core/models/authorize_model.dart';

/// A model class to represent account information.
class AccountModel {
  /// Account model.
  AccountModel({
    required this.accountId,
    this.currency,
    this.token,
    this.email,
    this.fullName,
    this.userId,
    this.isDisabled = false,
    this.accountCategory,
    this.isVirtual,
  });

  /// Creates a new instance of Account from a JSON object.
  AccountModel.fromMap(Map<String, dynamic> json)
      : accountId = json['acct'],
        token = json['token'],
        currency = json['cur'],
        email = json['email'],
        fullName = json['fullName'],
        userId = json['userId'],
        isDisabled = json['isDisabled'],
        accountCategory = json['accountCategory'] == null
            ? null
            : accountCategoryEnumMapper[json['accountCategory']],
        isVirtual = json['isVirtual'];

  /// Creates a new instance of Account, parses the json in [json] and puts the data into the new instance.
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        accountId: json['acct'],
        token: json['token'],
        currency: json['cur'] ?? 'USD',
        email: json['email'],
        fullName: json['fullName'],
        userId: json['userId'],
        isDisabled: json['isDisabled'],
        accountCategory: json['accountCategory'] == null
            ? null
            : accountCategoryEnumMapper[json['accountCategory']],
        isVirtual: json['isVirtual'],
      );

  /// Login id, e.g. CR1234.
  String accountId;

  /// Auth token, suitable for use with `authorize`.
  String? token;

  /// Currency.
  String? currency;

  /// Email.
  String? email;

  /// User full name.
  String? fullName;

  /// User id.
  int? userId;

  /// Indicates if account is disabled or not.
  bool? isDisabled;

  /// Account category
  AccountCategoryEnum? accountCategory;

  /// Indicates if the account is virtual.
  bool? isVirtual;

  /// Converts an Account instance into a map.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'acct': accountId,
        'token': token,
        'cur': currency,
        'email': email,
        'fullName': fullName,
        'userId': userId,
        'isDisabled': isDisabled,
        'accountCategory': accountCategory?.name,
        'isVirtual': isVirtual,
      };
}
