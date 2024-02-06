import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// Returns `true` if the country is not in the [notAllowedCountryCodes] set,
/// otherwise returns `false`.
bool isAllowedCountry({required String? countryCode}) =>
    !notAllowedCountryCodes.contains(countryCode);

/// Returns `true` if consent is required for the given [countryCode],
/// otherwise returns `false`.
bool isConsentRequired({required String? countryCode}) {
  if (countryCode == null) {
    return false;
  }

  return countriesRequiringConsent.contains(countryCode.toLowerCase());
}

/// Retrieves the consent message for a given country code.
///
/// If the country requires consent, the corresponding consent message is returned.
/// Otherwise, an empty string is returned.
///
/// When a new country is added to the set of [countriesRequiringConsent],
/// update the [consentMessages] map.
String getCountryConsentMessage(
  BuildContext context, {
  required String? countryCode,
}) {
  if (countryCode == null) {
    return '';
  }

  final Map<String, String> consentMessages = <String, String>{
    'br': context.derivAuthLocalization.labelCountryConsentBrazil,
    // Add more countries and consent messages here.
  };

  return consentMessages[countryCode.toLowerCase()] ?? '';
}

/// Set of country codes that are not allowed to create an account.
const Set<String> notAllowedCountryCodes = <String>{
  // MF country codes.
  'de',
  'es',
  'fr',
  'gr',
  'it',
  'lu',
  'mf',
  // MLT country codes.
  'at',
  'be',
  'bg',
  'cy',
  'cz',
  'dk',
  'ee',
  'fi',
  'hr',
  'hu',
  'ie',
  'lt',
  'lv',
  'nl',
  'pl',
  'pt',
  'ro',
  'se',
  'si',
  'sk',
  // MX country codes.
  'gb',
  'im',
};

/// [countriesRequiringConsent] is a set of country codes that are required
/// to show consent.
///
/// If any country is required to show consent, add the country code
/// in lowercase to the set.
const Set<String> countriesRequiringConsent = <String>{
  'br',
  // Add countries here.
};
