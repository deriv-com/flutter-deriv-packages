import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import 'package:flutter_deriv_bloc_manager/listener_bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  late final BlocManager blocManager;

  setUpAll(() => blocManager = BlocManager.instance);

  group('listener bloc test =>', () {
    blocTest<ListenerExample1, int>(
        'listener cubit should receive emitter cubit current state + new state.',
        setUp: () async => blocManager.register(EmitterCubit1()),
        build: () {
          blocManager.register(ListenerExample1());
          return blocManager.fetch<ListenerExample1>();
        },
        act: (ListenerExample1 listenerCubit) async {
          expect(listenerCubit.state, 1);

          blocManager.fetch<EmitterCubit1>().changeState(10);
        },
        expect: () => <int>[10],
        tearDown: () {
          blocManager
            ..dispose<ListenerExample1>()
            ..dispose<EmitterCubit1>();
        });

    test('all listeners should get disposed when listener cubit get disposed.',
        () async {
      int listener1ReceivedState = 0;
      int listener2ReceivedState = 0;

      blocManager
        ..register(EmitterCubit1())
        ..register(EmitterCubit2())
        ..register(
          ListenerExample2(
              listener: (int state) => listener1ReceivedState = state),
          key: 'Listener1',
        )
        ..register(
          ListenerExample2(
              listener: (int state) => listener2ReceivedState = state),
          key: 'Listener2',
        );

      blocManager.fetch<EmitterCubit1>().changeState(5);
      await Future<void>.delayed(Duration.zero);
      expect(listener1ReceivedState, 5);
      expect(listener2ReceivedState, 5);

      await blocManager.dispose<ListenerExample2>('Listener1');

      blocManager.fetch<EmitterCubit1>().changeState(0);
      expect(listener1ReceivedState, 5);

      blocManager.fetch<EmitterCubit2>().changeState(0);
      expect(listener1ReceivedState, 5);

      await Future<void>.delayed(Duration.zero);
      expect(listener2ReceivedState, 0);
    });
  });
}

class EmitterCubit1 extends Cubit<int> {
  EmitterCubit1() : super(1);

  void changeState(int newState) => emit(newState);
}

class EmitterCubit2 extends Cubit<int> {
  EmitterCubit2() : super(2);

  void changeState(int newState) => emit(newState);
}

class ListenerExample1 extends ListenerBloc<int> {
  ListenerExample1() : super(0) {
    addListener<EmitterCubit1, int>(listener: onEmitterCubitState);
  }

  void onEmitterCubitState(int newState) => emit(newState);
}

class ListenerExample2 extends ListenerBloc<int> {
  final BlocManagerListenerHandler<int> listener;

  // ignore: sort_constructors_first
  ListenerExample2({required this.listener}) : super(0) {
    addListener<EmitterCubit1, int>(
      listener: listener,
      shouldAlsoReceiveCurrentState: false,
    );
    addListener<EmitterCubit2, int>(
      listener: listener,
      shouldAlsoReceiveCurrentState: false,
    );
  }
}
