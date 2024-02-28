import 'package:deriv_passkeys/core/data/base_model.dart';

/// [DerivPasskeysRegisterOptionsModel] DTO for DerivPasskeysOptions data coming from the WebsocketAPI.
final class DerivPasskeysRegisterOptionsModel extends BaseModel {
  /// Creates a [DerivPasskeysRegisterOptionsModel].
  DerivPasskeysRegisterOptionsModel({
    required this.options,
  });

  /// Creates a [DerivPasskeysRegisterOptionsModel] from a JSON object.
  factory DerivPasskeysRegisterOptionsModel.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysRegisterOptionsModel(options: json);

  /// [options] is the challenge string.
  final Map<String, dynamic> options;

  /// Creates a JSON object from a [DerivPasskeysRegisterOptionsModel].
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'passkeys_register_options': options};
}
