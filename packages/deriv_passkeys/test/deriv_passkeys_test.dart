import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/deriv_passkeys_platform_interface.dart';
import 'package:deriv_passkeys/deriv_passkeys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDerivPasskeysPlatform
    with MockPlatformInterfaceMixin
    implements DerivPasskeysPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DerivPasskeysPlatform initialPlatform = DerivPasskeysPlatform.instance;

  test('$MethodChannelDerivPasskeys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDerivPasskeys>());
  });

  test('getPlatformVersion', () async {
    DerivPasskeys derivPasskeysPlugin = DerivPasskeys();
    MockDerivPasskeysPlatform fakePlatform = MockDerivPasskeysPlatform();
    DerivPasskeysPlatform.instance = fakePlatform;

    expect(await derivPasskeysPlugin.getPlatformVersion(), '42');
  });
}
