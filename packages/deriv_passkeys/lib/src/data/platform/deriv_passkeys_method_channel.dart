import 'package:deriv_passkeys/src/exceptions/platform_exceptions.dart';
import 'package:deriv_passkeys/src/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// An implementation of [BaseDerivPasskeysMethodChannel] that uses method channels.
class MethodChannelDerivPasskeys extends BaseDerivPasskeysMethodChannel {
  /// Constructs a [MethodChannelDerivPasskeys] with an optional [MethodChannel];
  MethodChannelDerivPasskeys({
    MethodChannel? channel,
  }) : methodChannel = channel ?? const MethodChannel('deriv_passkeys');

  /// The method channel used to interact with the native platform.
  MethodChannel methodChannel;

  @override
  Future<bool?> isPlatformSupported() async =>
      methodChannel.invokeMethod<bool>('isPlatformSupported');

  @override
  Future<String?> createCredential(String options) =>
      methodChannel.invokeMethod<String>(
          'createCredential', <String, String>{'options': options}).catchError(
        (Object error) {
          if (error is PlatformException) {
            if (error.code == '1001' ||
                error.code == 'CreateCredentialCancellationException') {
              throw CanceledPlatformException(
                code: error.code,
                message: error.message ?? 'Error creating passkey',
                details: error.details ?? error.toString(),
              );
            }
          }
          throw PlatformException(
            code: 'unhandled_error',
            message: 'Unhandled error creating passkey',
            details: error.toString(),
          );
        },
      );

  @override
  Future<String?> getCredential(String options) =>
      methodChannel.invokeMethod<String>(
          'getCredential', <String, String>{'options': options}).catchError(
        (Object error) {
          if (error is PlatformException) {
            if (error.code == '1001' ||
                error.code == 'GetCredentialCancellationException') {
              throw CanceledPlatformException(
                code: error.code,
                message: error.message ?? 'Error creating passkey',
                details: error.details ?? error.toString(),
              );
            }
            if (error.code == 'NoCredentialException') {
              throw NoCredentialPlatformException(
                code: error.code,
                message: error.message ?? 'Error creating passkey',
                details: error.details ?? error.toString(),
              );
            }
          }
          throw PlatformException(
            code: 'unhandled_error',
            message: 'Unhandled error creating passkey',
            details: error.toString(),
          );
        },
      );
}
