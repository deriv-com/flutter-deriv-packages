import 'package:deriv_passkeys/interactor/services/deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMethodChannel extends MethodChannel {
  MockMethodChannel() : super('deriv_passkeys');

  Future<Object?> handler(MethodCall methodCall) async =>
      invokeMethod<Object?>(methodCall.method, methodCall.arguments);

  @override
  Future<T?> invokeMethod<T>(String method, [dynamic arguments]) async {
    switch (method) {
      case 'getPlatformVersion':
        return '42' as T?;
      case 'createCredential':
        final String options = arguments['options'];
        if (options == 'valid options') {
          return 'credential created' as T?;
        } else {
          throw PlatformException(
            code: 'invalid_argument',
            message: 'Invalid options provided',
          );
        }
      case 'getCredential':
        final String options = arguments['options'];
        if (options == 'valid options') {
          return 'credential retrieved' as T?;
        } else {
          throw PlatformException(
            code: 'invalid_argument',
            message: 'Invalid options provided',
          );
        }
      default:
        throw PlatformException(
          code: 'method_not_implemented',
          message: 'Method not implemented on platform',
        );
    }
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannelDerivPasskeys platform;
  late MockMethodChannel mockChannel;

  setUp(() {
    mockChannel = MockMethodChannel();
    platform = MethodChannelDerivPasskeys();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      mockChannel,
      mockChannel.handler,
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mockChannel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('createCredential with valid options', () async {
    const String options = 'valid options';
    final String? response = await platform.createCredential(options);
    expect(response, 'credential created');
  });

  test('createCredential with invalid options throws PlatformException', () {
    const String options = 'invalid options';
    expect(
      () => platform.createCredential(options),
      throwsA(isA<PlatformException>()),
    );
  });

  test('getCredential with valid options', () async {
    const String options = 'valid options';
    final String? response = await platform.getCredential(options);
    expect(response, 'credential retrieved');
  });

  test('getCredential with invalid options throws PlatformException', () {
    const String options = 'invalid options';
    expect(
      () => platform.getCredential(options),
      throwsA(isA<PlatformException>()),
    );
  });

  test('Method not implemented throws PlatformException', () async {
    expect(
      () => platform.methodChannel.invokeMethod('nonExistentMethod'),
      throwsA(isA<PlatformException>()),
    );
  });
}
