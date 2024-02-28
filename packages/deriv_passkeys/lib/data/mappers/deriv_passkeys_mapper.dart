import 'package:deriv_passkeys/core/data/base_mapper.dart';
import 'package:deriv_passkeys/core/data/base_model.dart';
import 'package:deriv_passkeys/core/domain/base_entity.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_options_entity.dart';

/// [DerivPasskeysMapper] maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
final class DerivPasskeysMapper implements BaseMapper<BaseEntity, BaseModel> {
  @override
  BaseEntity toEntity(BaseModel model) {
    switch (model.runtimeType) {
      case DerivPasskeysOptionsModel:
        return DerivPasskeysOptionsEntity.fromJson(model.toJson());
      case DerivPasskeysRegisterOptionsModel:
        return DerivPasskeysRegisterOptionsEntity.fromJson(model.toJson());
      default:
        throw Exception('Unknown model type');
    }
  }
}
