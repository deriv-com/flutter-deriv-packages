import 'package:deriv_auth/core/models/authorize_model.dart';

const AuthorizeEntity mockAuthorizeEntity = AuthorizeEntity(
  accountList: <AccountListItem>[
    AccountListItem(
        currency: 'USD', landingCompanyName: 'svg', loginid: 'CR90000003')
  ],
  balance: 12,
  country: 'za',
  currency: 'USD',
  email: 'example@deriv.com',
  isVirtual: false,
  userId: 1,
  landingCompanyName: 'svg',
  upgradeableLandingCompanies: <String>['svg'],
);
const AuthorizeEntity mockEmptyAccountAuthorizeEntity = AuthorizeEntity(
  balance: 12,
  country: 'za',
  currency: 'USD',
  email: 'example@deriv.com',
  isVirtual: false,
  userId: 1,
  landingCompanyName: 'svg',
  upgradeableLandingCompanies: <String>['svg'],
);
