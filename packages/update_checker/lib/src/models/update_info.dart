import 'package:equatable/equatable.dart';

/// Represents information regarding Update.
class UpdateInfo extends Equatable {
  /// Update info contains information about the update such as the optionality
  /// and changes for the update.
  const UpdateInfo({
    required this.buildNumber,
    required this.isOptional,
    this.changelog,
    this.changelogs,
    this.url,
  });

  /// [isOptional] determines if the update is optional or not.
  final bool isOptional;

  /// [buildNumber] represents the minimum build required.
  final num buildNumber;

  /// [changelog] contains changelog information for the latest release.
  final String? changelog;

  /// [changelogs] contains changelog information for different languages.
  /// ```
  /// {
  ///    "en": "- Feature 1\n- Feature 2",
  ///    "es": "- característica 1\n- característica 2",
  /// }
  /// ```
  final Map<String, dynamic>? changelogs;

  /// [url] is alternative url for updating the app, can be empty.
  final String? url;

  @override
  List<dynamic> get props => <dynamic>[isOptional, buildNumber, url];

  @override
  String toString() => 'UpdateInfo('
      'isOptional: $isOptional, '
      'buildNumber: $buildNumber, '
      'url: $url'
      ')';
}
