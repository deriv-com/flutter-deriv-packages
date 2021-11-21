import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    this.firebaseDatabaseRepository = const FirebaseDatabaseRepository(),
    this.packageInfoRepository = const PackageInfoRepository(),
  }) : super(UpdateInitialState());

  /// Firebase database repository for fetching the update information.
  final FirebaseDatabaseRepository firebaseDatabaseRepository;

  /// Package info repository for fetching the app build number.
  final PackageInfoRepository packageInfoRepository;

  /// Maps event to the corresponding state.
  @override
  Stream<UpdateState> mapEventToState(UpdateEvent event) async* {
    if (event is UpdateFetchEvent && state is! UpdateInProgressState) {
      yield UpdateInProgressState();
      final UpdateInfo? info = await _getUpdateInfo();
      if (info != null) {
        yield UpdateAvailableState(info);
      } else {
        yield UpdateNotAvailableState();
      }
    }
  }

  Future<UpdateInfo?> _getUpdateInfo() async {
    final dynamic rawData = await firebaseDatabaseRepository.fetchUpdateData();

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
    final String? rawChangelogs = rawUpdateInfo['changelogs']?.toString();
    final Map<String, dynamic>? changelogs = rawChangelogs != null
        ? json.decode(
            rawChangelogs.toString().substring(1, rawChangelogs.length - 1),
          )
        : null;

    return UpdateInfo(
      buildNumber: buildNumber,
      url: rawUpdateInfo['url'],
      changelog: decodeBase64(rawUpdateInfo['changelog'] ?? ''),
      changelogs: changelogs,
      isOptional: isOptional,
    );
  }
}
