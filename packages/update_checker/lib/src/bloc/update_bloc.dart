import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../utils/utils.dart';

part 'update_event.dart';

part 'update_state.dart';

/// UpdateBloc is responsible for fetching the update availability from the
/// Firebase Database and emit the correct state.
class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  /// UpdateBloc needs `FirebaseDatabaseRepository` in order to fetch the update
  /// availability from the Firebase Database and `PackageInfoRepository` to
  /// check the app version with the update to determine the update availability
  UpdateBloc({
    required this.firebaseRepository,
    this.packageInfoRepository = const PackageInfoRepository(),
  }) : super(UpdateInitialState()) {
    on<UpdateFetchEvent>(
      (UpdateFetchEvent event, Emitter<UpdateState> emit) async =>
          _handleUpdateFetchEvent(event, emit),
    );
  }

  /// Firebase database repository for fetching the update information.
  final BaseFirebase firebaseRepository;

  /// Package info repository for fetching the app build number.
  final PackageInfoRepository packageInfoRepository;

  Future<void> _handleUpdateFetchEvent(
      UpdateFetchEvent event, Emitter<UpdateState> emit) async {
    if (state is! UpdateInProgressState) {
      emit(UpdateInProgressState());
      final UpdateInfo? info =
          (firebaseRepository is FirebaseRemoteConfigRepository)
              ? await _getUpdateInfoFromRemoteConfig()
              : await _getUpdateInfoFromDatabase();
      if (info != null) {
        emit(UpdateAvailableState(info));
      } else {
        emit(UpdateNotAvailableState());
      }
    }
  }

  String? _platformName() {
    if (Platform.isAndroid || Platform.isIOS) {
      return Platform.operatingSystem;
    } else {
      return null;
    }
  }

  Future<UpdateInfo?> _getUpdateInfoFromRemoteConfig() async {
    final String rawData = await firebaseRepository.fetchUpdateData();

    // checks if failed to fetch data from Firebase Database and return
    if (rawData.isEmpty) {
      return null;
    }

    // checks if failed to get app build number and return
    final num appBuildNumber = await packageInfoRepository.getAppBuildNumber();
    if (appBuildNumber <= 0) {
      return null;
    }

    final Map<String, dynamic> mapValues = json.decode(rawData);

    final String? platformName = _platformName();

    if (platformName == null) {
      return null;
    }

    final num minVersion = mapValues[platformName]['version']['minimum'];
    final num latestVersion = mapValues[platformName]['version']['latest'];

    final bool isMandatory = appBuildNumber < minVersion;

    final bool isOptional =
        appBuildNumber < latestVersion && appBuildNumber > minVersion;

    // checks if no update available and return
    if (!isMandatory && !isOptional) {
      return null;
    }

    return _createUpdate(
      mapValues[platformName],
      isOptional,
      isOptional ? latestVersion : minVersion,
    );
  }

  Future<UpdateInfo?> _getUpdateInfoFromDatabase() async {
    final dynamic rawData = await firebaseRepository.fetchUpdateData();

    // checks if failed to fetch data from Firebase Database and return
    if (rawData == null) {
      return null;
    }

    // checks if failed to get app build number and return
    final num appBuildNumber = await packageInfoRepository.getAppBuildNumber();
    if (appBuildNumber <= 0) {
      return null;
    }

    final num optionalBuildNumber = rawData['optional']['buildnumber'];
    final num mandatoryBuildNumber = rawData['mandatory']['buildnumber'];
    final bool isMandatory = appBuildNumber < mandatoryBuildNumber;
    final bool isOptional = appBuildNumber < optionalBuildNumber &&
        appBuildNumber >= mandatoryBuildNumber;

    // checks if no update available and return
    if (!isMandatory && !isOptional) {
      return null;
    }

    return _createUpdate(
      rawData[isOptional ? 'optional' : 'mandatory'],
      isOptional,
      isOptional ? optionalBuildNumber : mandatoryBuildNumber,
    );
  }

  UpdateInfo _createUpdate(
    dynamic rawUpdateInfo,
    bool isOptional,
    num buildNumber,
  ) {
    final Map<String, dynamic>? changelogs;
    if (firebaseRepository is FirebaseRemoteConfigRepository) {
      changelogs = rawUpdateInfo['changelogs'];
    } else {
      final String? rawChangelogs = rawUpdateInfo['changelogs']?.toString();
      changelogs = rawChangelogs != null
          ? json.decode(
              rawChangelogs.toString().substring(1, rawChangelogs.length - 1),
            )
          : null;
    }

    return UpdateInfo(
      buildNumber: buildNumber,
      url: rawUpdateInfo['url'],
      huaweiUrl: rawUpdateInfo['huawei_url'],
      changelog: decodeBase64(rawUpdateInfo['changelog'] ?? ''),
      changelogs: changelogs,
      isOptional: isOptional,
    );
  }
}
