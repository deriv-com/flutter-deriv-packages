// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_survicate/deriv_survicate.dart';
import 'package:deriv_survicate/models/answer_model.dart';
import 'package:deriv_survicate/models/user_traits_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('deriv_survicate');

  final DerivSurvicate derivSurvicate = DerivSurvicate();

  setUpAll(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'registerSurveyListeners':
        case 'unregisterSurveyListeners':
        case 'invokeEvent':
        case 'enterScreen':
        case 'leaveScreen':
        case 'setUserTraits':
        case 'reset':
          return true;

        default:
          return derivSurvicate.methodCallsHandler(methodCall);
      }
    });
  });

  tearDown(
    () => derivSurvicate
      ..onSurveyDisplayedListener = null
      ..onQuestionAnsweredListener = null
      ..onSurveyClosedListener = null
      ..onSurveyCompletedListener = null,
  );

  tearDownAll(() => channel.setMockMethodCallHandler(null));

  group('Reset =>', () {
    test('Return true upon correctly calling reset.', () async {
      expect(await derivSurvicate.reset(), true);
    });
  });

  group('Set User Traits =>', () {
    test('Return false if user traits are null.', () async {
      expect(await derivSurvicate.setUserTraits(null), false);
    });

    test('Return false if user traits are all null.', () async {
      expect(await derivSurvicate.setUserTraits(UserTraitsModel()), false);
    });

    test('Return false if user traits are all empty.', () async {
      expect(
        await derivSurvicate.setUserTraits(
          UserTraitsModel(customTraits: <String, String>{}),
        ),
        false,
      );
    });

    test('Return true if any user trait is not empty.', () async {
      expect(
        await derivSurvicate.setUserTraits(
          UserTraitsModel(userId: 'userId', customTraits: <String, String>{}),
        ),
        true,
      );
    });

    test('Return true if all user traits are filled.', () async {
      expect(
        await derivSurvicate.setUserTraits(
          UserTraitsModel(
            userId: 'userId',
            firstName: 'userName',
            addressFirstLine: 'addressFirstLine',
            addressSecondLine: 'addressSecondLine',
            annualRevenue: 'annualRevenue',
            city: 'city',
            department: 'department',
            email: 'email',
            employees: 'employees',
            fax: 'fax',
            industry: 'industry',
            jobTitle: 'jobTitle',
            lastName: 'lastName',
            organization: 'organization',
            phone: 'phone',
            state: 'state',
            website: 'website',
            zipCode: 'zipCode',
            customTraits: <String, String>{'customKey': 'customValue'},
          ),
        ),
        true,
      );
    });
  });

  group('Leave Screen =>', () {
    test('Return false if screen name is null.', () async {
      expect(await derivSurvicate.leaveScreen(null), false);
    });

    test('Return false if screen name is empty.', () async {
      expect(await derivSurvicate.leaveScreen(''), false);
    });

    test('Return true if screen name is passed.', () async {
      expect(await derivSurvicate.leaveScreen('screenName'), true);
    });
  });

  group('Enter Screen =>', () {
    test('Return false if screen name is null.', () async {
      expect(await derivSurvicate.enterScreen(null), false);
    });

    test('Return false if screen name is empty.', () async {
      expect(await derivSurvicate.enterScreen(''), false);
    });

    test('Return true if screen name is passed.', () async {
      expect(await derivSurvicate.enterScreen('screenName'), true);
    });
  });

  group('Invoke Event =>', () {
    test('Return false if event name is null.', () async {
      expect(await derivSurvicate.invokeEvent(null), false);
    });

    test('Return false if event name is empty.', () async {
      expect(await derivSurvicate.invokeEvent(''), false);
    });

    test('Return true if event name is passed.', () async {
      expect(await derivSurvicate.invokeEvent('eventName'), true);
    });
  });

  group('Register Survey Listeners =>', () {
    test('Return false if the callbacks are null.', () async {
      expect(await derivSurvicate.registerSurveyListeners(), false);
    });

    test('Return true if the callbacks are passed and previously registered.',
        () async {
      final SurveyActionHandler newCallback = (String surveyId) => true;
      final QuestionAnsweredHandler newCallbackQuestion =
          (String surveyId, int questionId, AnswerModel answer) => true;
      final SurveyActionHandler previousCallback = (String surveyId) => false;
      final QuestionAnsweredHandler previousCallbackQuestion =
          (String surveyId, int questionId, AnswerModel answer) => false;

      derivSurvicate
        ..onSurveyDisplayedListener = previousCallback
        ..onQuestionAnsweredListener = previousCallbackQuestion;

      expect(
        await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback),
        true,
      );

      expect(derivSurvicate.onSurveyDisplayedListener('surveyId'), true);

      expect(
        derivSurvicate.onQuestionAnsweredListener(
          'surveyId',
          1,
          AnswerModel.fromMap(<String, String>{
            'type': 'type',
            'id': null,
            'ids': null,
            'value': null,
          }),
        ),
        true,
      );

      expect(derivSurvicate.onSurveyClosedListener('surveyId'), true);
      expect(derivSurvicate.onSurveyCompletedListener('surveyId'), true);
    });

    test('Return true if the callback is passed and not previously registered',
        () async {
      final SurveyActionHandler newCallback = (String surveyId) => true;
      final QuestionAnsweredHandler newCallbackQuestion =
          (String surveyId, int questionId, AnswerModel answer) => true;

      expect(
        await derivSurvicate.registerSurveyListeners(
          callbackSurveyDisplayedListener: newCallback,
          callbackQuestionAnsweredListener: newCallbackQuestion,
          callbackSurveyClosedListener: newCallback,
          callbackSurveyCompletedListener: newCallback,
        ),
        true,
      );
      expect(derivSurvicate.onSurveyDisplayedListener('surveyId'), true);

      expect(
        derivSurvicate.onQuestionAnsweredListener(
          'surveyId',
          1,
          AnswerModel.fromMap(
            <String, dynamic>{
              'type': 'type',
              'id': 1,
              'ids': <int>[1, 2, 3],
              'value': 'value'
            },
          ),
        ),
        true,
      );

      expect(derivSurvicate.onSurveyClosedListener('surveyId'), true);
      expect(derivSurvicate.onSurveyCompletedListener('surveyId'), true);
    });
  });

  group('Unregister Survey Listeners =>', () {
    test('Return false if the registered listener is null', () async {
      expect(await derivSurvicate.unregisterSurveyListeners(), false);
    });

    test('Return true if there was a previous registered listener', () async {
      final SurveyActionHandler previousCallback = (String surveyId) => true;
      final QuestionAnsweredHandler previousCallbackQuestion =
          (String surveyId, int questionId, AnswerModel answer) => false;

      derivSurvicate
        ..onSurveyDisplayedListener = previousCallback
        ..onQuestionAnsweredListener = previousCallbackQuestion
        ..onSurveyClosedListener = previousCallback
        ..onSurveyCompletedListener = previousCallback;

      expect(await derivSurvicate.unregisterSurveyListeners(), true);
      expect(derivSurvicate.onSurveyDisplayedListener, null);
      expect(derivSurvicate.onQuestionAnsweredListener, null);
      expect(derivSurvicate.onSurveyClosedListener, null);
      expect(derivSurvicate.onSurveyCompletedListener, null);
    });
  });

  group('Method Calls Handler =>', () {
    test('non-existing method callback', () async {
      final Map<String, String> arguments = <String, String>{};

      arguments['argument'] = 'argument';

      try {
        await channel.invokeMethod<void>('non-existing-method', arguments);
        fail('exception not thrown');
      } on Exception catch (e) {
        expect(e, isInstanceOf<MissingPluginException>());
      }
    });

    group('On Survey Displayed Listener =>', () {
      test('Return false if there is no survey displayed listener attached',
          () async {
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await channel.invokeMethod<bool>('onSurveyDisplayed', arguments),
          false,
        );
      });

      test('Return false if no argument is passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyDisplayed', null),
          false,
        );
      });

      test('Return false if the expected arguments are not passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, String> arguments = <String, String>{};

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyDisplayed', arguments),
          false,
        );
      });

      test('Return true if the listener is called with the expected arguments',
          () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyDisplayed', arguments),
          true,
        );
      });
    });

    group('On Question Answered Listener =>', () {
      test('Return false if there is no survey displayed listener attached',
          () async {
        final Map<String, dynamic> arguments = <String, dynamic>{};

        arguments['surveyId'] = 'surveyId';
        arguments['questionId'] = 1;
        arguments['answer'] = <String, dynamic>{
          'type': 'type',
          'id': 1,
          'ids': <int>[1, 2, 3],
          'value': 'value'
        };

        expect(
          await channel.invokeMethod<bool>('onQuestionAnswered', arguments),
          false,
        );
      });

      test('Return false if no argument is passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onQuestionAnswered', null),
          false,
        );
      });

      test('Return false if the expected arguments are not passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, dynamic> arguments = <String, dynamic>{};

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onQuestionAnswered', arguments),
          false,
        );
      });

      test('Return true if the listener is called with the expected arguments',
          () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, dynamic> arguments = <String, dynamic>{};

        arguments['surveyId'] = 'surveyId';
        arguments['questionId'] = 1;
        arguments['answer'] = <String, dynamic>{
          'type': 'type',
          'id': 1,
          'ids': <int>[1, 2, 3],
          'value': 'value'
        };

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onQuestionAnswered', arguments),
          true,
        );
      });
    });

    group('On Survey Closed Listener =>', () {
      test('Return false if there is no survey displayed listener attached',
          () async {
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await channel.invokeMethod<bool>('onSurveyClosed', arguments),
          false,
        );
      });

      test('Return false if no argument is passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(await channel.invokeMethod<bool>('onSurveyClosed', null), false);
      });

      test('Return false if the expected arguments are not passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, String> arguments = <String, String>{};

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyClosed', arguments),
          false,
        );
      });

      test('Return true if the listener is called with the expected arguments',
          () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyClosed', arguments),
          true,
        );
      });
    });

    group('On Survey Completed Listener =>', () {
      test('Return false if there is no survey displayed listener attached',
          () async {
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await channel.invokeMethod<bool>('onSurveyCompleted', arguments),
          false,
        );
      });

      test('Return false if no argument is passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyCompleted', null),
          false,
        );
      });

      test('Return false if the expected arguments are not passed', () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;

        final Map<String, String> arguments = <String, String>{};

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyCompleted', arguments),
          false,
        );
      });

      test('Return true if the listener is called with the expected arguments',
          () async {
        final SurveyActionHandler newCallback = (String surveyId) => true;
        final QuestionAnsweredHandler newCallbackQuestion =
            (String surveyId, int questionId, AnswerModel answer) => true;
        final Map<String, String> arguments = <String, String>{};

        arguments['surveyId'] = 'surveyId';

        expect(
          await derivSurvicate.registerSurveyListeners(
            callbackSurveyDisplayedListener: newCallback,
            callbackQuestionAnsweredListener: newCallbackQuestion,
            callbackSurveyClosedListener: newCallback,
            callbackSurveyCompletedListener: newCallback,
          ),
          true,
        );

        expect(
          await channel.invokeMethod<bool>('onSurveyCompleted', arguments),
          true,
        );
      });
    });
  });
}
