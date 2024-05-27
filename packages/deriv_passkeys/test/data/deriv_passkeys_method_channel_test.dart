import 'package:deriv_passkeys/src/data/platform/deriv_passkeys_method_channel.dart';
import 'package:deriv_passkeys/src/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMethodChannel extends MethodChannel {
  MockMethodChannel() : super('deriv_passkeys');

  Future<Object?> handler(MethodCall methodCall) async =>
      invokeMethod<Object?>(methodCall.method, methodCall.arguments);

  @override
  Future<T?> invokeMethod<T>(String method, [dynamic arguments]) async {
    switch (method) {
      case 'isPlatformSupported':
        return true as T?;
      case 'createCredential':
        final String options = arguments['options'];
        if (options == 'valid_options') {
          return 'credential created' as T?;
        } else if (options == 'user_cancelled') {
          throw PlatformException(
            code: 'CreateCredentialCancellationException',
            message: 'CreateCredentialCancellationException',
          );
        } else {
          throw PlatformException(
            code: 'invalid_argument',
            message: 'Invalid options provided',
          );
        }
      case 'getCredential':
        final String options = arguments['options'];
        if (options == 'valid_options') {
          return 'credential retrieved' as T?;
        } else if (options == 'user_cancelled') {
          throw PlatformException(
            code: 'GetCredentialCancellationException',
            message: 'GetCredentialCancellationException',
          );
        } else if (options == 'no_credential') {
          throw PlatformException(
            code: 'NoCredentialException',
            message: 'GetCredentialCancellationException',
          );
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

  test('isSupported', () async {
    expect(await platform.isPlatformSupported(), isTrue);
  });

  test('createCredential with valid options', () async {
    const String options = 'valid_options';
    final String? response = await platform.createCredential(options);
    expect(response, 'credential created');
  });

  test('createCredential with user cancelled throws CanceledPlatformException',
      () {
    const String options = 'user_cancelled';
    expect(
      () => platform.createCredential(options),
      throwsA(isA<CanceledPlatformException>()),
    );
  });

  test('createCredential with invalid options throws PlatformException', () {
    const String options = 'invalid options';
    expect(
      () => platform.createCredential(options),
      throwsA(isA<PlatformException>()),
    );
  });

  test('getCredential with valid options', () async {
    const String options = 'valid_options';
    final String? response = await platform.getCredential(options);
    expect(response, 'credential retrieved');
  });

  test('getCredential with user cancelled throws CanceledPlatformException',
      () {
    const String options = 'user_cancelled';
    expect(
      () => platform.getCredential(options),
      throwsA(isA<CanceledPlatformException>()),
    );
  });

  test('getCredential with no credential throws NoCredentialPlatformException',
      () {
    const String options = 'no_credential';
    expect(
      () => platform.getCredential(options),
      throwsA(isA<NoCredentialPlatformException>()),
    );
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
