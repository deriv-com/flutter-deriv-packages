import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:update_checker/update_info.dart';
import 'package:update_checker/src/misc.dart';
import 'package:package_info/package_info.dart';

class FirebaseUtils {
  Future<UpdateInfo> getUpdateInfo() async {
    final int appBuildNumber = await _getAppBuildNumber();
    if (appBuildNumber <= 0) return null; // failed to get app build number

    final rawData = await _fetchData();
    final int optionalBuildNumber = rawData['optional']['buildnumber'];
    final int mandatoryBuildNumber = rawData['mandatory']['buildnumber'];
    final bool isMandatory = appBuildNumber < mandatoryBuildNumber;
    final bool isOptional = appBuildNumber < optionalBuildNumber;
    if (!isMandatory && !isOptional) return null; // no update available

    return _createUpdate(
      rawData[isOptional ? 'optional' : 'mandatory'],
      isOptional,
      isOptional ? optionalBuildNumber : mandatoryBuildNumber,
    );
  }

  Future<int> _getAppBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return int.tryParse(packageInfo.buildNumber) ?? -1;
  }

  Future<dynamic> _fetchData() async {
    final DatabaseReference dbRef = FirebaseDatabase.instance
        .reference()
        .child('build')
        .child(Platform.operatingSystem);
    return (await dbRef.once()).value;
  }

  UpdateInfo _createUpdate(
    dynamic rawUpdateInfo,
    bool isOptional,
    int buildNumber,
  ) {
    return UpdateInfo(
      buildNumber: buildNumber,
      url: rawUpdateInfo['url'] ?? null,
      changelog: decodeBase64(rawUpdateInfo['changelog'] ?? ''),
      changelogs: rawUpdateInfo['changelogs'] ?? null,
      isOptional: isOptional,
    );
  }
}
