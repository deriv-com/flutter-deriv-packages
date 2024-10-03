import 'package:deriv_passkeys/src/data/data_sources/deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/src/data/mappers/deriv_passkeys_mapper.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_request_body_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_response_model.dart';
import 'package:deriv_passkeys/src/data/models/passkeys_connection_info_model.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';
import 'package:mocktail/mocktail.dart';

/// Mock class for [DerivPasskeysDataSource].
class MockDerivPasskeysDataSource extends Mock
    implements DerivPasskeysDataSource {
  @override
  final DerivPasskeysMapper mapper = DerivPasskeysMapper();
}

final PasskeysConnectionInfoEntity passkeysConnectionInfoEntity =
    PasskeysConnectionInfoEntity(endpoint: 'deriv.com', appId: '1234');

final PasskeysConnectionInfoModel passkeysConnectionInfoModel =
    PasskeysConnectionInfoModel(
  endpoint: 'deriv.com',
  appId: '1234',
);

const DerivPasskeysVerifyCredentialsRequestBodyEntity
    derivPasskeysVerifyCredentialsRequestBodyEntity =
    DerivPasskeysVerifyCredentialsRequestBodyEntity(
  appId: '1234',
  publicKeyCredential: <String, dynamic>{},
  type: '',
);

final DerivPasskeysVerifyCredentialsRequest
    derivPasskeysVerifyCredentialsRequest =
    DerivPasskeysVerifyCredentialsRequest(
  appId: '1234',
  publicKeyCredential: <String, dynamic>{},
  type: '',
);

const String jwtToken = 'jwtToken';
const String userAgent = 'Dart/3.0 (dart:io)';

const PasskeysRegisterRequest passkeysRegisterRequest = PasskeysRegisterRequest(
  name: '',
  publicKeyCredential: <String, dynamic>{},
);

const DerivPasskeysRegisterCredentialsEntity registerCredentialsEntity =
    DerivPasskeysRegisterCredentialsEntity(
  publicKeyCredential: <String, dynamic>{},
  name: '',
);
const DerivPasskeyModel derivPasskeyModel = DerivPasskeyModel(
  createdAt: 1234,
  id: '',
  lastUsed: null,
  name: '',
  passkeyId: '',
  storedOn: '',
);

DerivPasskeysRegisterOptionsModel derivPasskeysRegisterOptionsModel =
    DerivPasskeysRegisterOptionsModel(
  options: <String, dynamic>{
    'rp': <String, dynamic>{
      'id': 'id',
      'name': 'name',
    },
    'user': <String, dynamic>{
      'id': 'id',
      'name': 'name',
      'displayName': 'displayName',
    },
    'challenge': 'challenge',
    'pubKeyCredParams': <dynamic>[
      <String, dynamic>{
        'type': 'type',
        'alg': -1,
      }
    ],
    'timeout': 18000,
    'attestation': 'attestation',
    'extensions': <String, dynamic>{},
  },
);

const DerivPasskeysVerifyCredentialsResponseModel
    derivPasskeysVerifyCredentialsResponseModel =
    DerivPasskeysVerifyCredentialsResponseModel(
  response: <String, dynamic>{
    'tokens': <Map<String, dynamic>>[
      <String, dynamic>{
        'loginid': 'login',
        'token': 'token',
      },
    ],
    'refresh_token': 'refresh_token',
  },
);

final DerivPasskeysOptionsModel derivPasskeysOptionsModel =
    DerivPasskeysOptionsModel(
  challenge: '',
  rpId: '',
  timeout: 1234,
  userVerification: '',
  allowCredentials: <dynamic>[],
);

/// Sets up the mock data for [DerivPasskeysDataSource].
void derivPasskeysDataSourceMockSetup() {
  registerFallbackValue(derivPasskeysVerifyCredentialsRequest);
  registerFallbackValue(derivPasskeysVerifyCredentialsRequestBodyEntity);
  registerFallbackValue(passkeysConnectionInfoModel);
  registerFallbackValue(jwtToken);
  registerFallbackValue(userAgent);
  registerFallbackValue(passkeysRegisterRequest);
}
