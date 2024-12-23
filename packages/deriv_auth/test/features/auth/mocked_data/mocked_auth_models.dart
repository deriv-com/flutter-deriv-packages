import 'package:deriv_auth/deriv_auth.dart';

const AuthorizeEntity mockedValidAuthorizeEntity = AuthorizeEntity(
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

const AuthorizeEntity mockedUnsupportedAuthorizeEntity = AuthorizeEntity(
  accountList: <AccountListItem>[
    AccountListItem(
        currency: 'USD', landingCompanyName: 'notsvg', loginid: 'CR90000003')
  ],
  balance: 12,
  country: 'za',
  currency: 'USD',
  email: 'example@deriv.com',
  isVirtual: false,
  userId: 1,
  landingCompanyName: 'notsvg',
  upgradeableLandingCompanies: <String>['notsvg'],
);

final AccountModel mockedAccountModel =
    AccountModel(accountId: '1', token: 'token');
