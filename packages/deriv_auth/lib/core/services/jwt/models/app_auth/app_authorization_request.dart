///App authorization request model.
class AppAuthorizationRequestModel {
  /// Initializes app authorization request model.
  AppAuthorizationRequestModel({
    required this.appId,
    required this.solution,
    required this.expire,
  });

  /// Application id.
  final int appId;

  /// Solution.
  final String solution;

  /// Expire in timestamp.
  final int expire;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'solution': solution,
        'expire': expire,
      };
}
