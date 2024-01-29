import 'dart:convert';

import 'package:deriv_passkeys/interactor/services/deriv_passkeys_service.dart';
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
      emit(DerivPasskeysLoading());

      final Map<String, dynamic> publicKeyCredentialUserEntityJson =
          <String, String>{
        'id': _base64UrlEncodeString('yourUserId'),
        'name': 'bassam+3@deriv.com',
        'displayName': 'User Name'
      };

      final Map<String, dynamic> signupJson = <String, dynamic>{
        'rp': <String, String>{
          'id': 'pro-7837426045311437779.frontendapi.corbado.io',
          'name': 'Deriv'
        },
        'user': publicKeyCredentialUserEntityJson,
        'challenge':
            'Base64URLStringChallenge', // TODO(bassam-deriv): Replace with actual Base64URL encoded challenge
        'pubKeyCredParams': <Map<String, Object>>[
          <String, Object>{'alg': -7, 'type': 'public-key'}
        ],
        'timeout': 60000,
        'excludeCredentials': <dynamic>[],
        'authenticatorSelection': <String, Object>{
          'authenticatorAttachment': 'platform',
          'requireResidentKey': true,
          'residentKey': 'required',
          'userVerification': 'required'
        },
        'attestation': 'none',
        'extensions': <String, dynamic>{}
      };

      final String creationOptions = jsonEncode(signupJson);

      await derivPasskeysService
          .createCredential(creationOptions)
          .then((String? credential) {
        emit(DerivPasskeysInitial());
      }).catchError((Object error) {
        emit(DerivPasskeysError(error.toString()));
      });
    });
  }

  /// The service used to get data from.
  final DerivPasskeysService derivPasskeysService;
}

// TODO(bassam-deriv): Remove this method once API is implemented
String _base64UrlEncodeString(String input) {
  final List<int> bytes = utf8.encode(input);
  final String base64Str = base64Url.encode(bytes);
  return base64Str;
}
