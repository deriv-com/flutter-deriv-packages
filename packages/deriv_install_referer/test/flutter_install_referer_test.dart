import 'package:flutter/services.dart';
import 'package:flutter_install_referer/flutter_install_referer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_install_referer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler(
        (MethodCall methodCall) async => <String, String>{});
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterInstallReferer.installReferer, <String, String>{});
  });
}
