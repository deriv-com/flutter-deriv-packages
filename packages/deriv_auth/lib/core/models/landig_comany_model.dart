// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_auth/core/helpers/bool_helper.dart';
import 'package:equatable/equatable.dart';

/// AllCompanyEnum mapper.
final Map<String, AllCompanyEnum> allCompanyEnumMapper =
    <String, AllCompanyEnum>{
  "svg": AllCompanyEnum.svg,
  "none": AllCompanyEnum.none,
};

/// AllCompany Enum.
enum AllCompanyEnum {
  /// svg.
  svg,

  /// none.
  none,
}

/// StandardEnum mapper.
final Map<String, StandardEnum> standardEnumMapper = <String, StandardEnum>{
  "svg": StandardEnum.svg,
  "none": StandardEnum.none,
};

/// Standard Enum.
enum StandardEnum {
  /// svg.
  svg,

  /// none.
  none,
}

/// Landing company model class.
abstract class LandingCompanyModel {
  /// Initializes Landing company model class .
  const LandingCompanyModel({
    this.derivez,
    this.financialCompany,
    this.gamingCompany,
    this.name,
  });

  /// Available DerivEZ accounts.
  final Derivez? derivez;

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final FinancialCompany? financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final GamingCompany? gamingCompany;

  /// Country name
  final String? name;
}

/// Landing company class.
class LandingCompanyEntity extends LandingCompanyModel {
  /// Initializes Landing company class.
  const LandingCompanyEntity({
    Derivez? derivez,
    FinancialCompany? financialCompany,
    GamingCompany? gamingCompany,
    String? name,
  }) : super(
          derivez: derivez,
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          name: name,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyEntity.fromJson(Map<String, dynamic> json) =>
      LandingCompanyEntity(
        derivez:
            json['derivez'] == null ? null : Derivez.fromJson(json['derivez']),
        financialCompany: json['financial_company'] == null
            ? null
            : FinancialCompany.fromJson(json['financial_company']),
        gamingCompany: json['gaming_company'] == null
            ? null
            : GamingCompany.fromJson(json['gaming_company']),
        name: json['name'],
      );

  /// Checks if CFDs are available for this landing company.
  bool get isCFDsAvailable => derivez?.all?.standard != StandardEnum.none;
}

/// Derivez model class.
abstract class DerivezModel {
  /// Initializes Derivez model class .
  const DerivezModel({
    this.all,
  });

  /// DerivEZ all account types (Synthetic Indices and Financials).
  final All? all;
}

/// Derivez class.
class Derivez extends DerivezModel {
  /// Initializes Derivez class.
  const Derivez({
    All? all,
  }) : super(
          all: all,
        );

  /// Creates an instance from JSON.
  factory Derivez.fromJson(Map<String, dynamic> json) => Derivez(
        all: json['all'] == null ? null : All.fromJson(json['all']),
      );
}

/// All model class.
abstract class AllModel {
  /// Initializes All model class .
  const AllModel({
    this.standard,
  });

  /// For standard client
  final StandardEnum? standard;
}

/// All class.
class All extends AllModel {
  /// Initializes All class.
  const All({
    StandardEnum? standard,
  }) : super(
          standard: standard,
        );

  /// Creates an instance from JSON.
  factory All.fromJson(Map<String, dynamic> json) => All(
        standard: json['standard'] == null
            ? null
            : standardEnumMapper[json['standard']],
      );
}

/// Financial company model class.
abstract class FinancialCompanyModel {
  /// Initializes Financial company model class .
  const FinancialCompanyModel({
    this.legalAllowedCurrencies,
  });

  /// Allowed account currencies for this Landing Company
  final List<String>? legalAllowedCurrencies;
}

/// Financial company class.
class FinancialCompany extends FinancialCompanyModel {
  /// Initializes Financial company class.
  const FinancialCompany({
    List<String>? legalAllowedCurrencies,
  }) : super(
          legalAllowedCurrencies: legalAllowedCurrencies,
        );

  /// Creates an instance from JSON.
  factory FinancialCompany.fromJson(Map<String, dynamic> json) =>
      FinancialCompany(
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies']?.map(
                  (dynamic item) => item,
                ),
              ),
      );
}

/// Gaming company model class.
abstract class GamingCompanyModel {
  /// Initializes Gaming company model class .
  const GamingCompanyModel({
    this.legalAllowedCurrencies,
  });

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;
}

/// Gaming company class.
class GamingCompany extends GamingCompanyModel {
  /// Initializes Gaming company class.
  const GamingCompany({
    List<String>? legalAllowedCurrencies,
  }) : super(
          legalAllowedCurrencies: legalAllowedCurrencies,
        );

  /// Creates an instance from JSON.
  factory GamingCompany.fromJson(Map<String, dynamic> json) => GamingCompany(
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies']?.map(
                  (dynamic item) => item,
                ),
              ),
      );
}
