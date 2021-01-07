/// Represents information regarding Updates.
class UpdateInfo {
  /// [buildNumber] represents the minimum build required.
  final int buildNumber;

  /// [changelog] shows what's new in latest buildnumber.
  final String changelog;

  /// [changelogs] contains changelog information for different languages.
  /// ```
  /// {
  ///    'en': '- Feature 1\n- Feature 2',
  ///    'es': '- característica 1\n- característica 2',
  /// }
  /// ```
  final Map<String, String> changelogs;

  /// [url] can be empty. When available should be used instead of App/Play Store.
  final String url;

  /// [isOptional] is used to represent if Update is Optional or Mandatory.
  final bool isOptional;

  UpdateInfo({
    this.buildNumber,
    this.changelog,
    this.changelogs,
    this.url,
    this.isOptional,
  });
}
