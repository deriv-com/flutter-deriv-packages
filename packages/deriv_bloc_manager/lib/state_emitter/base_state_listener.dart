/// Base interface for all state listeners.
abstract class BaseStateListener {
  /// On error state handler.
  ///
  /// [error] contains the reason of the problem.
  void onError(String? error);
}
