import 'package:update_checker/update_checker.dart';

const int optionalBuildNumber = 10;
const int mandatoryBuildNumber = 5;

final Map<String, dynamic> rawData = <String, dynamic>{
  'optional': {
    'buildnumber': optionalBuildNumber,
    'changelog': 'something new!',
    'changelogs': null,
    'url': 'https://app.deriv.com/dl',
  },
  'mandatory': {
    'buildnumber': mandatoryBuildNumber,
    'changelog': 'something new!',
    'changelogs': null,
    'url': 'https://app.deriv.com/dl',
  }
};

final UpdateInfo updateInfoOptional = UpdateInfo(
  buildNumber: optionalBuildNumber,
  isOptional: true,
  changelog: 'something new!',
  changelogs: null,
  url: 'https://app.deriv.com/dl',
);

final UpdateInfo updateInfoMandatory = UpdateInfo(
  buildNumber: mandatoryBuildNumber,
  isOptional: false,
  changelog: 'something new!',
  changelogs: null,
  url: 'https://app.deriv.com/dl',
);
