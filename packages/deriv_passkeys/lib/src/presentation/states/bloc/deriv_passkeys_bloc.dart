import 'dart:io';

import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:deriv_passkeys/src/domain/entities/account_entity.dart';
import 'package:deriv_passkeys/src/exceptions/platform_exceptions.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/exceptions/server_exceptions.dart';
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
    required DerivPasskeysService derivPasskeysService,
    required this.connectionInfo,
    required Future<String> Function() getJwtToken,
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
      if (state is DerivPasskeysLoadingState) {
        return;
      }

      emit(DerivPasskeysLoadingState());

      final String jwtToken = await getJwtToken();

      await derivPasskeysService
          .verifyCredential(
        jwtToken: jwtToken,
        passkeysConnectionInfoEntity: passkeysConnectionInfo ?? connectionInfo,
        userAgent: WebSocket.userAgent,
      )
          .then((DerivPasskeysVerifyCredentialsResponseEntity
              derivPasskeysVerifyCredentialsResponseEntity) {
        emit(
          DerivPasskeysCredentialVerifiedState(
            accounts: derivPasskeysVerifyCredentialsResponseEntity.accounts,
            refreshToken:
                derivPasskeysVerifyCredentialsResponseEntity.refreshToken,
          ),
        );
      }).catchError((Object error) {
        if (error is CanceledPlatformException) {
          emit(DerivPasskeysLoadedState(passkeysList));
        } else if (error is NoCredentialPlatformException) {
          emit(const NoCredentialErrorState());
        } else if (error is ServerException) {
          emit(
            DerivPasskeysErrorState(
              error.message,
              errorCode: error.errorCode,
            ),
          );
        } else {
          emit(const DerivPasskeysErrorState('Error verifying passkey'));
        }
      });
    });

    on<DerivPasskeysCreateCredentialEvent>(
        (DerivPasskeysCreateCredentialEvent event,
            Emitter<DerivPasskeysState> emit) async {
      if (state is DerivPasskeysLoadingState) {
        return;
      }
      emit(DerivPasskeysLoadingState());
      await derivPasskeysService
          .createCredential(loginId: loginId)
          .then((DerivPasskeyEntity credential) async {
        emit(DerivPasskeysCreatedSuccessfullyState());
        final DerivPasskeyEntity derivPasskeyEntity = credential;
        passkeysList.add(derivPasskeyEntity);
        emit(DerivPasskeysLoadedState(passkeysList));
      }).catchError((Object error) {
        if (error is ServerException) {
          emit(
            DerivPasskeysErrorState(
              error.message,
              errorCode: error.errorCode,
            ),
          );
        } else {
          emit(const DerivPasskeysErrorState('Error creating passkey'));
        }
        emit(DerivPasskeysLoadedState(passkeysList));
      });
    });

    on<DerivPasskeysGetPasskeysListEvent>(
        (DerivPasskeysGetPasskeysListEvent event,
            Emitter<DerivPasskeysState> emit) async {
      emit(DerivPasskeysLoadingState());
      loginId = event.loginId;
      await derivPasskeysService
          .getPasskeysList(loginId: loginId)
          .then((List<DerivPasskeyEntity> _passkeysList) {
        passkeysList = _passkeysList;
        emit(DerivPasskeysLoadedState(passkeysList));
      }).catchError((Object error) {
        if (error is ServerException) {
          emit(
            DerivPasskeysErrorState(
              error.message,
              errorCode: error.errorCode,
            ),
          );
        } else {
          emit(DerivPasskeysErrorState(error.toString()));
        }
      });
    });

    on<DerivPasskeysLogoutEvent>(
        (DerivPasskeysLogoutEvent event, Emitter<DerivPasskeysState> emit) {
      passkeysList.clear();
      if (state is DerivPasskeysNotSupportedState) {
        emit(DerivPasskeysNotSupportedState());
      } else {
        emit(DerivPasskeysInitializedState());
      }
    });

    derivPasskeysService.isSupported().then((bool isSupported) {
      if (isSupported) {
        add(const SetDerivPasskeysInitializedEvent());
      } else {
        add(const SetDerivPasskeysNotSupportedEvent());
      }
    });

    /// Initialize the analytics repository.
    AnalyticsRepository.init(
      connectionInfo.appId,
      derivRudderstack: DerivRudderstack(),
    );
  }

  /// Default account loginId used for multi-token authorization
  String? loginId;

  /// Passkeys connection info entity.
  final PasskeysConnectionInfoEntity connectionInfo;

  /// The list of passkeys.
  List<DerivPasskeyEntity> passkeysList = <DerivPasskeyEntity>[];

  /// Passkeys info entity which can be used to assign new changes to the
  /// connection info at anytime.
  PasskeysConnectionInfoEntity? passkeysConnectionInfo;

  /// Determines whether the app is DP2P or not.
  bool get isDp2p => connectionInfo.appId == '1408';
}
