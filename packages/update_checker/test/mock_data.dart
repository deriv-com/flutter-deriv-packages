import 'package:update_checker/update_checker.dart';

const int optionalBuildNumber = 10;
const int mandatoryBuildNumber = 5;

final Map<String, dynamic> rawData = <String, dynamic>{
  'optional': <String, dynamic>{
    'buildnumber': optionalBuildNumber,
    'changelog': 'something new!',
    'changelogs': null,
    'url': 'https://app.deriv.com/dl',
  },
  'mandatory': <String, dynamic>{
    'buildnumber': mandatoryBuildNumber,
    'changelog': 'something new!',
    'changelogs': null,
    'url': 'https://app.deriv.com/dl',
  }
};

const UpdateInfo updateInfoOptional = UpdateInfo(
  buildNumber: optionalBuildNumber,
  isOptional: true,
  changelog: 'something new!',
  url: 'https://app.deriv.com/dl',
);

const UpdateInfo updateInfoMandatory = UpdateInfo(
  buildNumber: mandatoryBuildNumber,
  isOptional: false,
  changelog: 'something new!',
  url: 'https://app.deriv.com/dl',
);
