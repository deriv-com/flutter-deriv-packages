import 'package:analytics/sdk/firebase/core/firebase_configuration.dart';
import 'package:analytics/sdk/firebase/sdk/deriv_firebase_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  late DerivFirebaseAnalytics derivFirebaseAnalytics;
  late MockFirebaseAnalytics mockFirebaseAnalytics;

  setUp(() {
    mockFirebaseAnalytics = MockFirebaseAnalytics();
    derivFirebaseAnalytics = DerivFirebaseAnalytics(mockFirebaseAnalytics);
  });

  group('DerivFirebaseAnalytics', () {
    test('should return correct instance of DerivFirebaseAnalytics', () async {
      when(() => mockFirebaseAnalytics.setAnalyticsCollectionEnabled(true))
          .thenAnswer((_) async => true);
      const FirebaseConfiguration firebaseConfiguration =
          FirebaseConfiguration(isAnalyticsCollectionEnabled: true);

      await derivFirebaseAnalytics.setup(firebaseConfiguration);

      verify(() => mockFirebaseAnalytics.setAnalyticsCollectionEnabled(
          firebaseConfiguration.isAnalyticsCollectionEnabled)).called(1);
    });

    test('should return correct NavigatorObserver', () async {
      const String screenName = 'test_screen_name';

      when(() => mockFirebaseAnalytics.logScreenView(screenName: screenName))
          .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.setCurrentScreen(screenName: screenName);

      verify(() => mockFirebaseAnalytics.logScreenView(screenName: screenName))
          .called(1);
    });

    test('should call logAppOpen', () async {
      when(() => mockFirebaseAnalytics.logAppOpen())
          .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.logAppOpen();

      verify(() => mockFirebaseAnalytics.logAppOpen()).called(1);
    });

    test('should call logLogin with correct parameters', () async {
      const String loginMethod = 'test_login_method';

      when(() => mockFirebaseAnalytics.logLogin(loginMethod: loginMethod))
          .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.logLogin(loginMethod: loginMethod);

      verify(() => mockFirebaseAnalytics.logLogin(loginMethod: loginMethod))
          .called(1);
    });

    test('should call setUserId with correct parameters', () async {
      const String userId = 'test_user_id';

      when(() => mockFirebaseAnalytics.setUserId(id: userId))
          .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.setUserId(id: userId);

      verify(() => mockFirebaseAnalytics.setUserId(id: userId)).called(1);
    });

    test('should call logEvent with correct parameters', () async {
      const String name = 'test_name';
      const Map<String, Object> params = <String, Object>{};

      when(() => mockFirebaseAnalytics.logEvent(
            name: name,
            parameters: params,
          )).thenAnswer((_) async => true);

      await derivFirebaseAnalytics.logEvent(
        name: name,
        parameters: params,
      );

      verify(() => mockFirebaseAnalytics.logEvent(
            name: name,
            parameters: params,
          )).called(1);
    });

    test('should call setUserProperty with correct parameters', () async {
      const String name = 'test_name';
      const String value = 'test_value';

      when(() => mockFirebaseAnalytics.setUserProperty(
            name: name,
            value: value,
          )).thenAnswer((_) async => true);

      await derivFirebaseAnalytics.setUserProperty(
        name: name,
        value: value,
      );

      verify(() => mockFirebaseAnalytics.setUserProperty(
            name: name,
            value: value,
          )).called(1);
    });
  });
}
