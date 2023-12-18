import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  group('StateDispatcher tests =>', () {
    test('should register and dispatch states to listeners.', () {
      final BlocManager blocManager = BlocManager.instance
        ..register(TestBloc())
        ..register(TestBloc(), key: 'ListenerBlocKey');

      StateDispatcher(blocManager, listenerKey: 'TestStateListener')
          .register<TestBloc, TestStateEmitter>(
        (BaseBlocManager blocManager) => TestStateEmitter(blocManager),
      );

      Future<void>.delayed(Duration.zero, () {
        expect(blocManager.fetch<TestBloc>().state, false);
        expect(blocManager.fetch<TestBloc>('ListenerBlocKey').state, false);
      });

      blocManager.fetch<TestBloc>().emit(true);

      Future<void>.delayed(Duration.zero, () {
        expect(blocManager.fetch<TestBloc>().state, true);
        expect(blocManager.fetch<TestBloc>('ListenerBlocKey').state, true);
      });

      blocManager.fetch<TestBloc>().emit(false);

      Future<void>.delayed(Duration.zero, () {
        expect(blocManager.fetch<TestBloc>().state, false);
        expect(blocManager.fetch<TestBloc>('ListenerBlocKey').state, false);
      });
    });
  });
}

class TestBloc extends BlocBase<bool> implements TestStateListener {
  TestBloc({bool state = false}) : super(state);

  @override
  void onEvent({required bool value}) => emit(value);
}

abstract class TestStateListener extends BaseStateListener {
  void onEvent({required bool value});
}

class TestStateEmitter extends BaseStateEmitter<TestStateListener, TestBloc> {
  TestStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required TestStateListener stateListener,
    required Object state,
  }) {
    if (state is bool) {
      stateListener.onEvent(value: state);
    }
  }
}
