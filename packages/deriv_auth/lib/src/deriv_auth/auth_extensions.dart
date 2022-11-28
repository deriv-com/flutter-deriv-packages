import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/models/account/account.dart';

extension AccountModelExtension on AccountModel {
  bool get isSupported =>
      accountId.toUpperCase().contains('CR') ||
      accountId.toUpperCase().contains('VRTC');
}

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
