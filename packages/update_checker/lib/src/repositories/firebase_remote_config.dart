import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

/// Firebase Remote Config repository will help to fetch the update information from
/// the firebase database.
class FirebaseRemoteConfigRepository implements BaseFirebase {
  /// Initializes the Firebase Database repository
  const FirebaseRemoteConfigRepository({
    this.versionControlKey = 'app_version_control',
  });

  /// Remote config key.
  final String versionControlKey;

  /// Fetches the update information from the database.
  @override
  Future<String> fetchUpdateData() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    final RemoteConfigValue remoteConfigValue =
        FirebaseRemoteConfig.instance.getValue(versionControlKey);
    return remoteConfigValue.asString();
  }
}
