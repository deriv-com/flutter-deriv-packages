import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class DerivPasskeysLocalizationsSw extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Mafanikio!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Akaunti yako sasa imehifadhiwa na passkey. Dhibiti passkey yako kupi tia mipangilio yako ya akaunti ya $platformName.';
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
  String get effortlessLogin => 'Kuingia bila juhudi kwa passkeys';

  @override
  String get whatArePasskeys => 'Nini passkeys?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Njia mbadala ya kufanya nenosiri kuwa salama.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Fungua akaunti yako kama vile simu yako - kwa biyometriki, kuskani uso au PIN.';

  @override
  String get whyPasskeys => 'Kwa nini passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Safu ya ziada ya usalama.';

  @override
  String get whyPasskeysDescription2 => 'Kinga dhidi ya ufikiaji ambao haujaidhinishwa na hadaa.';

  @override
  String get howToCreatePasskey => 'Jinsi ya kuunda passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Nenda katika \'Mipangilio ya Akaunti\' kwenye Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Unaweza kuunda passkey moja kwa kila kifaa.';

  @override
  String get p2pHowToCreatePasskey => 'Jinsi ya kuunda passkey?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Nenda kwenye \'Profaili\' katika programu yako ya Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Gonga \'Passkeys\' ili kuunda nenosiri lako.';

  @override
  String get whereArePasskeysSaved => 'Passkeys zimehifadhiwa wapi?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google password manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'Nini kinatokea ikiwa barua pepe yangu ya akaunti ya Deriv imebadil?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Hakuna tatizo! Passkey yako bado inafanya kazi.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Ingia kwenye Deriv na passkey yako iliyopo.';

  @override
  String get tips => 'Vidokezo';

  @override
  String get beforeUsingPasskeys => 'Kabla ya kutumia passkeys';

  @override
  String get enableScreenLock => 'Wezesha kufunga skrini kwenye kifaa chako.';

  @override
  String get signInGoogleOrIcloud => 'Ingia kwenye akaunti yako ya Google au iCloud.';

  @override
  String get enableBluetooth => 'Wezesha Bluetooth.';

  @override
  String get noPasskeyFound => 'Hakuna passkey iliyopatikana!';

  @override
  String get noPasskeyFoundDescription => 'Tafadhali unda passkey ili kutumia kipengele hiki.';

  @override
  String get maybeLater => 'Labda baadaye';

  @override
  String get effortlessLoginWithPasskeys => 'Kuingia bila juhudi kwa passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Jifunze zaidi kuhusu passkeys';

  @override
  String get noNeedToRememberPassword => 'Hakuna haja ya kukumbuka nenosiri';

  @override
  String get useYourBiometrics => 'Usalama ulioboreshwa na biometriki au kufunga skrini';

  @override
  String get syncAcrossDevices => 'Sawazisha katika vifaa';

  @override
  String get createPasskey => 'Unda passkey';

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
  String get addMorePasskeysButtonText => 'Ongeza passkeys nyingine';

  @override
  String get unableToSetupPasskey => 'Haiwezi kuanzisha kifungu cha passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Tulikutana na shida wakati wa kuanzisha passkey lako. Utaratibu huo unaweza kuingiliwa, au kikao kimekamilika. Tafadhali jaribu tena.';

  @override
  String get passkeysOffErrorTitle => 'Huduma ya Passkeys haipatikani';

  @override
  String get never => 'Kamwe';

  @override
  String get unable_to_process_your_request => 'Haiwezi kushughulikia ombi lako';

  @override
  String get unable_to_process_your_request_description => 'Tunapata shida ya muda katika kusindika ombi lako. Tafadhali jaribu tena baadaye.';
}
