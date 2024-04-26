import 'package:example/core/contracts/domain/base_entity.dart';

class LoginEntity extends BaseEntity {
  LoginEntity({
    required this.loginId,
    required this.balance,
  });

  final String loginId;
  final double balance;
}
