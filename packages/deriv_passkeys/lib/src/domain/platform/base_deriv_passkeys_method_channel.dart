import 'package:deriv_passkeys/src/data/platform/deriv_passkeys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of deriv_passkeys must implement.
abstract class BaseDerivPasskeysMethodChannel extends PlatformInterface {
  /// Constructs a BaseDerivPasskeysMethodChannel.
  BaseDerivPasskeysMethodChannel() : super(token: _token);

  static final Object _token = Object();

  static BaseDerivPasskeysMethodChannel _instance =
      MethodChannelDerivPasskeys();

  /// The default instance of [BaseDerivPasskeysMethodChannel] to use.
  ///
  /// Defaults to [MethodChannelDerivPasskeys].
  static BaseDerivPasskeysMethodChannel get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseDerivPasskeysMethodChannel] when
  /// they register themselves.
  static set instance(BaseDerivPasskeysMethodChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the platform version.
  Future<bool?> isPlatformSupported();

  /// Creates a passkey credential.
  Future<String?> createCredential(String options);

  /// Gets a passkey credential.
  Future<String?> getCredential(String options);
}
