import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/signup_mock_data.dart';

class MockSignupRepository extends Mock implements BaseSignupRepository {}

void main() {
  group('DerivSignupService', () {
    late final DerivSignupService service;
    late final MockSignupRepository repository;

    final DateTime time = DateTime.now();

    setUpAll(() {
      repository = MockSignupRepository();
      service = DerivSignupService(repository: repository);
      when(() => repository.getClientServerTime())
          .thenAnswer((_) async => time);

      when(() => repository.sendVerificationEmail(validVerifyEmailRequest))
          .thenAnswer((_) async => validVerifyEmailResponse);

      when(() => repository.openNewVirtualAccount(
              newVirtualAccountModel: validNewVirtualAccountModel))
          .thenAnswer((_) async => accountResponse);
    });

    test('getClientServerTime', () async {
      final DateTime result = await service.getClientServerTime();
      expect(result, time);

      verify(() => repository.getClientServerTime()).called(1);
    });

    test('sendVerificationEmail', () async {
      final VerifyEmailResponseEntity result =
          await service.sendVerificationEmail(validVerifyEmailRequest);
      expect(result, validVerifyEmailResponse);
      verify(() => repository.sendVerificationEmail(validVerifyEmailRequest))
          .called(1);
    });

    test('openNewVirtualAccount', () async {
      final AccountModel result = await service.openNewVirtualAccount(
        newVirtualAccountModel: validNewVirtualAccountModel,
      );
      expect(result, accountResponse);
      verify(() => repository.openNewVirtualAccount(
          newVirtualAccountModel: validNewVirtualAccountModel)).called(1);
    });
  });
}
