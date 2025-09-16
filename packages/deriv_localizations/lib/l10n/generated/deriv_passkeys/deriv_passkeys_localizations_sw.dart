import 'deriv_passkeys_localizations.dart';

/// The translations for Swahili (`sw`).
class DerivPasskeysLocalizationsSw extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Mafanikio!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Akaunti yako sasa imehifadhiwa na Biometric. Dhibiti Biometric yako kupi tia mipangilio yako ya akaunti ya $platformName.';
  }

  @override
  String get continueButtonText => 'Endelea';

  @override
  String get unexpectedError => 'Hitilafu yasiyotarajiwa!';

  @override
  String get unexpectedErrorDescription => 'Tafadhali jaribu tena.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Pata kuingia salama';

  @override
  String get enhanceSecurity => 'Usalama ulioimarishwa uko karibu sana, unahitaji kubofya tu.';

  @override
  String get here => 'hapa';

  @override
  String get effortlessLogin => 'Kuingia bila juhudi kwa Biometrics';

  @override
  String get whatArePasskeys => 'Nini Biometrics?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Njia mbadala ya kufanya nenosiri kuwa salama.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Fungua akaunti yako kama vile simu yako - kwa biyometriki, kuskani uso au PIN.';

  @override
  String get whyPasskeys => 'Kwa nini Biometrics?';

  @override
  String get whyPasskeysDescription1 => 'Safu ya ziada ya usalama.';

  @override
  String get whyPasskeysDescription2 => 'Kinga dhidi ya ufikiaji ambao haujaidhinishwa na hadaa.';

  @override
  String get howToCreatePasskey => 'Jinsi ya kuunda Biometric?';

  @override
  String get howToCreatePasskeyDescription1 => 'Nenda katika \'Mipangilio ya Akaunti\' kwenye Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Unaweza kuunda Biometric moja kwa kila kifaa.';

  @override
  String get p2pHowToCreatePasskey => 'Jinsi ya kuunda Biometric?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Nenda kwenye \'Profaili\' katika programu yako ya Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Gonga \'Biometrics\' ili kuunda nenosiri lako.';

  @override
  String get whereArePasskeysSaved => 'Biometrics zimehifadhiwa wapi?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google password manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'Nini kinatokea ikiwa barua pepe yangu ya akaunti ya Deriv imebadil?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Hakuna tatizo! Biometric yako bado inafanya kazi.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Ingia kwenye Deriv na Biometric yako iliyopo.';

  @override
  String get tips => 'Vidokezo';

  @override
  String get beforeUsingPasskeys => 'Kabla ya kutumia Biometrics';

  @override
  String get enableScreenLock => 'Wezesha kufunga skrini kwenye kifaa chako.';

  @override
  String get signInGoogleOrIcloud => 'Ingia kwenye akaunti yako ya Google au iCloud.';

  @override
  String get enableBluetooth => 'Wezesha Bluetooth.';

  @override
  String get noPasskeyFound => 'Hakuna Biometric iliyopatikana!';

  @override
  String get noPasskeyFoundDescription => 'Tafadhali unda Biometric ili kutumia kipengele hiki.';

  @override
  String get maybeLater => 'Labda baadaye';

  @override
  String get effortlessLoginWithPasskeys => 'Kuingia bila juhudi kwa Biometrics';

  @override
  String get learnMoreAboutPasskeys => 'Jifunze zaidi kuhusu Biometrics';

  @override
  String get noNeedToRememberPassword => 'Hakuna haja ya kukumbuka nenosiri';

  @override
  String get useYourBiometrics => 'Usalama ulioboreshwa na biometriki au kufunga skrini';

  @override
  String get syncAcrossDevices => 'Sawazisha katika vifaa';

  @override
  String get createPasskey => 'Unda Biometric';

  @override
  String get unsupportedPlatform => 'Jukwaa isiyosaidiwa';

  @override
  String get storedOn => 'Imehifadhiwa kwenye';

  @override
  String get lastUsed => 'Imetumika mwisho';

  @override
  String get rename => 'Badilisha jina';

  @override
  String get revoke => 'Kufuta';

  @override
  String get continueTradingButtonText => 'Endelea kufanya biashara';

  @override
  String get addMorePasskeysButtonText => 'Ongeza Biometrics nyingine';

  @override
  String get unableToSetupPasskey => 'Haiwezi kuanzisha kifungu cha Biometric';

  @override
  String get unableToSetupPasskeyDescription => 'Tulikutana na shida wakati wa kuanzisha Biometric lako. Utaratibu huo unaweza kuingiliwa, au kikao kimekamilika. Tafadhali jaribu tena.';

  @override
  String get passkeysOffErrorTitle => 'Huduma ya Biometrics haipatikani';

  @override
  String get never => 'Kamwe';

  @override
  String get unable_to_process_your_request => 'Haiwezi kushughulikia ombi lako';

  @override
  String get unable_to_process_your_request_description => 'Tunapata shida ya muda katika kusindika ombi lako. Tafadhali jaribu tena baadaye.';
}
