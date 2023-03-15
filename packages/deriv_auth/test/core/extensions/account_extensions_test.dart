import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'mocks/mock_authorize_entity_model.dart';

void main() {
  group('AccountExtension on AuthorizeEntity tests =>', () {
    test('.accounts maps [AccountListModel] to list of [AccountModel].', () {
      const String loginIdFromAccountListModel = 'CR90000003';

      expect(
        mockAuthorizeEntity.accounts.first.accountId,
        loginIdFromAccountListModel,
      );
      expect(
        mockEmptyAccountAuthorizeEntity.accounts,
        isEmpty,
      );
    });
  });
}
