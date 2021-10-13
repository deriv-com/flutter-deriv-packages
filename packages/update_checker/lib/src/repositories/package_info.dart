import 'package:package_info/package_info.dart';

/// PackageInfo repository will help to fetch the running app's build number.
class PackageInfoRepository {
  /// Initializes the PackageInfo repository
  const PackageInfoRepository();

  /// Returns the running app's build number.
  Future<num> getAppBuildNumber() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return num.tryParse(packageInfo.buildNumber) ?? -1;
    } on Exception catch (_) {
      return -1;
    }
  }
}
