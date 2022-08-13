import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  const String blocKey = 'CUBIT_KEY';
  const String firstListenerKey = 'CUBIT_FIRST_LISTENER_KEY';
  const String secondListenerKey = 'CUBIT_SECOND_LISTENER_KEY';

  late final BaseBlocManager blocManager;

  setUpAll(() => blocManager = BlocManager.instance);

  tearDownAll(() {
    blocManager
      ..dispose<_TestCubit>()
      ..dispose<_TestCubit>(blocKey);
  });

  group('bloc manager =>', () {
    test('should register and fetch cubit from bloc manager.', () {
      blocManager.lazyRegister<_TestCubit>(() => _TestCubit());

      expect(blocManager.fetch<_TestCubit>(), isA<Cubit<bool>>());
    });

    blocTest<_TestCubit, bool>(
      'emits trueState() and register a listener for bloc manager.',
      build: () {
        blocManager.addListenerFor<_TestCubit>(
          listenerKey: 'TestCubitListener',
          handler: (Object state) => expect(state, isTrue),
        );

        return blocManager.fetch<_TestCubit>();
      },
      act: (_TestCubit cubit) => <void>[cubit.trueState()],
      expect: () => <bool>[true],
    );

    test(
        'should remove listener from bloc manager with a proper [listenerKey].',
        () async {
      blocManager
        ..register(_TestCubit())
        ..register(_TestCubit(), key: blocKey)
        ..addListenerFor<_TestCubit>(
          listenerKey: firstListenerKey,
          handler: (Object state) => expect(state, isTrue),
          key: blocKey,
        )
        ..addListenerFor<_TestCubit>(
          listenerKey: secondListenerKey,
          handler: (Object state) => expect(state, isTrue),
        );

      await blocManager.removeListenersForType<_TestCubit>(
          key: firstListenerKey);

      expect(
        blocManager.hasListener<_TestCubit>(firstListenerKey),
        isFalse,
      );

      expect(
        blocManager.hasListener<_TestCubit>(secondListenerKey),
        isTrue,
      );
    });

    test(
        'should remove all listeners from bloc manager for a specific bloc type.',
        () async {
      blocManager
        ..register(_TestCubit(), key: blocKey)
        ..addListenerFor<_TestCubit>(
          listenerKey: firstListenerKey,
          handler: (Object state) => expect(state, isTrue),
          key: blocKey,
        )
        ..addListenerFor<_TestCubit>(
          listenerKey: secondListenerKey,
          handler: (Object state) => expect(state, isTrue),
          key: blocKey,
        );

      await blocManager.removeListenersForType<_TestCubit>();

      expect(
        blocManager.hasListener<_TestCubit>(blocKey),
        isFalse,
      );
    });

    test(
        'should remove all listeners from bloc manager for a specific listener key.',
        () async {
      blocManager
        ..register(_TestCubit(), key: blocKey)
        ..register(_AnotherTestCubit(), key: blocKey)
        ..addListenerFor<_TestCubit>(
          listenerKey: firstListenerKey,
          handler: (Object state) => expect(state, isTrue),
          key: blocKey,
        )
        ..addListenerFor<_AnotherTestCubit>(
          listenerKey: firstListenerKey,
          handler: (Object state) => expect(state, isTrue),
          key: blocKey,
        );

      await blocManager.removeListeners(firstListenerKey);

      expect(
        blocManager.hasListener<_TestCubit>(blocKey),
        isFalse,
      );
      expect(
        blocManager.hasListener<_AnotherTestCubit>(blocKey),
        isFalse,
      );
    });
  });
}

class _TestCubit extends Cubit<bool> {
  _TestCubit() : super(false);

  void trueState() => emit(true);

  void falseState() => emit(false);
}

class _AnotherTestCubit extends Cubit<bool> {
  _AnotherTestCubit() : super(false);

  void trueState() => emit(true);

  void falseState() => emit(false);
}
