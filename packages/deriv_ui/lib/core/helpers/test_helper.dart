/// A helper that makes it easy to check types with generic arguments
///
/// Then you can find your widget by doing:
/// find.byType(typeOf<Ratio<t>>());
Type typeOf<T>() => T;
