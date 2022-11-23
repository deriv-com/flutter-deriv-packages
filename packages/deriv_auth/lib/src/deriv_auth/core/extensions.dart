import '../../../deriv_auth.dart';

extension AccountListItemFormatter on AuthorizeEntity {
  List<AccountModel> getAccounts() => accountList!
      .map((e) => AccountModel(
            accountId: e.loginid!,
            email: email!,
            fullName: fullname,
            currency: e.currency,
            userId: userId,
          ))
      .toList();
}
