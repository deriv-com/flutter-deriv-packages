import 'dart:convert';

import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_request_body_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_response_model.dart';
import 'package:deriv_passkeys/src/data/models/passkeys_connection_info_model.dart';
import 'package:deriv_passkeys/src/exceptions/server_exceptions.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart';

Future<Response> _mockHTTP(Request request) async {
  if (request.url.host.contains('error')) {
    if (request.url.host == 'error_code_exists') {
      return Response(
        jsonEncode(<String, dynamic>{
          'error_code': 'error_code_exists',
          'message': 'message',
        }),
        500,
      );
    }
    if (request.url.host == 'no_error_code') {
      return Response(
        jsonEncode(<String, dynamic>{
          'message': 'message',
        }),
        500,
      );
    }
  }
  switch (request.url.path) {
    case '/oauth2/api/v1/passkeys/login/options':
      if (request.method == 'GET') {
        return Response(
          jsonEncode(<String, dynamic>{
            'publicKey': <String, dynamic>{
              'challenge': 'jV6lvuj1d-iVSPiQQg9iwXhiSTCm3CueJ7aLcv2GfVc',
              'rpId': 'deriv.com',
              'timeout': 60000,
              'userVerification': 'preferred'
            }
          }),
          200,
        );
      }
      break;
    case '/oauth2/api/v1/passkeys/login/verify':
      if (request.method == 'POST') {
        return Response(
          jsonEncode(<String, dynamic>{}),
          200,
        );
      }
      break;
  }
  return Response(
    jsonEncode(<String, dynamic>{
      'error_code': 'error_code',
      'message': 'message',
    }),
    400,
  );
}

class FakeHttpClient extends Fake implements HttpClient {
  @override
  Future<Response> get(String url, {String? basicAuthToken}) async =>
      _mockHTTP(Request('GET', Uri.parse(url)));

  @override
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> jsonBody,
    Map<String, String>? headers,
  }) async {
    final Response response = await _mockHTTP(Request('POST', Uri.parse(url)));
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DerivPasskeysDataSource dataSource;
  final HttpClient mockClient = FakeHttpClient();
  final PasskeysConnectionInfoModel passkeysConnectionInfoModel =
      PasskeysConnectionInfoModel(
    endpoint: 'deriv.com',
    appId: 'appId',
  );

  setUpAll(() {
    APIInitializer().initialize(api: MockAPI());
    dataSource = DerivPasskeysDataSource(
      mapper: DerivPasskeysMapper(),
      client: mockClient,
    );
  });

  group('getOptions', () {
    test('should return DerivPasskeysOptionsModel when request is successful',
        () async {
      expect(
          dataSource.getOptions(
            passkeysConnectionInfoModel: passkeysConnectionInfoModel,
          ),
          completion(isA<DerivPasskeysOptionsModel>()));
    });

    test(
        'should throw ServerException when request is unsuccessful and response body contains "error_code".',
        () async {
      expect(
        () => dataSource.getOptions(
          passkeysConnectionInfoModel: passkeysConnectionInfoModel.copyWith(
            endpoint: 'error_code_exists',
          ),
        ),
        throwsA(isA<ServerException>()),
      );
    });

    test(
        'should throw Exception when request is unsuccessful and response body does not contain "error_code".',
        () async {
      expect(
        () => dataSource.getOptions(
          passkeysConnectionInfoModel: passkeysConnectionInfoModel.copyWith(
            endpoint: 'no_error_code',
          ),
        ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('verifyCredentials', () {
    final DerivPasskeysVerifyCredentialsRequest
        derivPasskeysVerifyCredentialsRequest =
        DerivPasskeysVerifyCredentialsRequest(
      appId: 'appId',
      publicKeyCredential: <String, dynamic>{},
      type: 'type',
    );
    test(
        'should return DerivPasskeysVerifyCredentialsResponseModel when request is successful',
        () async {
      expect(
          dataSource.verifyCredentials(
            requestBodyModel: derivPasskeysVerifyCredentialsRequest,
            jwtToken: 'jwtToken',
            passkeysConnectionInfoModel: passkeysConnectionInfoModel,
          ),
          completion(isA<DerivPasskeysVerifyCredentialsResponseModel>()));
    });

    test(
        'should throw ServerException when request is unsuccessful and response body contains "error_code".',
        () async {
      expect(
        () => dataSource.verifyCredentials(
          requestBodyModel: derivPasskeysVerifyCredentialsRequest,
          jwtToken: 'jwtToken',
          passkeysConnectionInfoModel: passkeysConnectionInfoModel.copyWith(
            endpoint: 'error_code_exists',
          ),
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('getRegisterOptions', () {
    test(
        'should return DerivPasskeysRegisterOptionsModel when request is successful',
        () async {
      expect(dataSource.getRegisterOptions(),
          completion(isA<DerivPasskeysRegisterOptionsModel>()));
    });
  });

  group('registerCredentials', () {
    test('should return DerivPasskeyModel when request is successful',
        () async {
      expect(
          dataSource.registerCredentials(
            const PasskeysRegisterRequest(
              publicKeyCredential: <String, dynamic>{},
              name: '',
            ),
          ),
          completion(isA<DerivPasskeyModel>()));
    });
  });

  group('getPasskeysList', () {
    test('should return List<DerivPasskeyModel> when request is successful',
        () async {
      expect(dataSource.getPasskeysList(),
          completion(isA<List<DerivPasskeyModel>>()));
    });
  });
}
