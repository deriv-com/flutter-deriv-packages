import 'package:deriv_passkeys/core/data/base_mapper.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';

/// [DerivPasskeysMapper] maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
final class DerivPasskeysMapper
    implements
        BaseMapper<DerivPasskeysOptionsEntity, DerivPasskeysOptionsModel> {
  @override
  DerivPasskeysOptionsEntity toEntity(DerivPasskeysOptionsModel model) =>
      DerivPasskeysOptionsEntity.fromJson(model.toJson());
}
