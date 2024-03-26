import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_deriv_api/api/response/passkeys_list_response_extended.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_options_response_extended.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_response_extended.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_options_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_options_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';

import 'package:http/http.dart' as http;

import '../data_sources/base_deriv_passkeys_data_source.dart';
import '../models/passkeys_connection_info_model.dart';
import '../models/deriv_passkey_model.dart';
import '../models/deriv_passkeys_options_model.dart';
import '../models/deriv_passkeys_register_options_model.dart';
import '../models/deriv_passkeys_verify_credentials_request_body_model.dart';
import '../models/deriv_passkeys_verify_credentials_response_model.dart';
import '../../exceptions/server_exceptions.dart';

/// [DerivPasskeysDataSource] extends and implements [BaseDerivPasskeysDataSource].
class DerivPasskeysDataSource extends BaseDerivPasskeysDataSource {
  /// Creates a [DerivPasskeysDataSource].
  DerivPasskeysDataSource(super.mapper);

  /// Creates a [DerivPasskeysDataSource] with a mock client.
  @visibleForTesting
  DerivPasskeysDataSource.withMockClient(super.mapper, {required this.client});

  /// The HTTP client.
  http.Client client = http.Client();

  @override
  Future<DerivPasskeysOptionsModel> getOptions({
    required PasskeysConnectionInfoModel passkeysConnectionInfoModel,
  }) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };
    final http.Response response = await client.get(
        Uri.parse(
            'https://${passkeysConnectionInfoModel.endpoint}/oauth2/api/v1/passkeys/login/options'),
        headers: headers);

    if (response.statusCode == 200) {
      return DerivPasskeysOptionsModel.fromJson(jsonDecode(response.body));
    } else {
      final Map<String, dynamic> jsonDecodedResponse =
          jsonDecode(response.body);
      if (jsonDecodedResponse.containsKey('error_code')) {
        throw ServerException(
          errorCode: jsonDecodedResponse['error_code'],
          message: jsonDecodedResponse['message'],
        );
      }
      throw Exception('Failed to load options!');
    }
  }

  @override
  Future<DerivPasskeysVerifyCredentialsResponseModel> verifyCredentials({
    required DerivPasskeysVerifyCredentialsRequest requestBodyModel,
    required String jwtToken,
    required PasskeysConnectionInfoModel passkeysConnectionInfoModel,
    String? userAgent,
  }) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwtToken',
      'User-Agent': userAgent ?? 'Dart/3.0 (dart:io)',
      'accept': 'application/json'
    };
    final http.Response response = await client.post(
        Uri.parse(
            'https://${passkeysConnectionInfoModel.endpoint}/oauth2/api/v1/passkeys/login/verify'),
        headers: headers,
        body: jsonEncode(requestBodyModel.toJson()));

    final Map<String, dynamic> jsonDecodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return DerivPasskeysVerifyCredentialsResponseModel(
        response: jsonDecodedResponse,
      );
    } else {
      final Map<String, dynamic> jsonDecodedResponse =
          jsonDecode(response.body);
      if (jsonDecodedResponse.containsKey('error_code')) {
        throw ServerException(
          errorCode: jsonDecodedResponse['error_code'],
          message: jsonDecodedResponse['message'],
        );
      }
      throw Exception('Failed to verify credentials!');
    }
  }

  @override
  Future<DerivPasskeysRegisterOptionsModel> getRegisterOptions() async {
    final PasskeysRegisterOptionsReceive response =
        await PasskeysRegisterOptionsResponseExtended.fetchRaw(
            const PasskeysRegisterOptionsRequest());

    if (response.passkeysRegisterOptions == null) {
      throw Exception('Failed to load register options!');
    }

    return DerivPasskeysRegisterOptionsModel(
        options: response.passkeysRegisterOptions!['publicKey']);
  }

  @override
  Future<DerivPasskeyModel> registerCredentials(
      PasskeysRegisterRequest request) async {
    final PasskeysRegisterReceive response =
        await PasskeysRegisterResponseExtended.fetchRaw(request);

    if (response.passkeysRegister == null) {
      throw Exception('Failed to register credentials!');
    }

    return DerivPasskeyModel.fromJson(response.passkeysRegister!['properties']);
  }

  @override
  Future<List<DerivPasskeyModel>> getPasskeysList() async {
    final PasskeysListReceive response =
        await PasskeysListResponseExtended.fetchRaw(
            const PasskeysListRequest());

    if (response.passkeysList == null) {
      throw Exception('Failed to load passkeys list!');
    }

    final List<DerivPasskeyModel> passkeys = <DerivPasskeyModel>[];
    for (final Map<String, dynamic> passkey in response.passkeysList!) {
      passkeys.add(DerivPasskeyModel.fromJson(passkey));
    }

    return passkeys;
  }
}
