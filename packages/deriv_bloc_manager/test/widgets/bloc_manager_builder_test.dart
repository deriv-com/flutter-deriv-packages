import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  const String blocKey = 'CUBIT_KEY';

  group('bloc manager builder test =>', () {
    setUp(() => BlocManager.instance.register(MockCube(), key: blocKey));

    testWidgets('should render the bloc builder.', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerBuilder<MockCube, int>(
            blocKey: blocKey,
            builder: (BuildContext context, int state) => Text('state: $state'),
          ),
        ),
      );

      expect(find.text('state: 0'), findsOneWidget);
    });

    testWidgets('should call build when if provided.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerBuilder<MockCube, int>(
            blocKey: blocKey,
            buildWhen: (int previousState, int currentState) =>
                previousState != currentState,
            builder: (BuildContext context, int state) => Text('state: $state'),
          ),
        ),
      );

      expect(find.text('state: 0'), findsOneWidget);

      BlocManager.instance.fetch<MockCube>(blocKey).update(1);
      await tester.pump();

      expect(find.text('state: 1'), findsOneWidget);
    });
  });
}

class MockCube extends Cubit<int> {
  MockCube() : super(0);

  void update(int value) => emit(value);
}
