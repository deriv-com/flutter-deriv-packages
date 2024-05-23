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

  /// Copies the current instance with some new values.
  PasskeysConnectionInfoModel copyWith({
    String? endpoint,
    String? appId,
  }) =>
      PasskeysConnectionInfoModel(
        endpoint: endpoint ?? this.endpoint,
        appId: appId ?? this.appId,
      );
}
