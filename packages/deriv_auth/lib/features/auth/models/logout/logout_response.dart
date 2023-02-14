/// Logout response class.
class LogoutResponseEntity {
  /// Initializes Logout response class.
  const LogoutResponseEntity({
    required this.logout,
  });

  /// Creates an instance from JSON.
  factory LogoutResponseEntity.fromJson(
    dynamic logoutJson,
  ) =>
      LogoutResponseEntity(
        logout: logoutJson,
      );

  /// Logout response.
  final int logout;

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['logout'] = logout;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LogoutResponseEntity copyWith({
    int? logout,
  }) =>
      LogoutResponseEntity(
        logout: logout ?? this.logout,
      );
}
