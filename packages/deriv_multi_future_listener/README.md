# Deriv Multi Future Listener


A widget that listens to multiple futures and calls the onDone callback.
It also calls the onError callback if any of the futures fails.


## Usage

```dart
     DerivMultiFutureListener(
        futures: [future1, future2, future3],
        onDone: () => print('All tasks done successfully'),
        onError: (Object error) => print('one of he tasks failed: $error'),
        child: const SizedBox(),
      );

```