import 'deriv_passkeys_platform_interface.dart';

class DerivPasskeys {
  Future<String?> getPlatformVersion() {
    return DerivPasskeysPlatform.instance.getPlatformVersion();
  }

  Future<String?> createPasskey() {
    return DerivPasskeysPlatform.instance.createPasskey();
  }
}
