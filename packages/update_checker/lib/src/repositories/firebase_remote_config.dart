import 'package:deriv_logger/deriv_logger.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

/// Firebase Remote Config repository will help to fetch the update information from
/// the firebase database.
class FirebaseRemoteConfigRepository implements BaseFirebase {
  /// Initializes the Firebase Database repository
  FirebaseRemoteConfigRepository(
      {String versionControlKey = 'app_version_control'})
      : _versionControlKey = versionControlKey;

  late final String _versionControlKey;

  /// Fetches the update information from the database.
  @override
  Future<String> fetchUpdateData() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.ensureInitialized();
    try {
      await remoteConfig.fetchAndActivate();
    } on Exception catch (e, s) {
      // Just log the exception and continue
      AppLogger.e(e.toString(), stackTrace: s);
    }

    final RemoteConfigValue remoteConfigValue =
        remoteConfig.getValue(_versionControlKey);
    return remoteConfigValue.asString();
  }
}
