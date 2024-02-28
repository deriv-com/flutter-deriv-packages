import 'dart:convert';

import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_request_body.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_response.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_options_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_options_send.dart';
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
  Future<DerivPasskeysOptionsModel> getRegisterOptions() async {
    final PasskeysRegisterOptionsResponse response =
        await PasskeysRegisterOptionsResponse.fetch(
            const PasskeysRegisterOptionsRequest());

    return DerivPasskeysOptionsModel.fromJson(
        response.toJson()['passkeys_register_options']);
  }
}
