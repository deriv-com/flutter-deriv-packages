/// Extensions that applies to all dart classes.
extension ObjectExtension on Object? {
  /// This is a null-aware version of casting.
  ///
  /// Returns null if casting failed.
  T? asOrNull<T>() => this is T ? (this as T) : null;
}
