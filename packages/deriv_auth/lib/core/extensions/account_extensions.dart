import 'dart:developer' as dev;

import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:flutter_deriv_api/api/response/landing_company_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

/// Extensions on [AuthorizeEntity].
extension AccountExtension on AuthorizeEntity {
  /// Returns list of [AccountModel].
  List<AccountModel> get accounts =>
      accountList
          ?.map((AccountListItem accountItem) => AccountModel(
                accountId: accountItem.loginid ?? ' ',
                email: email,
                fullName: fullname,
                currency: accountItem.currency,
                userId: userId,
                token: accountItem.token,
                accountCategory: accountItem.accountCategory,
                isVirtual: accountItem.isVirtual ?? false,
              ))
          .toList() ??
      <AccountModel>[];

  /// Checks if the account is associated with SVG (St. Vincent & Grenadines)
  /// landing company.
  ///
  /// This method checks multiple sources to determine if the account is under
  /// SVG:
  ///   1. First checks if the current landing company name is SVG
  ///   2. Then checks if any of the user's accounts are under SVG
  ///   3. Finally makes `landing_company` API call to check if the user's
  ///   country has SVG as a landing company option
  ///     - Primarily checks the financial company's shortcode
  ///     - Falls back to checking the gaming company's shortcode if financial
  ///       company is null
  ///
  /// Returns `true` if the account is associated with SVG, `false` otherwise.
  Future<bool> get isSvgAccount async {
    const String svgLandingCompanyName = 'svg';

    // Check if current landing company is SVG
    if (landingCompanyName == svgLandingCompanyName) {
      return true;
    }

    // Check if any of the user's accounts are under SVG
    final bool hasSvgCompanies = accountList?.any(
          (AccountListItem? account) =>
              account?.landingCompanyName?.trim().toLowerCase() ==
              svgLandingCompanyName,
        ) ??
        false;

    if (hasSvgCompanies) {
      return true;
    }

    // Make API call to check if user's country has SVG as an option
    try {
      final LandingCompanyResponse landingCompanyResponse =
          await LandingCompanyResponse.fetchLandingCompanies(
        LandingCompanyRequest(landingCompany: country),
      );

      // Return false if landing company data is null
      if (landingCompanyResponse.landingCompany == null) {
        return false;
      }

      // First check financial company (primary check)
      final FinancialCompany? financialCompany =
          landingCompanyResponse.landingCompany?.financialCompany;
      if (financialCompany != null &&
          financialCompany.shortcode?.trim().toLowerCase() ==
              svgLandingCompanyName) {
        return true;
      }

      // Fallback: check gaming company only if financial company is null or
      // its shortcode isn't svg
      final GamingCompany? gamingCompany =
          landingCompanyResponse.landingCompany?.gamingCompany;
      if (gamingCompany != null &&
          gamingCompany.shortcode?.trim().toLowerCase() ==
              svgLandingCompanyName) {
        return true;
      }

      return false;
    } on Exception catch (e) {
      dev.log('Error checking SVG account status: $e');
      return false;
    }
  }
}
