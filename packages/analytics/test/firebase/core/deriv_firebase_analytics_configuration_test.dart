import 'package:analytics/sdk/firebase/core/firebase_configuration.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FirebaseConfiguration', () {
    test('FirebaseConfiguration with isAnalyticsCollectionEnabled true', () {
      const FirebaseConfiguration config =
          FirebaseConfiguration(isAnalyticsCollectionEnabled: true);

      expect(config.isAnalyticsCollectionEnabled, isTrue);
    });

    test('FirebaseConfiguration with isAnalyticsCollectionEnabled false', () {
      const FirebaseConfiguration config =
          FirebaseConfiguration(isAnalyticsCollectionEnabled: false);

      expect(config.isAnalyticsCollectionEnabled, isFalse);
    });
  });
}
