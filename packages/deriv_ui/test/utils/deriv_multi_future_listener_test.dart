import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_ui/utils/deriv_multi_future_listener.dart';

void main() {
  group('DerivMultiFutureListener ', () {
    testWidgets('should call onDone when all passed futures get completed',
        (WidgetTester widgetTester) async {
      bool isDone = false;
      Object? receivedError;

      final Future<void> future1 =
          Future<void>.delayed(const Duration(seconds: 1));
      final Future<void> future2 =
          Future<void>.delayed(const Duration(seconds: 2));
      final Future<void> future3 =
          Future<void>.delayed(const Duration(seconds: 3));

      await widgetTester.pumpWidget(DerivMultiFutureListener(
        futures: <Future<void>>[future1, future2, future3],
        onDone: () => isDone = true,
        child: const SizedBox(),
        onError: (Object error) => receivedError = error,
      ));

      // Initially, nothing is completed.
      expect(isDone, false);
      expect(receivedError, isNull);

      // After future1 is completed,  future2 is still running.
      await widgetTester.pump(const Duration(seconds: 1));
      expect(isDone, false);
      expect(receivedError, isNull);

      // After all futures are completed.
      await widgetTester.pump(const Duration(seconds: 2));
      expect(isDone, true);
      expect(receivedError, isNull);
    });
    testWidgets('should call onError when one of passed futures fails',
        (WidgetTester widgetTester) async {
      bool isDone = false;
      Object? receivedError;

      final Exception mockedError = Exception('error');

      final Future<void> future1 =
          Future<void>.delayed(const Duration(seconds: 1));
      Future<void> future2Func() async {
        await Future<void>.delayed(const Duration(seconds: 2));
        await Future<void>.error(mockedError);
      }

      final Future<void> future3 =
          Future<void>.delayed(const Duration(seconds: 3));

      await widgetTester.pumpWidget(DerivMultiFutureListener(
        futures: <Future<void>>[future1, future2Func(), future3],
        onDone: () => isDone = true,
        child: const SizedBox(),
        onError: (Object error) => receivedError = error,
      ));

      // Initially, nothing is completed.
      expect(isDone, false);
      expect(receivedError, isNull);

      // After future1 is completed,  future2 is still running.
      await widgetTester.pump(const Duration(seconds: 1));
      expect(isDone, false);
      expect(receivedError, isNull);

      // After future2 is completed, future3 is still running.
      await widgetTester.pump(const Duration(seconds: 1));
      expect(isDone, false);
      expect(receivedError, mockedError);

      // After all futures are completed.
      await widgetTester.pump(const Duration(seconds: 1));
      expect(isDone, false);
      expect(receivedError, mockedError);
    });
  });
}
