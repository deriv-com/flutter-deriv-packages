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
    test('setup calls setAnalyticsCollectionEnabled', () async {
      when(() => mockFirebaseAnalytics.setAnalyticsCollectionEnabled(true))
        .thenAnswer((_) async => true);
      const FirebaseConfiguration firebaseConfiguration =
          FirebaseConfiguration(isAnalyticsCollectionEnabled: true);

      await derivFirebaseAnalytics.setup(firebaseConfiguration);

      verify(() =>
              mockFirebaseAnalytics.setAnalyticsCollectionEnabled(
                  firebaseConfiguration.isAnalyticsCollectionEnabled))
          .called(1);
    });

    test('setCurrentScreen calls setCurrentScreen', () async {
      const String screenName = 'test_screen_name';
      
      when(() => mockFirebaseAnalytics.setCurrentScreen(screenName: screenName))
        .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.setCurrentScreen(screenName: screenName);

      verify(() => mockFirebaseAnalytics.setCurrentScreen(screenName: screenName))
          .called(1);
    });

    test('logLogin calls logLogin', () async {
      const String loginMethod = 'test_login_method';
      
      when(() => mockFirebaseAnalytics.logLogin(loginMethod: loginMethod))
        .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.logLogin(loginMethod: loginMethod);

      verify(() => mockFirebaseAnalytics.logLogin(loginMethod: loginMethod))
          .called(1);
    });

    test('setUserId calls setUserId', () async {
      const String userId = 'test_user_id';
      
      when(() => mockFirebaseAnalytics.setUserId(id: userId))
        .thenAnswer((_) async => true);

      await derivFirebaseAnalytics.setUserId(id: userId);

      verify(() => mockFirebaseAnalytics.setUserId(id: userId))
          .called(1);
    });
    
  });
}
