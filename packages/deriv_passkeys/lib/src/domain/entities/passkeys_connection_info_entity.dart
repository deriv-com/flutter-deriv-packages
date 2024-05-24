/// Entity to store connection info.
class PasskeysConnectionInfoEntity {
  /// Creates a new [PasskeysConnectionInfoEntity] instance.
  PasskeysConnectionInfoEntity({
    required this.endpoint,
    required this.appId,
  });

  /// Connection endpoint.
  String endpoint;

  /// Deriv client app ID.
  String appId;
}
