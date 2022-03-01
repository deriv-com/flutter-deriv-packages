import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:deriv_live_chat/deriv_live_chat.dart';

void main() {
  const MethodChannel channel = MethodChannel('derivLiveChat');

  TestWidgetsFlutterBinding.ensureInitialized();
  final List<MethodCall> log = <MethodCall>[];
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      switch (methodCall.method) {
        case 'DerivLiveChatView':
          return true;
        default:
          return null;
      }
    });
  });

  test('Start chat with Deriv Live Chat plugin without customParams', () async {
    await DerivLiveChat.startChatView(
      'licenseNo',
      'groupId',
      'visitorName',
      'visitorEmail',
    );
    expect(log, <Matcher>[
      isMethodCall(
        'DerivLiveChatView',
        arguments: <String, dynamic>{
          'licenseNo': 'licenseNo',
          'groupId': 'groupId',
          'visitorName': 'visitorName',
          'visitorEmail': 'visitorEmail',
          'customParams': null,
        },
      ),
    ]);
  });
}
