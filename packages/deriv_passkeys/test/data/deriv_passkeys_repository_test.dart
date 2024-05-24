import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'deriv_passkeys_data_source_mock_setup.dart';

void main() {
  late DerivPasskeysRepository repository;
  late MockDerivPasskeysDataSource mockDerivPasskeysDataSource;

  setUpAll(() {
    derivPasskeysDataSourceMockSetup();
    mockDerivPasskeysDataSource = MockDerivPasskeysDataSource();
    repository = DerivPasskeysRepository(mockDerivPasskeysDataSource);
  });

  group('getOptions', () {
    test('should return DerivPasskeysOptionsEntity', () async {
      when(() => mockDerivPasskeysDataSource.getOptions(
            passkeysConnectionInfoModel:
                any(named: 'passkeysConnectionInfoModel'),
          )).thenAnswer(
        (_) async => derivPasskeysOptionsModel,
      );

      final DerivPasskeysOptionsEntity result = await repository.getOptions(
        passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
      );

      expect(
        result,
        equals(
          mockDerivPasskeysDataSource.mapper.mapDerivPasskeysOptionsModel(
            derivPasskeysOptionsModel,
          ),
        ),
      );
      verify(() => mockDerivPasskeysDataSource.getOptions(
            passkeysConnectionInfoModel:
                any(named: 'passkeysConnectionInfoModel'),
          )).called(1);
    });
  });

  group('verifyCredentials', () {
    test('should return DerivPasskeysVerifyCredentialsResponseEntity',
        () async {
      when(() => mockDerivPasskeysDataSource.verifyCredentials(
                requestBodyModel: any(named: 'requestBodyModel'),
                jwtToken: any(named: 'jwtToken'),
                passkeysConnectionInfoModel:
                    any(named: 'passkeysConnectionInfoModel'),
                userAgent: any(named: 'userAgent'),
              ))
          .thenAnswer((_) async => derivPasskeysVerifyCredentialsResponseModel);

      final DerivPasskeysVerifyCredentialsResponseEntity result =
          await repository.verifyCredentials(
        requestBodyEntity: derivPasskeysVerifyCredentialsRequestBodyEntity,
        jwtToken: jwtToken,
        passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
      );

      expect(
        result,
        equals(
          mockDerivPasskeysDataSource.mapper
              .mapDerivPasskeysVerifyCredentialsResponseModel(
            derivPasskeysVerifyCredentialsResponseModel,
          ),
        ),
      );
      verify(() => mockDerivPasskeysDataSource.verifyCredentials(
            requestBodyModel: any(named: 'requestBodyModel'),
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoModel:
                any(named: 'passkeysConnectionInfoModel'),
            userAgent: any(named: 'userAgent'),
          )).called(1);
    });
  });

  group('getRegisterOptions', () {
    test('should return DerivPasskeysRegisterOptionsEntity', () async {
      final DerivPasskeysRegisterOptionsModel
          derivPasskeysRegisterOptionsModel = DerivPasskeysRegisterOptionsModel(
        options: <String, dynamic>{},
      );
      when(() => mockDerivPasskeysDataSource.getRegisterOptions())
          .thenAnswer((_) async => derivPasskeysRegisterOptionsModel);

      final DerivPasskeysRegisterOptionsEntity result =
          await repository.getRegisterOptions();

      expect(
        result,
        equals(
          mockDerivPasskeysDataSource.mapper
              .mapDerivPasskeysRegisterOptionsModel(
            derivPasskeysRegisterOptionsModel,
          ),
        ),
      );
      verify(() => mockDerivPasskeysDataSource.getRegisterOptions()).called(1);
    });
  });

  group('registerCredentials', () {
    test('should return DerivPasskeyEntity', () async {
      when(() => mockDerivPasskeysDataSource.registerCredentials(
            any(),
          )).thenAnswer((_) async => derivPasskeyModel);

      final DerivPasskeyEntity result =
          await repository.registerCredentials(registerCredentialsEntity);

      expect(
        result,
        equals(
          mockDerivPasskeysDataSource.mapper.mapDerivPasskeyModel(
            derivPasskeyModel,
          ),
        ),
      );
      verify(() => mockDerivPasskeysDataSource.registerCredentials(
            any(),
          )).called(1);
    });
  });

  group('getPasskeysList', () {
    test('should return List<DerivPasskeyEntity>', () async {
      const DerivPasskeyModel passkeyModel1 = DerivPasskeyModel(
        createdAt: 1234,
        id: '1',
        lastUsed: null,
        name: '',
        passkeyId: '',
        storedOn: '',
      );
      const DerivPasskeyModel passkeyModel2 = DerivPasskeyModel(
        createdAt: 1234,
        id: '2',
        lastUsed: null,
        name: '',
        passkeyId: '',
        storedOn: '',
      );
      const DerivPasskeyEntity passkeyEntity1 = DerivPasskeyEntity(
        createdAt: 1234,
        id: '1',
        lastUsed: null,
        name: '',
        passkeyId: '',
        storedOn: '',
      );
      const DerivPasskeyEntity passkeyEntity2 = DerivPasskeyEntity(
        createdAt: 1234,
        id: '2',
        lastUsed: null,
        name: '',
        passkeyId: '',
        storedOn: '',
      );
      final List<DerivPasskeyModel> passkeyModels = <DerivPasskeyModel>[
        passkeyModel1,
        passkeyModel2
      ];
      final List<DerivPasskeyEntity> passkeyEntities = <DerivPasskeyEntity>[
        passkeyEntity1,
        passkeyEntity2
      ];
      when(() => mockDerivPasskeysDataSource.getPasskeysList())
          .thenAnswer((_) async => passkeyModels);

      final List<DerivPasskeyEntity> result =
          await repository.getPasskeysList();

      expect(result, equals(passkeyEntities));
      verify(() => mockDerivPasskeysDataSource.getPasskeysList()).called(1);
    });
  });
}
