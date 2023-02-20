import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  const String blocKey = 'CUBIT_KEY';

  group('bloc manager listener test =>', () {
    setUp(() => BlocManager.instance.register(MockCube(), key: blocKey));

    testWidgets('should render the bloc listener.',
        (WidgetTester tester) async {
      int currentState = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerListener<MockCube, int>(
            blocKey: blocKey,
            listener: (BuildContext context, int state) => currentState = state,
            child: const SizedBox.shrink(),
          ),
        ),
      );

      expect(currentState, -1);
    });

    testWidgets('should call listen when if provided.',
        (WidgetTester tester) async {
      int currentState = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerListener<MockCube, int>(
            blocKey: blocKey,
            listenWhen: (int previousState, int currentState) =>
                previousState != currentState,
            listener: (BuildContext context, int state) => currentState = state,
            child: const SizedBox.shrink(),
          ),
        ),
      );

      expect(currentState, -1);

      BlocManager.instance.fetch<MockCube>(blocKey).update(1);
      await tester.pump();

      expect(currentState, 1);
    });
  });
}

class MockCube extends Cubit<int> {
  MockCube() : super(0);

  void update(int value) => emit(value);
}
