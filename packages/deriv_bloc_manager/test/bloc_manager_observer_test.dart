import 'package:test/test.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  group('BlocManagerObserver tests =>', () {
    late final BlocManagerObserver observer;
    final List<String> logs = <String>[];

    setUpAll(() {
      observer = BlocManagerObserver(
        verboseChangeStateLogs: true,
        enableOnChangeLogs: true,
        onCreateCallback: (BlocBase<dynamic> bloc) =>
            logs.add('Bloc created: ${bloc.runtimeType}'),
        onChangeCallback: ({
          required BlocBase<dynamic> bloc,
          required Change<dynamic> change,
        }) =>
            logs.add(
          'Bloc state: ${bloc.runtimeType} state changed from ${change.currentState.runtimeType} to ${change.nextState.runtimeType}',
        ),
        onCloseCallback: (BlocBase<dynamic> bloc) =>
            logs.add('Bloc closed: ${bloc.runtimeType}'),
        onErrorCallback: ({
          required BlocBase<dynamic> bloc,
          required Object error,
          required StackTrace stackTrace,
        }) =>
            logs.add('Bloc error: ${bloc.runtimeType}\n$error\n$stackTrace'),
      );
    });

    test('should log create events.', () {
      final MockBloc bloc = MockBloc();

      observer.onCreate(bloc);

      expect(logs, contains('Bloc created: MockBloc'));
    });

    test('should log change events.', () {
      const Change<int> change = Change<int>(currentState: 0, nextState: 1);
      final MockBloc bloc = MockBloc();

      observer.onChange(bloc, change);

      expect(
        logs,
        contains('Bloc state: MockBloc state changed from int to int'),
      );
    });

    test('should log change events.', () {
      const Change<int> change = Change<int>(currentState: 0, nextState: 1);
      final MockBloc bloc = MockBloc();

      observer.onChange(bloc, change);

      expect(
        logs,
        contains('Bloc state: MockBloc state changed from int to int'),
      );
    });

    test('should log close events.', () {
      final MockBloc bloc = MockBloc();

      observer.onClose(bloc);

      expect(logs, contains('Bloc closed: MockBloc'));
    });

    test('should log error events.', () {
      final MockBloc bloc = MockBloc();
      final Exception error = Exception('Test error');
      final StackTrace stackTrace = StackTrace.current;

      observer.onError(bloc, error, stackTrace);

      expect(
        logs,
        contains('Bloc error: MockBloc\nException: Test error\n$stackTrace'),
      );
    });
  });
}

class MockBloc extends BlocBase<dynamic> {
  MockBloc() : super(0);
}
