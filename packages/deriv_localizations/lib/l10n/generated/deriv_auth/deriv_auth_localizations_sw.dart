import 'deriv_auth_localizations.dart';

/// The translations for Swahili (`sw`).
class DerivAuthLocalizationsSw extends DerivAuthLocalizations {
  DerivAuthLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get labelNotAvailable => 'Haipatikani';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app haipatikani katika nchi yako';
  }

  @override
  String get actionOk => 'SAWA';

  @override
  String get warnNotAvailableCountries =>
      'Ikiwa una maswali yoyote, wasiliana nasi kupitia ';

  @override
  String get labelLiveChat => 'Mazungumzo mubashara';

  @override
  String get actionSignUpForFree => 'Jisajili bila malipo';

  @override
  String get actionLogin => 'Ingia';

  @override
  String get labelTwoFactorAuth => 'Uthibitishaji-wa hatua mbili';

  @override
  String get informEnterTwoFactorAuthCode =>
      'Ingiza nambari ya tarakimu 6 kutoka kwa programu ya uthibitishaji kwenye simu yako.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Nambari ya 2FA';

  @override
  String get actionProceed => 'Endelea';

  @override
  String get labelLogIn => 'Ingia';

  @override
  String get informLoginOptions => 'Au ingia na';

  @override
  String get labelEmail => 'Barua pepe';

  @override
  String get labelPassword => 'Nenosiri';

  @override
  String get actionForgotPassword => 'Umesahau nenosiri?';

  @override
  String get labelDontHaveAnAccountYet => 'Huna akaunti bado?';

  @override
  String get actionCreateANewAccount => 'Unda akaunti mpya';

  @override
  String get informInvalidEmailFormat => 'Ingiza anwani halali ya barua pepe';

  @override
  String get warnPasswordLength =>
      'Unapaswa kuingiza mchanganyiko wa tarakimu 8-25.';

  @override
  String get labelResetPassword => 'Rudisha nenosiri';

  @override
  String get labelChooseNewPass => 'Chagua nenosiri mpya';

  @override
  String get labelCreatePass => 'Nenosiri';

  @override
  String get informYourPassHasBeenReset => 'Nenosiri lako limewekwa upya';

  @override
  String get informRedirectLogin =>
      'Utahitaji kuingia na nenosiri lako jipya. Endelea, tunakuelekeza.';

  @override
  String get actionResetPass => 'Weka upya nywila yangu';

  @override
  String get informInvalidPasswordFormat =>
      'Tafadhali ingiza muundo halali wa nenosiri';

  @override
  String get labelCheckEmail => 'Angalia barua pepe yako';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Tumetuma ujumbe kwa $email na kiungo cha kuweka upya nenosiri lako.';
  }

  @override
  String get informResetPassByEmail =>
      'Tutakutumia barua pepe yenye maelekezo ya kuweka upya nenosiri lako.';

  @override
  String get labelSelectCountry => 'Unaishi wapi?';

  @override
  String get labelChooseCountry => 'Chagua nchi';

  @override
  String get warnCountryNotAvailable =>
      'Kwa bahati mbaya, Deriv haipatikani katika nchi yako.';

  @override
  String get actionNext => 'Ifuatayo';

  @override
  String get labelEmailIssueHeader =>
      'Ikiwa huoni barua pepe kutoka kwetu ndani ya dakika chache, mambo machache yanaweza kuwa yametokea:';

  @override
  String get labelEmailIssueSpam =>
      'Barua pepe iko kwenye folda yako ya spam (Wakati mwingine mambo yanapotelea huko).';

  @override
  String get labelEmailIssueWrongEmail =>
      'Kwa bahati mbaya ulitupa anwani nyingine ya barua pepe (Labda ya kazi au ya binafsi badala ya ile uliyokusudia).';

  @override
  String get labelEmailIssueTypo =>
      'Anwani ya barua pepe uliyoingiza ilikuwa na makosa (hutokea kwa ubora kwetu sote).';

  @override
  String get labelEmailIssueFirewall =>
      'Hatuwezi kutoa barua pepe kwa anwani hii (Kawaida kwa sababu ya firewalls au kuchuja).';

  @override
  String get actionReenterEmail =>
      'Ingiza tena barua pepe yako na ujaribu tena';

  @override
  String get labelKeepPassword => 'Weka akaunti yako salama na nenosiri';

  @override
  String get labelCreatePassword => 'Unda nenosiri';

  @override
  String get actionStartTrading => 'Anza biashara';

  @override
  String get actionPrevious => 'Iliyotangulia';

  @override
  String get labelSignUp => 'Jisajili';

  @override
  String get labelOrSignUpWith => 'Au jisajili kwa';

  @override
  String get labelReferralInfoTitle => 'Nambari ya rufaa ya ushirika';

  @override
  String get infoReferralInfoDescription =>
      'Nambari ya alfanisi iliyotolewa na mshirika wa Deriv, inayotumika kwa usajili wa barua pepe tu.';

  @override
  String get labelGotReferralCode => 'Una nambari ya rufaa?';

  @override
  String get labelHaveAccount => 'Tayari una akaunti?';

  @override
  String get actionCreateAccount => 'Unda demo akaunti';

  @override
  String get informInvalidReferralCode =>
      'Nambari ya rufaa uliyoingiza sio halali. Angalia na jaribu tena.';

  @override
  String get labelVerifyYourEmail => 'thibitisha barua pepe yako';

  @override
  String get labelThanksEmail => 'Asante kwa kuthibitisha barua pepe';

  @override
  String get informLetsContinue => 'Hebu tuendelee.';

  @override
  String get actionContinue => 'Endelea';

  @override
  String get labelSearchCountry => 'Tafuta nchi';

  @override
  String informVerificationEmailSent(String email) {
    return 'Tumetuma ujumbe kwa $email na kiungo cha kuamsha akaunti yako.';
  }

  @override
  String get actionEmailNotReceived => 'Hukupokea barua pepe yako?';

  @override
  String get informPasswordPolicy => 'Nenosiri lako lazima iwe na:';

  @override
  String get informPasswordPolicyLength => '8-25 herufi';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Barua za juu na ndogo';

  @override
  String get informPasswordPolicyNumber => 'Angalau nambari moja';

  @override
  String get warnPasswordContainsSymbol =>
      'Tumia alama kwa nenosiri yenye nguvu.';

  @override
  String get labelReferralCode => 'Msimbo wa Rufaa';

  @override
  String get actionTryAgain => 'Jaribu tena';

  @override
  String get informInvalid2FACode =>
      'Nambari uliyoingiza ni halali. Angalia na jaribu tena.';

  @override
  String get informFailedAuthentication =>
      'Barua pepe yako au nenosiri inaweza kuwa sahihi. Je! Ulijiandikisha na akaunti ya kijamii? Angalia na jaribu tena.';

  @override
  String get informDeactivatedAccount => 'Akaunti yako imezimwa.';

  @override
  String get informFailedAuthorization => 'Idhini ilishindwa.';

  @override
  String get informInvalidResidence => 'Makazi halali.';

  @override
  String get informInvalidCredentials => 'Hati zisizo sahihi.';

  @override
  String get informMissingOtp => 'Kukosa nenosiri la wakati mmoja.';

  @override
  String get informSelfClosed => 'Akaunti yako imefungwa.';

  @override
  String get informUnexpectedError => 'Hitilafu isiyotarajiwa ilitokea';

  @override
  String get informUnsupportedCountry => 'Nchi yako haikuungwa mkono.';

  @override
  String get informExpiredAccount => 'Akaunti yako imekwisha';

  @override
  String get labelCountryConsentBrazil =>
      'Ninathibitisha kwamba ombi langu la kufungua akaunti na Deriv kufanya biashara ya bidhaa za OTC zilizotolewa na kutolewa tu nje ya Brazil lilianzishwa na mimi. Ninaelewa kikamilifu kwamba Deriv haidhibitiwi na CVM na kwa kukaribia Deriv nina nia ya kuanzisha uhusiano na kampuni ya kigeni.';

  @override
  String get informConnectionError =>
      'Hitilafu ya unganisho Tafadhali jaribu tena baadaye.';

  @override
  String get informSwitchAccountError =>
      'Badilisha kosa la akaunti. Tafadhali jaribu tena baadaye.';

  @override
  String get labelDeveloper => 'Msanidi programu';

  @override
  String get labelEndpoint => 'Pointi ya mwisho';

  @override
  String get semanticEndpoint => 'Pointi ya mwisho';

  @override
  String get warnInvalidEndpoint => 'hatua ya mwisho halali';

  @override
  String get labelApplicationID => 'Kitambulisho cha programu';

  @override
  String get semanticApplicationID => 'Kitambulisho cha programu';

  @override
  String get warnInvalidApplicationID => 'kitambulisho cha programu halali';

  @override
  String get labelLanguage => 'Lugha';
}
