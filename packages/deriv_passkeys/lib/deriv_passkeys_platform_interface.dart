import 'package:deriv_passkeys/deriv_passkeys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class DerivPasskeysPlatform extends PlatformInterface {
  /// Constructs a DerivPasskeysPlatform.
  DerivPasskeysPlatform() : super(token: _token);

  static final Object _token = Object();

  static DerivPasskeysPlatform _instance = MethodChannelDerivPasskeys();

  /// The default instance of [DerivPasskeysPlatform] to use.
  ///
  /// Defaults to [MethodChannelDerivPasskeys].
  static DerivPasskeysPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DerivPasskeysPlatform] when
  /// they register themselves.
  static set instance(DerivPasskeysPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> createCredential(String options) {
    throw UnimplementedError(
        'createCredential(String options) has not been implemented.');
  }

  Future<String?> getCredential(String options) {
    throw UnimplementedError(
        'getCredential(String options) has not been implemented.');
  }
}
