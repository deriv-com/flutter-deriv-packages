import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_bloc_manager/base_state_emitter.dart';
import 'package:flutter_deriv_bloc_manager/base_state_listener.dart';

/// Function signature for `BlocManagerListenerHandler`.
typedef BlocManagerListenerHandler = void Function(Object state);

/// Bloc manager interface.
///
/// This interface defines contract for bloc managers.
abstract class BaseBlocManager {
  /// Default bloc key.
  static const String defaultKey = 'default';

  /// Stores registered blocs instances.
  Map<String, BlocBase<Object>> get repository;

  /// Registers a bloc to bloc manager, the bloc will be instantiated whenever needed.
  ///
  /// [predicate] is required.
  ///
  /// [key] is registered bloc identifier,
  /// you can omit this parameter if you need only one bloc instance of type [B] in the repository.
  void lazyRegister<B extends BlocBase<Object>>(
    Function predicate, {
    String key = defaultKey,
  });

  /// Registers a bloc to bloc manager.
  ///
  /// [bloc] is required.
  ///
  /// [key] is registered bloc identifier,
  /// you can omit this parameter if you need only one bloc instance of type [B] in the repository.
  void register<B extends BlocBase<Object>>(
    B bloc, {
    String key = defaultKey,
  });

  /// Indicates that bloc of type [B] is registered or not.
  bool isBlocRegistered<B extends BlocBase<Object>>(String key);

  /// Fetches a bloc from bloc manager.
  B fetch<B extends BlocBase<Object>>([String key]);

  /// Adds a listener to bloc.
  ///
  /// [listenerKey] is an identifier for listener, this field is required.
  /// [handler] is a callback that will be executed when listener is called, this field is required.
  /// [key] is used to identify bloc, this field is optional and defaults to [defaultKey].
  void addListener<B extends BlocBase<Object>>({
    required String listenerKey,
    required BlocManagerListenerHandler handler,
    String key = defaultKey,
  });

  /// Removes listener from bloc manager.
  ///
  /// [key] is registered listener identifier.
  /// NOTE: if you need to check listener for specific bloc type leave it `empty`.
  Future<void> removeListener<B extends BlocBase<Object>>({
    String key = defaultKey,
  });

  /// Indicates that bloc of type [B] has listener or not.
  ///
  /// [key] is registered listener identifier, or bloc identifier if you need to check listener for specific bloc.
  bool hasListener<B extends BlocBase<Object>>(String key);

  /// Adds a [BaseStateEmitter] to bloc manager.
  void registerStateEmitter(
    BaseStateEmitter<BaseStateListener, BlocBase<Object>> stateEmitter,
  );

  /// Emits core blocs states.
  void emitCoreStates<
      E extends BaseStateEmitter<BaseStateListener, BlocBase<Object>>>({
    required BlocBase<Object> bloc,
    Object? state,
  });

  /// Disposes the bloc of type [B].
  Future<void> dispose<B extends BlocBase<Object>>([String key = defaultKey]);
}
