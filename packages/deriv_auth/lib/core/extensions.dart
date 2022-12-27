import 'package:deriv_auth/core/models/account/account.dart';
import 'package:deriv_auth/core/models/authorize/authorize.dart';

/// Extensions on [AuthorizeEntity].
extension AccountExtension on AuthorizeEntity {
  /// Return list of [AccountModel] from AuthorizeEntity.
  List<AccountModel> getAccounts() =>
      accountList
          ?.map((AccountListItem accountItem) => AccountModel(
                accountId: accountItem.loginid ?? ' ',
                email: email,
                fullName: fullname,
                currency: accountItem.currency,
                userId: userId,
                token: accountItem.token,
              ))
          .toList() ??
      <AccountModel>[];

  /// Check landing company status.
  bool get isSvgAccount {
    const String svgLandingCompanyName = 'svg';

    final bool isLandingCompanySvg =
        landingCompanyName == svgLandingCompanyName;

    final bool isUpgradeableLandingCompanySvg =
        upgradeableLandingCompanies?.any((dynamic landingCompany) =>
                landingCompany == svgLandingCompanyName) ??
            false;

    final bool hasSvgCompanies = accountList?.any((AccountListItem? account) =>
            account?.landingCompanyName == svgLandingCompanyName) ??
        false;

    return isLandingCompanySvg ||
        isUpgradeableLandingCompanySvg ||
        hasSvgCompanies;
  }
}

/// Extensions on [AccountModel].
extension AccountModelExtension on AccountModel {
  /// Check if [AccountModel] is supported or not.
  bool get isSupported =>
      accountId.toUpperCase().contains('CR') ||
      accountId.toUpperCase().contains('VRTC');
}
