///App authorization challenge request model.
class AppAuthorizationChallengeRequestModel {
  /// Initializes App authorization challenge request model.
  AppAuthorizationChallengeRequestModel({required this.appId});

  /// Application id.
  final int appId;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{'app_id': appId};
}
