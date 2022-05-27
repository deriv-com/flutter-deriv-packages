import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_live_chat/deriv_live_chat.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('deriv_live_chat');

  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      switch (methodCall.method) {
        case 'derivLiveChatView':
          return true;
        default:
          return null;
      }
    });
  });

  test('Start chat with Deriv Live Chat plugin without customParams', () async {
    await DerivLiveChat.startChatView(
      licenseId: 'licenseId',
      username: 'visitorName',
      email: 'visitorEmail',
      groupId: 'groupId',
    );
    expect(log, <Matcher>[
      isMethodCall(
        'derivLiveChatView',
        arguments: <String, dynamic>{
          'licenseId': 'licenseId',
          'visitorName': 'visitorName',
          'visitorEmail': 'visitorEmail',
          'groupId': 'groupId',
          'customParams': null,
        },
      ),
    ]);
  });
}
