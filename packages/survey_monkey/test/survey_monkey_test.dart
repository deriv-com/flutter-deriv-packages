import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_monkey/survey_monkey.dart';
import 'package:survey_monkey/survey_monkey_response.dart';

void main() {
  const MethodChannel channel = MethodChannel('survey_monkey');
  const String surveyHash = '1234567';
  List<MethodCall> log;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    log = <MethodCall>[];
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return '{"response":"{\\"completion_status\\": \\"completed\\", \\"respondent_id\\": \\"12278655271\\"}"}';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
    log.clear();
  });

  group('SurveyMonkey plugin tests =>', () {
    test('start the survey and get the completion result.', () async {
      final SurveyMonkeyResponse response =
          await SurveyMonkey.loadSurveyMonkey(surveyHash: surveyHash);

      expect(response.status, SurveyCompletionStatus.completed);
      expect(response.respondentId, '12278655271');
    });

    test('passes survey hash argument correctly.', () async {
      await SurveyMonkey.loadSurveyMonkey(surveyHash: surveyHash);

      expect(log, <Matcher>[
        isMethodCall('start', arguments: {'surveyHash': surveyHash}),
      ]);
    });
  });
}
