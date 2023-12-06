import 'dart:async';

import 'package:example/features/tick_stream/interactor/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tick_stream_state.dart';

class TickSteamCubit extends Cubit<TickStreamState> {
  TickSteamCubit(this.service) : super(const TickStreamInitialState());

  final BaseTickStreamService service;

  StreamSubscription<TickStreamEntity>? _tickStreamSubscription;

  Future<void> fetchTickStream(String? symbol) async {
    await _initializeTickStream();

    if (symbol == null) {
      emit(const TickStreamInitialState());

      return;
    }

    try {
      _tickStreamSubscription = service
          .fetchTickStream(symbol)
          .listen((TickStreamEntity tick) => emit(TickStreamLoadedState(tick)))
        ..onError((Object error) => emit(TickStreamErrorState('$error')));
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }

  Future<void> _initializeTickStream() async {
    if (state is TickStreamLoadedState) {
      service.forgetTickStream((state as TickStreamLoadedState).tick.id);
    }

    emit(const TickStreamLoadingState());

    await _tickStreamSubscription?.cancel();
  }

  @override
  Future<void> close() async {
    await _tickStreamSubscription?.cancel();

    return super.close();
  }
}
