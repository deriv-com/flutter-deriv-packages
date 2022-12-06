import '../../../deriv_auth.dart';

///
extension AccountListItemFormatter on AuthorizeEntity {
  List<AccountModel> getAccounts() => accountList!
      .map((AccountListItem accountItem) => AccountModel(
            accountId: accountItem.loginid ?? ' ',
            email: email,
            fullName: fullname,
            currency: accountItem.currency,
            userId: userId,
            token: accountItem.token,
          ))
      .toList();
}

///
extension AccountModelExtension on AccountModel {
  bool get isSupported =>
      accountId.toUpperCase().contains('CR') ||
      accountId.toUpperCase().contains('VRTC');
}

///
extension AuthorizeEntityExtension on AuthorizeEntity {
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
