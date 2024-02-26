import 'package:deriv_passkeys/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/interactor/services/deriv_passkeys_service.dart';
import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deriv_passkeys_state.dart';
part 'deriv_passkeys_event.dart';

/// [DerivPasskeysBloc] handles the state within the DerivPasskeys flow.
class DerivPasskeysBloc extends Bloc<DerivPasskeysEvent, DerivPasskeysState> {
  /// Creates a [DerivPasskeysBloc].
  DerivPasskeysBloc(this.derivPasskeysService) : super(DerivPasskeysInitial()) {
    on<DerivPasskeysInit>(
        (DerivPasskeysInit event, Emitter<DerivPasskeysState> emit) async {
      final bool isPasskeySupported = await derivPasskeysService.isSupported();
      if (!isPasskeySupported) {
        emit(DerivPasskeysNotSupported());
      } else {
        emit(DerivPasskeysInitial());
      }
    });

    on<DerivPasskeysGetCredential>((DerivPasskeysGetCredential event,
        Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysLoading());

      await derivPasskeysService.getCredential().then((String? credential) {
        emit(DerivPasskeysInitial());
      }).catchError((Object error) {
        emit(DerivPasskeysError(error.toString()));
      });
    });

    on<DerivPasskeysCreateCredential>((DerivPasskeysCreateCredential event,
        Emitter<DerivPasskeysState> emit) async {
      await derivPasskeysService
          .createCredential()
          .then((String? credential) async {
        if (credential == null) {
          emit(DerivPasskeysError('Error creating passkey'));
          return;
        }
        emit(DerivPasskeysCreatedSuccessfully());
        final DeviceMarketingNames deviceNames = DeviceMarketingNames();
        final String singleDeviceName = await deviceNames.getSingleName();
        final DerivPasskeyEntity derivPasskeyEntity = DerivPasskeyEntity(
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: 1,
          lastUsed: 'Never',
          name: 'Passkey',
          passkeyId: 'passkeyId',
          storedOn: singleDeviceName,
        );
        passkeysList.add(derivPasskeyEntity);
        emit(DerivPasskeysLoaded(passkeysList));
      }).catchError((Object error) {
        emit(DerivPasskeysError(error.toString()));
      });
    });

    on<DerivPasskeysGetPasskeysList>((DerivPasskeysGetPasskeysList event,
        Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysLoading());

      emit(DerivPasskeysLoaded(passkeysList));
    });
  }

  /// The list of passkeys.
  List<DerivPasskeyEntity> passkeysList = <DerivPasskeyEntity>[];

  /// The service used to get data from.
  final DerivPasskeysService derivPasskeysService;
}
