import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  const String blocKey = 'CUBIT_KEY';

  group('bloc manager builder test =>', () {
    setUp(() => BlocManager.instance.register(MockCube(0), key: blocKey));

    testWidgets('should render the bloc builder.', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerBuilder<MockCube>(
            blocKey: blocKey,
            disposeBloc: true,
            builder: (BuildContext context, Object state) =>
                Text('state: $state'),
          ),
        ),
      );

      expect(find.text('state: 0'), findsOneWidget);
    });

    testWidgets('should call build when if provided.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocManagerBuilder<MockCube>(
            blocKey: blocKey,
            disposeBloc: true,
            builder: (BuildContext context, Object state) =>
                Text('state: $state'),
            buildWhen: (Object previousState, Object currentState) =>
                previousState != currentState,
          ),
        ),
      );

      expect(find.text('state: 0'), findsOneWidget);

      BlocManager.instance.fetch<MockCube>(blocKey).add(1);
      await tester.pump();

      expect(find.text('state: 1'), findsOneWidget);
    });
  });
}

class MockCube extends Cubit<int> {
  MockCube(int initialState) : super(initialState);

  void add(int value) => emit(value);
}
