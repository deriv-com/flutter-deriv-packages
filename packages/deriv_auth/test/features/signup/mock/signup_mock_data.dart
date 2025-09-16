import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/deriv_auth.dart';

VerifyEmailRequestEntity invalidVerifyEmailRequest = VerifyEmailRequestEntity(
    type: resetPasswordEmailType, verifyEmail: 'test+123@domain.com');
VerifyEmailRequestEntity validVerifyEmailRequest = VerifyEmailRequestEntity(
    type: resetPasswordEmailType, verifyEmail: 'test@domain.com');

const NewVirtualAccountRequestModel validNewVirtualAccountModel =
    NewVirtualAccountRequestModel(
  verificationCode: 'verificationCode',
  clientPassword: 'clientPassword',
  residence: 'residence',
  type: 'trading',
);

const VerifyEmailResponseEntity validVerifyEmailResponse =
    VerifyEmailResponseEntity(verifyEmail: true);

AccountModel accountResponse =
    AccountModel(email: 'test@example.com', accountId: '123');
