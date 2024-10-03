import 'package:deriv_passkeys/src/data/models/passkeys_connection_info_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_request_body_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_response_model.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_passkeys/src/data/mappers/deriv_passkeys_mapper.dart';

void main() {
  group('DerivPasskeysMapper', () {
    late DerivPasskeysMapper mapper;

    setUp(() {
      mapper = DerivPasskeysMapper();
    });

    test(
        'mapDerivPasskeysOptionsModel should return DerivPasskeysOptionsEntity',
        () {
      final DerivPasskeysOptionsModel model = DerivPasskeysOptionsModel(
          challenge: '',
          rpId: '',
          timeout: 12345,
          userVerification: '',
          allowCredentials: <dynamic>[]); // Provide necessary data for the model

      final DerivPasskeysOptionsEntity result =
          mapper.mapDerivPasskeysOptionsModel(model);

      expect(result, isA<DerivPasskeysOptionsEntity>());
    });

    test(
        'mapDerivPasskeysVerifyCredentialsRequestBodyEntity should return DerivPasskeysVerifyCredentialsRequest',
        () {
      const DerivPasskeysVerifyCredentialsRequestBodyEntity entity =
          DerivPasskeysVerifyCredentialsRequestBodyEntity(
              appId: '', publicKeyCredential: <String, dynamic>{}, type: '');

      final DerivPasskeysVerifyCredentialsRequest result =
          mapper.mapDerivPasskeysVerifyCredentialsRequestBodyEntity(entity);

      expect(result, isA<DerivPasskeysVerifyCredentialsRequest>());
    });

    test(
        'mapDerivPasskeysRegisterOptionsModel should return DerivPasskeysRegisterOptionsEntity',
        () {
      final DerivPasskeysRegisterOptionsModel model =
          DerivPasskeysRegisterOptionsModel(options: <String,
              dynamic>{}); // Provide necessary data for the model

      final DerivPasskeysRegisterOptionsEntity result =
          mapper.mapDerivPasskeysRegisterOptionsModel(model);

      expect(result, isA<DerivPasskeysRegisterOptionsEntity>());
    });

    test('mapDerivPasskeyModel should return DerivPasskeyEntity', () {
      const DerivPasskeyModel model = DerivPasskeyModel(
        createdAt: 1234,
        id: '',
        lastUsed: null,
        name: '',
        passkeyId: '',
        storedOn: '',
      );

      final DerivPasskeyEntity result = mapper.mapDerivPasskeyModel(model);

      expect(result, isA<DerivPasskeyEntity>());
    });

    test(
        'mapDerivPasskeysRegisterCredentialsEntity should return PasskeysRegisterRequest',
        () {
      const DerivPasskeysRegisterCredentialsEntity entity =
          DerivPasskeysRegisterCredentialsEntity(
        publicKeyCredential: <String, dynamic>{},
        name: '',
      );

      final PasskeysRegisterRequest result =
          mapper.mapDerivPasskeysRegisterCredentialsEntity(entity);

      expect(result, isA<PasskeysRegisterRequest>());
    });

    test(
        'mapDerivPasskeysVerifyCredentialsResponseModel should return DerivPasskeysVerifyCredentialsResponseEntity',
        () {
      const DerivPasskeysVerifyCredentialsResponseModel model =
          DerivPasskeysVerifyCredentialsResponseModel(
        response: <String, dynamic>{
          'tokens': <dynamic>[
            <String, dynamic>{
              'loginid': '',
              'token': '',
            }
          ],
          'refresh_token': 'refresh_token',
        },
      );

      final DerivPasskeysVerifyCredentialsResponseEntity result =
          mapper.mapDerivPasskeysVerifyCredentialsResponseModel(model);

      expect(result, isA<DerivPasskeysVerifyCredentialsResponseEntity>());
    });

    test('mapConnectionInfoEntity should return PasskeysConnectionInfoModel',
        () {
      final PasskeysConnectionInfoEntity entity = PasskeysConnectionInfoEntity(
        endpoint: '',
        appId: '',
      );

      final PasskeysConnectionInfoModel result =
          mapper.mapConnectionInfoEntity(entity);

      expect(result, isA<PasskeysConnectionInfoModel>());
    });
  });
}
