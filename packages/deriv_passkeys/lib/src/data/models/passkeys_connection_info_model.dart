/// Model to store connection info.
class PasskeysConnectionInfoModel {
  /// Creates a new [PasskeysConnectionInfoModel] instance.
  PasskeysConnectionInfoModel({
    required this.endpoint,
    required this.appId,
  });

  /// Connection endpoint.
  String endpoint;

  /// Deriv client app ID.
  String appId;
}
