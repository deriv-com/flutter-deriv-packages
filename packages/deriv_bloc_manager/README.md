# Multiplier project design pattern using BLoC

This article is about structuring Deriv Flutter app using BLoC pattern and how we avoided all the architectural issues we faced in previous projects.

### What is BLoC pattern?

**B**usiness **Lo**gic **C**omponent (BLoC) is a state management design pattern recommended for Flutter. It helps in managing the app state and acts as a bridge between a data source and the widgets that need the data. It receives data/events as a stream, handles any required business logic, then publishes results data streams to the interested widgets. To implement this pattern, we are using **bloc** and **flutter_bloc** plugins.

| ![BLoC](/docs/images/bloc_pattern.png) |
| :------------------------------------: |
|             _BLoC pattern_             |

### The problem

The recommended approach of using flutter_bloc in Flutter projects is by having at least one bloc associated with each screen/feature - something like a viewmodel in MVVM architecture - At the start, everything seemed to work perfectly, however, when the app grew and became more complex, we started to have difficulties managing the app due to the bloc’s high dependency on each other especially for global/common blocs that their states/values might be needed in various parts of the application such as account expiry and connectivity status.

In addition, adding new states for blocs caused an unexpected behavior because there is no single source of truth and a change in one place requires visiting many many classes to ensure the newly added state does not affect other parts of the code.

### Our Goal

In order to avoid the complexity and the difficulty to manage the app state and its business logic, we tried to find a way to achieve some kind of isolation between individual features/screen and global/common business logic, for example, feature A does not know about connectivity bloc and does not depend or listen to it, alternatively, the connectivity data will be provided to it.

The feature, however, will have its own widgets and business logic that are focused and only specific to that particular feature, hence, extracting it and reusing it in another project is possible and straightforward. That could only be achieved if the feature encapsulates its own data and business logic and has external data injected into it.

### The proposed solution

The solution is to;

- Separate global app state(s) from the app features and have the data provided to the feature when needed making it flexible and easier to test.
- Create a bloc manager in a single place that is responsible for handling bloc registration, fetching or disposing a registered bloc, and adding or removing state change listeners from a specific bloc.
- Use the bloc manager to listen to state changes in global/shared blocs and pass them to an event dispatcher.
- To have a single event dispatcher that is in charge of broadcasting events sent from the bloc manager to the active bloc expecting these events.
- Create a common/shared events interface that is used in different parts of the app, so they can be reused instead of code duplication.

The following diagrams show how the app is structured;

| ![Proposed BLoC pattern implementation](/docs/images/bloc_uml_diagram.png) |
| :------------------------------------------------------------------------: |
|                   _Proposed BLoC pattern implementation_                   |

### Usage

This section shows how to create a new bloc/cubit following the proposed architecture and use the bloc manager to coordinate and manage the blocs/cubits. In this example we will be using cubit;

1- Create a base events class which contains the events that are common in which a cubit class or other base events interfaces can implement. For example;

```dart
abstract class BaseEventListener {}

abstract class AuthEventListener implements BaseEventListener {
  void onLogin(Authorize authorizedAccount);

  void onLogout();
}

abstract class ConnectivityEventListener implements BaseEventListener {
  void onDisconnect(DisconnectSource source);

  void onConnect();
}
```

2- Create a cubit for a feature, let’s call it `FeatureCubit`. The cubit class will implement both `AuthEventListener` and `ConnectivityEventListener` so it can expose the 4 methods in addition to any other feature-specific events. The type of the state `FeatureCubit` is managing in this example, is **Status** with initial value as `initial`;

```dart
enum Status {
  initial,
  loading,
  disabled,
  enabled,
  loggedOut,
  loggedIn,
}
```

The `FeatureCubit` will expose the common/share `onConnect`, `onDisconnect`, `onLogout`, `onLogin` methods and a feature-specific `loading` method;

```dart
import 'package:bloc/bloc.dart';

class FeatureCubit extends Cubit<Status> implements ConnectivityEventListener, AuthEventListener {
  FeatureCubit() : super(Status.initial);

  void loading() => emit(Status.loading);

  @override
  void onConnect() => emit(Status.enabled);

  @override
  void onDisconnect(DisconnectSource source) => emit(Status.disabled);

  @override
  void onLogin(Authorize authorizedAccount) => emit(Status.loggedIn);

  @override
  void onLogout() => emit(Status.loggedOut);
}
```

3- Cubits created should be registered with `BlocManager` class. It is important to decide when a cubit should be registered/provided or not, you should register a bloc only when needed and should dispose of it if it is not needed anymore. For example, we have 2 global cubits in which their states/values are needed at every stage of the app’s lifecycle, named Connectivity and Account. These 2 important cubits should be registered early at the app’s lifecycle. For example;

```dart
void main() {
  _registerBlocs();

  runApp(CounterApp());
}
```

```dart
void _registerBlocs() {
  BlocManager.instance.register(() => ConnectivityCubit());
  BlocManager.instance.register(() => AccountCubit());
  ...
}

void _registerEventDispatchers() {
  EventDispatcher(BlocManager.instance)
    ..register<ConnectivityCubit, ConnectionStateEmitter>(
      (BaseBlocManager blocManager) => ConnectivityStateEmitter(blocManager),
    )
    ..register<AccountCubit>(
      (BaseBlocManager blocManager) => AccountStateEmitter(blocManager),
    )
    ...;
}
```

As the snippet shows, we use ` BlocManager.instance.register()` to register a new cubit. In order to dispose of that cubit, `BlocManager.instance.dispose()` could be called. So what does `EventDispatcher(BlocManager.instance)` do?

As we mentioned earlier, bloc manager will handle listening to state changes in shared blocs in order to notify or broadcast the events to interested cubits that expect an update. And that’s exactly what `EventDispatcher(BlocManager.instance)` do, it adds listeners to get state changes update and then will dispatch events to cubits, for example, to `FeatureCubit` as shown below;

```dart
abstract class BaseStateEmitter<E extends BaseEventListener, B extends BlocBase<Object>> {
  /// Initializes base state emitter.
  BaseStateEmitter(this.blocManager) {
    blocManager.registerStateEmitter(this);
  }

  /// Bloc manager instance.
  final BaseBlocManager blocManager;

  /// Handles states for event listener [E].
  void handleStates({required E eventListener, required Object state});

  /// Emits state to the listener.
  void call({required BaseEventListener eventListener, Object? state}) {
    if (eventListener is E) {
      handleStates(
        eventListener: eventListener,
        state: state ?? blocManager.fetch<B>().state,
      );
    }
  }
}
```

```dart
class ConnectionStateEmitter extends BaseStateEmitter<ConnectionEventListener, ConnectionCubit> {
  /// Initializes connection state emitter.
  ConnectionStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required ConnectionEventListener eventListener,
    required Object state,
  }) {
    if (state is ConnectionConnectedState) {
      eventListener.onConnected();
    } else if (state is ConnectionDisconnectedState) {
      eventListener.onDisconnect();
    } else if (state is ConnectionErrorState) {
      eventListener.onConnectionError(state.error);
    }
  }
}

```

```dart
void register<B extends BlocBase<Object>, E extends BaseStateEmitter<BaseEventListener, B>>(
  StateEmitterBuilder stateEmitterBuilder,
) {
  stateEmitterBuilder(blocManager);

  if (!blocManager.hasListener<B>(key)) {
    blocManager.addListener<B>(
      key: key,
      handler: (Object state) => _dispatcher<E>(state),
    );
  }
}
```

The example shows a state is active or not coming from the global `AccountCubit`, then the `EventDispatcher` will broadcast login or logout events. `_dispatcher` function looks for all registered blocs and sends the events to blocs implementing the `BaseCubit` class.

```dart
void _dispatcher<E extends BaseStateEmitter<BaseEventListener, BlocBase<Object>>>(
  Object state,
) =>
    blocManager.repository.forEach(
      (String key, BlocBase<Object> bloc) =>
          blocManager.emitCoreStates<E>(bloc: bloc, state: state),
    );
```

For example, `bloc.onLogout();` will call `void logout()` at **FeatureCubit** which in turns, emits `(Status.loggedOut)` to update the UI or do an action. So how can we use `FeatureCubit` in a widget or a screen?

4- Cubit is registered when needed, so we register `FeatureCubit` when we navigate to FeaturePage,

```dart
class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocManager.instance.register<FeatureCubit>(() => FeatureCubit());

    return FeatureView();
  }
}
```

In order to use `FeatureCubit` in `FeatureView`, we should call fetch method from `BlocManager` class as following;

```dart
final _featureCubit = BlocManager.instance.fetch<FeatureCubit>();
```

then use a BlocBuilder;

```dart
BlocBuilder<FeatureCubit, Status>(
  cubit: _featureCubit,
  builder: (context, state) => ...  // Use the state.
);
```

The full class implementation looks as follows;

```dart
class FeatureView extends StatelessWidget {
  final _featureCubit = BlocManager.instance.fetch<FeatureCubit>();

  @override
  Widget build(BuildContext context) =>
    Builder(
      builder: (BuildContext context) => BlocBuilder<FeatureCubit, Status>(
        cubit: _featureCubit,
        builder: (context, state) {
          if (state == Status.enabled) {
            // Enabled state logic.
          } else if (state == Status.disabled) {
            // Disabled state logic.
          } else if (state == Status.loggedIn) {
            // Logged in state logic.
          } else if (state == Status.loggedOut) {
            // Logged out state logic.
          } else {
            // Initial state logic.
          }
        },
      ),
    );
}
```

### Example project

To see a sample app of this implementation, please refer to this [link](https://github.com/hamed-fs/flutter_sample_bloc_manager).
