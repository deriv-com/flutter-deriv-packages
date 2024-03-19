import 'package:deriv_passkeys/src/data/exceptions/platform_exceptions.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/interactor/services/deriv_passkeys_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';

part 'deriv_passkeys_state.dart';
part 'deriv_passkeys_event.dart';

/// [DerivPasskeysBloc] handles the state within the DerivPasskeys flow.
class DerivPasskeysBloc extends Bloc<DerivPasskeysEvent, DerivPasskeysState> {
  /// Creates a [DerivPasskeysBloc].
  DerivPasskeysBloc({
    required this.derivPasskeysService,
    required this.connectionInfo,
    required this.getJwtToken,
  }) : super(DerivPasskeysLoadingState()) {
    on<SetDerivPasskeysInitializedEvent>(
        (SetDerivPasskeysInitializedEvent event,
            Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysInitializedState());
    });

    on<SetDerivPasskeysNotSupportedEvent>(
        (SetDerivPasskeysNotSupportedEvent event,
            Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysNotSupportedState());
    });

    on<DerivPasskeysVerifyCredentialEvent>(
        (DerivPasskeysVerifyCredentialEvent event,
            Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysLoadingState());

      final String jwtToken = await getJwtToken();

      await derivPasskeysService
          .verifyCredential(
        jwtToken: jwtToken,
        passkeysConnectionInfoEntity: connectionInfo,
      )
          .then((DerivPasskeysVerifyCredentialsResponseEntity?
              derivPasskeysVerifyCredentialsResponseEntity) {
        if (derivPasskeysVerifyCredentialsResponseEntity != null &&
            derivPasskeysVerifyCredentialsResponseEntity.success) {
          emit(
            DerivPasskeysCredentialVerifiedState(
              token: derivPasskeysVerifyCredentialsResponseEntity.token,
            ),
          );
        } else {
          emit(const DerivPasskeysErrorState('Error verifying passkey'));
          return;
        }
      }).catchError((Object error) {
        if (error is CanceledPlatformException) {
          emit(DerivPasskeysLoadedState(passkeysList));
          return;
        }
        if (error is NoCredentialPlatformException) {
          emit(const NoCredentialErrorState());
          return;
        }
        emit(DerivPasskeysErrorState(error.toString()));
      });
    });

    on<DerivPasskeysCreateCredentialEvent>(
        (DerivPasskeysCreateCredentialEvent event,
            Emitter<DerivPasskeysState> emit) async {
      await derivPasskeysService
          .createCredential()
          .then((DerivPasskeyEntity? credential) async {
        if (credential == null) {
          emit(const DerivPasskeysErrorState('Error creating passkey'));
          return;
        }
        emit(DerivPasskeysCreatedSuccessfullyState());
        final DerivPasskeyEntity derivPasskeyEntity = credential;
        passkeysList.add(derivPasskeyEntity);
        emit(DerivPasskeysLoadedState(passkeysList));
      }).catchError((Object error) {
        if (error is CanceledPlatformException) {
          emit(DerivPasskeysLoadedState(passkeysList));
          return;
        }
        emit(DerivPasskeysErrorState(error.toString()));
      });
    });

    on<DerivPasskeysGetPasskeysListEvent>(
        (DerivPasskeysGetPasskeysListEvent event,
            Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysLoadingState());

      await derivPasskeysService
          .getPasskeysList()
          .then((List<DerivPasskeyEntity> _passkeysList) {
        passkeysList = _passkeysList;
        emit(DerivPasskeysLoadedState(passkeysList));
      }).catchError((Object error) {
        emit(DerivPasskeysErrorState(error.toString()));
      });
    });

    derivPasskeysService.isSupported().then((bool isSupported) {
      if (isSupported) {
        add(const SetDerivPasskeysInitializedEvent());
      } else {
        add(const SetDerivPasskeysNotSupportedEvent());
      }
    });
  }

  /// The list of passkeys.
  List<DerivPasskeyEntity> passkeysList = <DerivPasskeyEntity>[];

  /// The service used to get data from.
  final DerivPasskeysService derivPasskeysService;

  /// The connection info.
  final PasskeysConnectionInfoEntity connectionInfo;

  /// The function to get the JWT token.
  final Future<String> Function() getJwtToken;
}
