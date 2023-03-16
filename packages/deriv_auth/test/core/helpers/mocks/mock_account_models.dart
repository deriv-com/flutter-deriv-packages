import 'dart:math';

import 'package:deriv_auth/deriv_auth.dart';

List<AccountModel> mockAccountList = List<AccountModel>.generate(
    5,
    (int index) => AccountModel(
          accountId: index % 2 == 0
              ? 'VRTC${Random().nextInt(5)}'
              : 'CR${Random().nextInt(5)}',
        ));
