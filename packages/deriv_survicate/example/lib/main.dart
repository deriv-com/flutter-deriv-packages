import 'package:flutter/material.dart';

import 'package:deriv_survicate/deriv_survicate.dart';
import 'package:deriv_survicate/models/answer_model.dart';
import 'package:deriv_survicate/models/user_traits_model.dart';

void main() => runApp(App());

/// Example app.
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  DerivSurvicate derivSurvicate;

  AnswerModel answer;

  String surveyIdDisplayed;
  String surveyIdAnswered;
  int questionIdAnswered;
  String surveyIdClosed;
  String surveyIdCompleted;

  @override
  void initState() {
    super.initState();

    derivSurvicate ??= DerivSurvicate();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Flutter Survicate Example App')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: const Text('Invoke event SURVEY'),
                  onPressed: () => derivSurvicate.invokeEvent('SURVEY'),
                ),
                RaisedButton(
                  child: const Text('Enter screen SCREEN'),
                  onPressed: () => derivSurvicate.enterScreen('SCREEN'),
                ),
                RaisedButton(
                  child: const Text('Leave screen SCREEN'),
                  onPressed: () => derivSurvicate.leaveScreen('SCREEN'),
                ),
                RaisedButton(
                  child: const Text('Set userId = 1 and first name = USER'),
                  onPressed: () => derivSurvicate.setUserTraits(
                    UserTraitsModel(userId: '1', firstName: 'USER'),
                  ),
                ),
                RaisedButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    setState(() {
                      surveyIdDisplayed = null;
                      surveyIdAnswered = null;
                      questionIdAnswered = null;
                      answer = null;
                      surveyIdClosed = null;
                      surveyIdCompleted = null;
                    });

                    derivSurvicate.reset();
                  },
                ),
                RaisedButton(
                  child: const Text('Register survey activity listeners'),
                  onPressed: () {
                    setState(() {
                      surveyIdDisplayed = null;
                      surveyIdAnswered = null;
                      questionIdAnswered = null;
                      answer = null;
                      surveyIdClosed = null;
                      surveyIdCompleted = null;
                    });

                    derivSurvicate.registerSurveyListeners(
                        callbackSurveyDisplayedListener: (String surveyId) {
                      setState(() => surveyIdDisplayed = surveyId);

                      return true;
                    }, callbackQuestionAnsweredListener: (
                      String surveyId,
                      int questionId,
                      AnswerModel answer,
                    ) {
                      setState(() {
                        surveyIdAnswered = surveyId;
                        questionIdAnswered = questionId;
                        this.answer = answer;
                      });

                      return true;
                    }, callbackSurveyClosedListener: (String surveyId) {
                      setState(() => surveyIdClosed = surveyId);

                      return true;
                    }, callbackSurveyCompletedListener: (String surveyId) {
                      setState(() => surveyIdCompleted = surveyId);

                      return true;
                    });
                  },
                ),
                RaisedButton(
                  child: const Text('Unregister survey activity listeners'),
                  onPressed: () {
                    setState(() {
                      surveyIdDisplayed = null;
                      surveyIdAnswered = null;
                      questionIdAnswered = null;
                      answer = null;
                      surveyIdClosed = null;
                      surveyIdCompleted = null;
                    });

                    derivSurvicate.unregisterSurveyListeners();
                  },
                ),
                surveyIdDisplayed != null
                    ? Text('Last survey displayed id = $surveyIdDisplayed')
                    : const SizedBox.shrink(),
                surveyIdDisplayed != null
                    ? const SizedBox(height: 8)
                    : const SizedBox.shrink(),
                questionIdAnswered != null
                    ? Text(
                        'Last question answered id = $questionIdAnswered from survey id = $surveyIdAnswered, answer type ${answer?.type}')
                    : const SizedBox.shrink(),
                questionIdAnswered != null
                    ? const SizedBox(height: 8)
                    : const SizedBox.shrink(),
                surveyIdClosed != null
                    ? Text('Last survey closed id = $surveyIdClosed')
                    : const SizedBox.shrink(),
                surveyIdClosed != null
                    ? const SizedBox(height: 8)
                    : const SizedBox.shrink(),
                surveyIdCompleted != null
                    ? Text('Last survey completed id = $surveyIdCompleted')
                    : const SizedBox.shrink(),
                surveyIdCompleted != null
                    ? const SizedBox(height: 8)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}
