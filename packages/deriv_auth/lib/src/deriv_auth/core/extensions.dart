import '../../../deriv_auth.dart';

extension AccountListItemFormatter on AuthorizeEntity {
  List<AccountModel> getAccounts() => accountList!
      .map((AccountListItem accoutItem) => AccountModel(
            accountId: accoutItem.loginid ?? " ",
            email: email,
            fullName: fullname,
            currency: accoutItem.currency,
            userId: userId,
          ))
      .toList();
}
