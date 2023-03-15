import 'package:test/test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  group('base state emitter test =>', () {
    final BaseBlocManager blocManager = BlocManager.instance;

    late BaseStateEmitter<MockStateListener, GenericBloc> emitter;

    setUp(() {
      emitter = MockStateEmitter(blocManager);
    });

    test('handles states correctly.', () {
      const bool state = true;

      final MockStateListener listener = MockStateListener();

      emitter.handleStates(stateListener: listener, state: state);

      expect(listener.onStateChanged(state), isTrue);
    });

    test('calls handleStates with correct arguments.', () {
      const bool state = false;

      final MockStateListener listener = MockStateListener();

      emitter.call(stateListener: listener, state: state);

      expect(listener.onStateChanged(state), isTrue);
    });
  });
}

class MockStateListener implements BaseStateListener {
  bool onStateChanged(Object state) => state is bool;
}

class MockStateEmitter
    extends BaseStateEmitter<MockStateListener, GenericBloc> {
  MockStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required MockStateListener stateListener,
    required Object state,
  }) {}
}
