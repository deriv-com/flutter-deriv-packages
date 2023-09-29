/// String extensions.
extension StringExtension on String {
  /// Returns all contents between first XML [tag].
  String? parseXMLTag(String tag) =>
      RegExp('<$tag>(.*)<\/$tag>').firstMatch(this)?.group(1);

  /// Converts a camelCase string to snake_case.
  String toSnakeCase() => replaceAllMapped(
        RegExp(r'([A-Z])'),
        (Match match) => '_${match[0]}',
      ).toLowerCase();
}
