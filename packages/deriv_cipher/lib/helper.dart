/// Convert a list of integers to a string.
String convertBytesToString(List<int> input) => String.fromCharCodes(input);

/// Convert a 2D list of integers to a string.
String convert2DIntListToString(List<List<int>> list) {
  final StringBuffer string = StringBuffer();

  for (final List<int> row in list) {
    string.write(convertBytesToString(row));
  }

  return '$string';
}
