import 'dart:convert';

import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_request_body.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_response.dart';
import 'package:flutter_deriv_api/api/response/passkeys_list_response_result.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_options_response_result.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_options_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_options_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';
import 'package:http/http.dart' as http;

/// [DerivPasskeysDataSource] extends and implements [BaseDerivPasskeysDataSource].
final class DerivPasskeysDataSource extends BaseDerivPasskeysDataSource {
  /// Creates a [DerivPasskeysDataSource].
  DerivPasskeysDataSource(super.mapper);

  @override
  Future<DerivPasskeysOptionsModel> getOptions() async {
    final http.Request request = http.Request(
        'GET',
        Uri.parse(
            'https://qa163.deriv.dev/oauth2/api/v1/passkeys/login/options'));

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return DerivPasskeysOptionsModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to load options!');
    }
  }

  @override
  Future<DerivPasskeysVerifyCredentialsResponse> verifyCredentials(
      DerivPasskeysVerifyCredentialsRequestBody body) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };
    final http.Request request = http.Request(
        'POST',
        Uri.parse(
          'https://qa163.deriv.dev/oauth2/api/v1/passkeys/login/verify',
        ))
      ..body = jsonEncode(body)
      ..headers.addAll(headers);

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return DerivPasskeysVerifyCredentialsResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      return DerivPasskeysVerifyCredentialsResponse(
        success: false,
      );
    }
  }

  @override
  Future<DerivPasskeysRegisterOptionsModel> getRegisterOptions() async {
    final PasskeysRegisterOptionsReceive response =
        await PasskeysRegisterOptionsResponse.fetchRaw(
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
        await PasskeysRegisterResponse.fetchRaw(request);

    if (response.passkeysRegister == null) {
      throw Exception('Failed to register credentials!');
    }

    return DerivPasskeyModel.fromJson(response.passkeysRegister!['properties']);
  }

  @override
  Future<List<DerivPasskeyModel>> getPasskeysList() async {
    final PasskeysListReceive response =
        await PasskeysListResponse.fetchRaw(const PasskeysListRequest());

    if (response.passkeysList == null) {
      throw Exception('Failed to load passkeys list!');
    }

    final List<DerivPasskeyModel> passkeys = <DerivPasskeyModel>[];
    for (final Map<String, dynamic> passkey in response.passkeysList!) {
      print(passkey['id'].runtimeType);
      print(passkey['last_used'].runtimeType);
      passkeys.add(DerivPasskeyModel.fromJson(passkey));
    }

    return passkeys;
  }
}
