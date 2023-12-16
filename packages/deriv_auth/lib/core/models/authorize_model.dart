import 'package:deriv_auth/core/helpers/bool_helper.dart';
import 'package:deriv_auth/core/helpers/date_time_helper.dart';
import 'package:deriv_auth/core/helpers/number_helper.dart';

/// Authorize response model class.
abstract class AuthorizeResponseEntityModel {
  /// Initializes Authorize response model class .
  const AuthorizeResponseEntityModel({
    this.authorize,
  });

  /// Account information for the holder of the token.
  final AuthorizeEntity? authorize;
}

/// Authorize response class.
class AuthorizeResponseEntity extends AuthorizeResponseEntityModel {
  /// Initializes Authorize response class.
  const AuthorizeResponseEntity({
    AuthorizeEntity? authorize,
  }) : super(
          authorize: authorize,
        );

  /// Creates an instance from JSON.
  factory AuthorizeResponseEntity.fromJson(
    dynamic authorizeJson,
  ) =>
      AuthorizeResponseEntity(
        authorize: authorizeJson == null
            ? null
            : AuthorizeEntity.fromJson(authorizeJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (authorize != null) {
      resultMap['authorize'] = authorize!.toJson();
    }

    return resultMap;
  }

  // static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  ///
  /// For parameters information refer to [AuthorizeRequest].
  /// Throws an [AuthorizeException] if API response contains an error
  // static Future<AuthorizeResponseEntity> authorizeMethod(
  //     AuthorizeRequest request) async {
  //   final AuthorizeReceive response = await _api.call(
  //     request: request,
  //   );

  //   checkException(
  //     response: response,
  //     exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
  //         AuthorizeException(baseExceptionModel: baseExceptionModel),
  //   );

  //   return AuthorizeResponseEntity.fromJson(response.authorize);
  // }

  /// Creates a copy of instance with given parameters.
  AuthorizeResponseEntity copyWith({
    AuthorizeEntity? authorize,
  }) =>
      AuthorizeResponseEntity(
        authorize: authorize ?? this.authorize,
      );
}

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  'derivez': PlatformEnum.derivez,
  'dtrade': PlatformEnum.dtrade,
  'dwallet': PlatformEnum.dwallet,
  'dxtrade': PlatformEnum.dxtrade,
  'mt5': PlatformEnum.mt5,
};

/// Platform Enum indicating the account is on which platform.
enum PlatformEnum {
  /// derivez.
  derivez,

  /// dtrade.
  dtrade,

  /// dwallet.
  dwallet,

  /// dxtrade.
  dxtrade,

  /// mt5.
  mt5,
}

/// A map from account categories strings to their corresponding enum class.
const Map<String, AccountCategoryEnum> accountCategoryEnumMapper =
    <String, AccountCategoryEnum>{
  'wallet': AccountCategoryEnum.wallet,
  'trading': AccountCategoryEnum.trading,
};

/// Account categories which are defined after migrating to wallet feature.
enum AccountCategoryEnum {
  /// The account is a wallet.
  wallet,

  /// The account is a trading account.
  trading,
}

/// Authorize model class.
abstract class AuthorizeModel {
  /// Initializes Authorize model class .
  const AuthorizeModel({
    this.accountList,
    this.balance,
    this.country,
    this.currency,
    this.email,
    this.fullname,
    this.isVirtual,
    this.landingCompanyFullname,
    this.landingCompanyName,
    this.linkedTo,
    this.localCurrencies,
    this.loginid,
    this.preferredLanguage,
    this.scopes,
    this.upgradeableLandingCompanies,
    this.userId,
    this.signupProvider,
    this.refreshToken,
  });

  /// List of accounts for current user.
  final List<AccountListItem>? accountList;

  /// Cash balance of the account.
  final double? balance;

  /// 2-letter country code (ISO standard).
  final String? country;

  /// Currency of the account.
  final String? currency;

  /// User email.
  final String? email;

  /// User's full name. Will be empty for virtual accounts.
  final String? fullname;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool? isVirtual;

  /// Landing company name the account belongs to.
  final String? landingCompanyFullname;

  /// Landing company shortcode the account belongs to.
  final String? landingCompanyName;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<LinkedToItem>? linkedTo;

  /// Currencies in client's residence country
  final Map<String, LocalCurrenciesPropertyEntity>? localCurrencies;

  /// The account ID that the token was issued for.
  final String? loginid;

  /// User's preferred language, ISO standard code of language
  final String? preferredLanguage;

  /// Scopes available to the token.
  final List<String>? scopes;

  /// List of landing company shortcodes the account can upgrade to.
  final List<dynamic>? upgradeableLandingCompanies;

  /// The internal user ID for this account.
  final int? userId;

  /// Signup Provider for Social Login
  final String? signupProvider;

  /// Refresh token from login response.
  final String? refreshToken;
}

/// Authorize class.
class AuthorizeEntity extends AuthorizeModel {
  /// Initializes Authorize class.
  const AuthorizeEntity({
    List<AccountListItem>? accountList,
    double? balance,
    String? country,
    String? currency,
    String? email,
    String? fullname,
    bool? isVirtual,
    String? landingCompanyFullname,
    String? landingCompanyName,
    List<LinkedToItem>? linkedTo,
    Map<String, LocalCurrenciesPropertyEntity>? localCurrencies,
    String? loginid,
    String? preferredLanguage,
    List<String>? scopes,
    List<dynamic>? upgradeableLandingCompanies,
    int? userId,
    String? signupProvider,
    String? refreshToken,
  }) : super(
          accountList: accountList,
          balance: balance,
          country: country,
          currency: currency,
          email: email,
          fullname: fullname,
          isVirtual: isVirtual,
          landingCompanyFullname: landingCompanyFullname,
          landingCompanyName: landingCompanyName,
          linkedTo: linkedTo,
          localCurrencies: localCurrencies,
          loginid: loginid,
          preferredLanguage: preferredLanguage,
          scopes: scopes,
          upgradeableLandingCompanies: upgradeableLandingCompanies,
          userId: userId,
          signupProvider: signupProvider,
          refreshToken: refreshToken,
        );

  /// Creates an instance from JSON.
  factory AuthorizeEntity.fromJson(Map<String, dynamic> json) =>
      AuthorizeEntity(
        accountList: json['account_list'] == null
            ? null
            : List<AccountListItem>.from(
                json['account_list']?.map(
                  (dynamic item) => AccountListItem.fromJson(item),
                ),
              ),
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullname: json['fullname'],
        isVirtual: getBool(json['is_virtual']),
        landingCompanyFullname: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<LinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => LinkedToItem.fromJson(item),
                ),
              ),
        // TODOAuth(): fromjson(.tojson) wont work for localCurrencies .
        // fast fix: localCurrencies: json['local_currencies'] == null
        localCurrencies: json['local_currencies'] == null
            ? null
            : Map<String, LocalCurrenciesPropertyEntity>.fromEntries(
                json['local_currencies']
                    .entries
                    .map<MapEntry<String, LocalCurrenciesPropertyEntity>>(
                      (MapEntry<String, dynamic> entry) =>
                          MapEntry<String, LocalCurrenciesPropertyEntity>(
                        entry.key,
                        LocalCurrenciesPropertyEntity.fromJson(entry.value),
                      ),
                    ),
              ),
        loginid: json['loginid'],
        preferredLanguage: json['preferred_language'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(
                json['scopes']?.map(
                  (dynamic item) => item,
                ),
              ),
        upgradeableLandingCompanies:
            json['upgradeable_landing_companies'] == null
                ? null
                : List<dynamic>.from(
                    json['upgradeable_landing_companies']?.map(
                      (dynamic item) => item,
                    ),
                  ),
        userId: json['user_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (accountList != null) {
      resultMap['account_list'] = accountList!
          .map<dynamic>(
            (AccountListItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['balance'] = balance;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['fullname'] = fullname;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_fullname'] = landingCompanyFullname;
    resultMap['landing_company_name'] = landingCompanyName;
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (LinkedToItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['local_currencies'] = localCurrencies;
    resultMap['loginid'] = loginid;
    resultMap['preferred_language'] = preferredLanguage;
    if (scopes != null) {
      resultMap['scopes'] = scopes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (upgradeableLandingCompanies != null) {
      resultMap['upgradeable_landing_companies'] = upgradeableLandingCompanies!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuthorizeEntity copyWith({
    List<AccountListItem>? accountList,
    double? balance,
    String? country,
    String? currency,
    String? email,
    String? fullname,
    bool? isVirtual,
    String? landingCompanyFullname,
    String? landingCompanyName,
    List<LinkedToItem>? linkedTo,
    Map<String, LocalCurrenciesPropertyEntity>? localCurrencies,
    String? loginid,
    String? preferredLanguage,
    List<String>? scopes,
    List<dynamic>? upgradeableLandingCompanies,
    int? userId,
    String? signupProvider,
    String? refreshToken,
  }) =>
      AuthorizeEntity(
        accountList: accountList ?? this.accountList,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        fullname: fullname ?? this.fullname,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyFullname:
            landingCompanyFullname ?? this.landingCompanyFullname,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        linkedTo: linkedTo ?? this.linkedTo,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        loginid: loginid ?? this.loginid,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        scopes: scopes ?? this.scopes,
        upgradeableLandingCompanies:
            upgradeableLandingCompanies ?? this.upgradeableLandingCompanies,
        userId: userId ?? this.userId,
        signupProvider: signupProvider ?? this.signupProvider,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}

/// Account list item model class.
abstract class AccountListItemModel {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    this.accountCategory,
    this.accountType,
    this.createdAt,
    this.currency,
    this.excludedUntil,
    this.isDisabled,
    this.isVirtual,
    this.landingCompanyName,
    this.linkedTo,
    this.loginid,
    this.token,
  });

  /// Account category.
  final AccountCategoryEnum? accountCategory;

  /// Account type.
  final String? accountType;

  /// Creation time of the account as epoch.
  final DateTime? createdAt;

  /// Currency of specified account.
  final String? currency;

  /// Epoch of date till client has excluded him/herself from the website, only present if client is self excluded.
  final DateTime? excludedUntil;

  /// Boolean value: `true` or `false`, indicating whether the account is marked as disabled or not.
  final bool? isDisabled;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool? isVirtual;

  /// Landing company shortcode the account belongs to.
  final String? landingCompanyName;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<LinkedToItem>? linkedTo;

  /// The account ID of specified account.
  final String? loginid;

  /// Saved account token.
  final String? token;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    super.accountCategory,
    super.accountType,
    super.createdAt,
    super.currency,
    super.excludedUntil,
    super.isDisabled,
    super.isVirtual,
    super.landingCompanyName,
    super.linkedTo,
    super.loginid,
    super.token,
  });

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountCategory: json['account_category'] == null
            ? null
            : accountCategoryEnumMapper[json['account_category']],
        accountType: json['account_type'],
        createdAt: getDateTime(json['created_at']),
        currency: json['currency'],
        excludedUntil: getDateTime(json['excluded_until']),
        isDisabled: getBool(json['is_disabled']),
        isVirtual: getBool(json['is_virtual']),
        landingCompanyName: json['landing_company_name'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<LinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => LinkedToItem.fromJson(item),
                ),
              ),
        loginid: json['loginid'],
        token: json['token'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = accountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, AccountCategoryEnum> entry) =>
            entry.value == accountCategory)
        .key;
    resultMap['account_type'] = accountType;
    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['currency'] = currency;
    resultMap['excluded_until'] = getSecondsSinceEpochDateTime(excludedUntil);
    resultMap['is_disabled'] = isDisabled;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_name'] = landingCompanyName;
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (LinkedToItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['loginid'] = loginid;
    resultMap['token'] = token;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountCategoryEnum? accountCategory,
    String? accountType,
    DateTime? createdAt,
    String? currency,
    DateTime? excludedUntil,
    bool? isDisabled,
    bool? isVirtual,
    String? landingCompanyName,
    List<LinkedToItem>? linkedTo,
    String? loginid,
    String? token,
  }) =>
      AccountListItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        createdAt: createdAt ?? this.createdAt,
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        linkedTo: linkedTo ?? this.linkedTo,
        loginid: loginid ?? this.loginid,
        token: token ?? this.token,
      );
}

/// Linked to item model class.
abstract class LinkedToItemModel {
  /// Initializes Linked to item model class .
  const LinkedToItemModel({
    this.loginid,
    this.platform,
  });

  /// Account ID.
  final String? loginid;

  /// Account platform name.
  final PlatformEnum? platform;
}

/// Linked to item class.
class LinkedToItem extends LinkedToItemModel {
  /// Initializes Linked to item class.
  const LinkedToItem({
    super.loginid,
    super.platform,
  });

  /// Creates an instance from JSON.
  factory LinkedToItem.fromJson(Map<String, dynamic> json) => LinkedToItem(
        loginid: json['loginid'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkedToItem copyWith({
    String? loginid,
    PlatformEnum? platform,
  }) =>
      LinkedToItem(
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
      );
}

/// Local currencies property model class.
abstract class LocalCurrenciesPropertyModel {
  /// Initializes Local currencies property model class .
  const LocalCurrenciesPropertyModel({
    required this.fractionalDigits,
  });

  /// Number of fractional digits.
  final int fractionalDigits;
}

/// Local currencies property class.
class LocalCurrenciesPropertyEntity extends LocalCurrenciesPropertyModel {
  /// Initializes Local currencies property class.
  const LocalCurrenciesPropertyEntity({
    required int fractionalDigits,
  }) : super(
          fractionalDigits: fractionalDigits,
        );

  /// Creates an instance from JSON.
  factory LocalCurrenciesPropertyEntity.fromJson(Map<String, dynamic> json) =>
      LocalCurrenciesPropertyEntity(
        fractionalDigits: json['fractional_digits'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LocalCurrenciesPropertyEntity copyWith({
    int? fractionalDigits,
  }) =>
      LocalCurrenciesPropertyEntity(
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
      );
}

/// Authorize trading model class.
abstract class AuthorizeTradingModel {
  /// Initializes Authorize trading model class .
  const AuthorizeTradingModel({
    this.linkedTo,
  });

  /// Details of the Wallet account linked to the Trading account.
  final List<TradingLinkedToItem>? linkedTo;
}

/// Trading linked to item model class.
abstract class TradingLinkedToItemModel {
  /// Initializes Trading linked to item model class .
  const TradingLinkedToItemModel({
    this.accountId,
    this.balance,
    this.currency,
    this.paymentMethod,
  });

  /// Wallet account ID.
  final String? accountId;

  /// Wallet account balance.
  final String? balance;

  /// Wallet account currency.
  final String? currency;

  /// Wallet account payment method.
  final String? paymentMethod;
}

/// Trading linked to item class.
class TradingLinkedToItem extends TradingLinkedToItemModel {
  /// Initializes Trading linked to item class.
  const TradingLinkedToItem({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory TradingLinkedToItem.fromJson(Map<String, dynamic> json) =>
      TradingLinkedToItem(
        accountId: json['account_id'],
        balance: json['balance'],
        currency: json['currency'],
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingLinkedToItem copyWith({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) =>
      TradingLinkedToItem(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}

/// Wallet linked to item2 model class.
abstract class WalletLinkedToItem2Model {
  /// Initializes Wallet linked to item2 model class .
  const WalletLinkedToItem2Model({
    this.accountId,
    this.balance,
    this.currency,
    this.platform,
  });

  /// Trading account ID.
  final String? accountId;

  /// Trading account balance.
  final String? balance;

  /// Trading account currency.
  final String? currency;

  /// Trading account platform name.
  final PlatformEnum? platform;
}
