import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

/// Firebase Remote Config repository will help to fetch the update information from
/// the firebase database.
class FirebaseRemoteConfigRepository implements BaseFirebase {
  /// Initializes the Firebase Database repository
  const FirebaseRemoteConfigRepository();

  static const String _versionControlKey = 'app_version_control';

  /// Fetches the update information from the database.
  @override
  Future<String> fetchUpdateData() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    final RemoteConfigValue remoteConfigValue =
        FirebaseRemoteConfig.instance.getValue(_versionControlKey);
    return remoteConfigValue.asString();
  }
}
