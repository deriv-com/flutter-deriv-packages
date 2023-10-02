import 'package:deriv_store_launcher/deriv_store_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('deriv_store_launcher');
  final List<MethodCall> methodCalls = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'openStore') {
        methodCalls.add(methodCall);
      }
      return null;
    });
  });

  test('openWithStore launches the app store', () async {
    await DerivStoreLauncher.openWithStore('app_id');
    expect(methodCalls, <Matcher>[
      isMethodCall('openStore', arguments: <String, dynamic>{
        'app_id': 'app_id',
      })
    ]);
  });
}
