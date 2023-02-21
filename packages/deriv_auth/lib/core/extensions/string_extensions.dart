/// String extensions.
extension StringExtension on String {
  /// Returns all contents between first XML [tag].
  String? parseXMLTag(String tag) =>
      RegExp('<$tag>(.*)<\/$tag>').firstMatch(this)?.group(1);
}
