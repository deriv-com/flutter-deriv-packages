import 'dart:convert';

import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
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
}
