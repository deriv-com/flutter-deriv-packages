/// Converts int to boolean.
///
/// Sometimes we unexpectedly get `bool` as input from BE, so input type is `dynamic`.
bool? getBool(dynamic value) =>
    value == null ? null : value == 1 || value == true;

/// Converts boolean to int
int? getInt({bool? value}) => value == null
    ? null
    : value
        ? 1
        : 0;
