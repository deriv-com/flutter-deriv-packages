import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'models/answer_model.dart';
import 'models/user_traits_model.dart';

/// Survey action handler.
typedef SurveyActionHandler = bool Function(String surveyId);

/// Question action handler.
typedef QuestionAnsweredHandler = bool Function(
  String surveyId,
  int questionId,
  AnswerModel answer,
);

/// Client for accessing Survicate.
class DerivSurvicate {
  /// Constructor for the Client for accessing Survicate.
  DerivSurvicate() {
    _channel.setMethodCallHandler(methodCallsHandler);
  }

  /// listener triggered when survey gets loaded and appears in user’s interface.
  SurveyActionHandler onSurveyDisplayedListener;

  /// listener triggered after a response submitted to each question.
  QuestionAnsweredHandler onQuestionAnsweredListener;

  /// listener triggered after user closes the survey using the close button.
  SurveyActionHandler onSurveyClosedListener;

  /// triggered when user responds to their last question and therefore finishes a survey.
  SurveyActionHandler onSurveyCompletedListener;

  static const String _surveyIdKey = 'surveyId';
  static const String _questionIdKey = 'questionId';
  static const String _answerKey = 'answer';

  static const String _channelName = 'deriv_survicate';

  static const String _registerSurveyListenersKey = 'registerSurveyListeners';
  static const String _unregisterSurveyListenersKey =
      'unregisterSurveyListeners';

  static const String _eventNameKey = 'eventName';
  static const String _screenNameKey = 'screenName';
  static const String _invokeEventKey = 'invokeEvent';
  static const String _enterScreenKey = 'enterScreen';
  static const String _leaveScreenKey = 'leaveScreen';
  static const String _setUserTraitsKey = 'setUserTraits';
  static const String _resetKey = 'reset';

  static const String _onSurveyDisplayedKey = 'onSurveyDisplayed';
  static const String _onQuestionAnsweredKey = 'onQuestionAnswered';
  static const String _onSurveyClosedKey = 'onSurveyClosed';
  static const String _onSurveyCompletedKey = 'onSurveyCompleted';

  static const MethodChannel _channel = MethodChannel(_channelName);

  /// Registers Survey activity listeners
  ///
  /// [callbackSurveyDisplayedListener] the listener to be called when a survey gets loaded and appears in user’s interface.
  /// [callbackQuestionAnsweredListener] the listener to be called after a response submitted to each question.
  /// [callbackSurveyClosedListener] the listener to be called after user closes the survey using the close button.
  /// [callbackSurveyCompletedListener] the listener to be called when user responds to their last question and therefore finishes a survey.
  Future<bool> registerSurveyListeners({
    SurveyActionHandler callbackSurveyDisplayedListener,
    QuestionAnsweredHandler callbackQuestionAnsweredListener,
    SurveyActionHandler callbackSurveyClosedListener,
    SurveyActionHandler callbackSurveyCompletedListener,
  }) async {
    if (callbackSurveyDisplayedListener == null ||
        callbackQuestionAnsweredListener == null ||
        callbackSurveyClosedListener == null ||
        callbackSurveyCompletedListener == null) {
      return false;
    }

    if (!_isSurveyListenerRegistered()) {
      await _channel.invokeMethod<bool>(_registerSurveyListenersKey);
    }

    onSurveyDisplayedListener = callbackSurveyDisplayedListener;
    onQuestionAnsweredListener = callbackQuestionAnsweredListener;
    onSurveyClosedListener = callbackSurveyClosedListener;
    onSurveyCompletedListener = callbackSurveyCompletedListener;

    return _isSurveyListenerRegistered();
  }

  /// Method call handler.
  @visibleForTesting
  Future<dynamic> methodCallsHandler(MethodCall call) async {
    switch (call.method) {
      case _onSurveyDisplayedKey:
        return _handleSurveyDisplayed(call);
      case _onQuestionAnsweredKey:
        return _handleQuestionAnswered(call);
      case _onSurveyClosedKey:
        return _handleSurveyClosed(call);
      case _onSurveyCompletedKey:
        return _handleSurveyCompleted(call);

      default:
        throw MissingPluginException();
    }
  }

  bool _handleSurveyDisplayed(MethodCall call) {
    if (onSurveyDisplayedListener == null ||
        call.arguments == null ||
        !call.arguments.containsKey(_surveyIdKey)) {
      return false;
    }

    return onSurveyDisplayedListener(call.arguments[_surveyIdKey]);
  }

  bool _handleQuestionAnswered(MethodCall call) {
    if (onQuestionAnsweredListener == null ||
        call.arguments == null ||
        !call.arguments.containsKey(_surveyIdKey) ||
        !call.arguments.containsKey(_questionIdKey) ||
        !call.arguments.containsKey(_answerKey)) {
      return false;
    }

    final String surveyId = call.arguments[_surveyIdKey];
    final int questionId = call.arguments[_questionIdKey];
    final AnswerModel answer = AnswerModel.fromMap(call.arguments[_answerKey]);

    return onQuestionAnsweredListener(surveyId, questionId, answer);
  }

  bool _handleSurveyClosed(MethodCall call) {
    if (onSurveyClosedListener == null ||
        call.arguments == null ||
        !call.arguments.containsKey(_surveyIdKey)) {
      return false;
    }

    return onSurveyClosedListener(call.arguments[_surveyIdKey]);
  }

  bool _handleSurveyCompleted(MethodCall call) {
    if (onSurveyCompletedListener == null ||
        call.arguments == null ||
        !call.arguments.containsKey(_surveyIdKey)) {
      return false;
    }

    return onSurveyCompletedListener(call.arguments[_surveyIdKey]);
  }

  /// Unregisters Survey activity listeners
  ///
  Future<bool> unregisterSurveyListeners() async {
    if (!_isSurveyListenerRegistered()) {
      return false;
    }

    onSurveyDisplayedListener = null;
    onQuestionAnsweredListener = null;
    onSurveyClosedListener = null;
    onSurveyCompletedListener = null;

    return _channel.invokeMethod(_unregisterSurveyListenersKey);
  }

  /// You can log custom user events throughout your application.
  /// They can later be used in Survicate panel to trigger your surveys.
  /// Events trigger surveys instantly after occurring in your app.
  ///
  /// [eventName] the name of the event to be logged
  Future<bool> invokeEvent(String eventName) async {
    if (eventName == null || eventName.isEmpty) {
      return false;
    }

    return _channel.invokeMethod(_invokeEventKey, <String, dynamic>{
      _eventNameKey: eventName,
    });
  }

  /// A survey can appear when your application user is viewing a specific screen.
  /// As an example, a survey can be triggered to show up on the home screen of the application,
  /// after a user spends there more than 10 seconds.
  /// To achieve such effect, you need to send information to Survicate about user entering a screen.
  ///
  /// [screenName] the name of the screen the user is entering.
  Future<bool> enterScreen(String screenName) async {
    if (screenName == null || screenName.isEmpty) {
      return false;
    }

    return _channel.invokeMethod(_enterScreenKey, <String, dynamic>{
      _screenNameKey: screenName,
    });
  }

  /// A survey can appear when your application user is viewing a specific screen.
  /// As an example, a survey can be triggered to show up on the home screen of the application,
  /// after a user spends there more than 10 seconds.
  /// To achieve such effect, you need to send information to Survicate about user leaving a screen.
  ///
  /// [screenName] the name of the screen the user is leaving.
  Future<bool> leaveScreen(String screenName) async {
    if (screenName == null || screenName.isEmpty) {
      return false;
    }

    return _channel.invokeMethod(_leaveScreenKey, <String, dynamic>{
      _screenNameKey: screenName,
    });
  }

  /// You can assign custom attributes to your users.
  /// Those attributes can later be used to trigger the survey or even filter the survey results within Survicate panel.
  /// Please keep in mind that user traits are cached, you only have to provide them once, e.g. when user logs in, not after each initialize().
  /// You can also change their values at any time (which may potentially trigger showing the survey).
  ///
  /// [userTraits] the  custom attributes to be assigned to your users.
  Future<bool> setUserTraits(UserTraitsModel userTraits) async {
    if (userTraits == null || userTraits.toMap().isEmpty) {
      return false;
    }

    return _channel.invokeMethod(_setUserTraitsKey, userTraits.toMap());
  }

  /// This method will reset all user data stored on your device (views, traits, answers).
  /// If you need to test surveys on your device, this method might be helpful.
  Future<bool> reset() async => _channel.invokeMethod(_resetKey);

  bool _isSurveyListenerRegistered() =>
      onSurveyDisplayedListener != null ||
      onQuestionAnsweredListener != null ||
      onSurveyClosedListener != null ||
      onSurveyCompletedListener != null;
}
