import 'deriv_passkeys_localizations.dart';

/// The translations for Turkish (`tr`).
class DerivPasskeysLocalizationsTr extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Başarı!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Hesabınız artık bir şifre ile güvence altına alınmıştır. $platformName hesap ayarlarınızdan passkey\'inizi yönetin.';
  }

  @override
  String get continueButtonText => 'Devam et';

  @override
  String get unexpectedError => 'Beklenmedik bir hata oluştu!';

  @override
  String get unexpectedErrorDescription => 'Lütfen daha sonra deneyin.';

  @override
  String get ok => 'Tamam';

  @override
  String get experienceSaferLogins => 'Daha güvenli oturum açma deneyimini yaşayın';

  @override
  String get enhanceSecurity => 'Gelişmiş güvenlik sadece bir dokunuş uzağınızda.';

  @override
  String get here => 'burada';

  @override
  String get effortlessLogin => 'Passkey tuşları ile zahmetsiz giriş';

  @override
  String get whatArePasskeys => 'Passkeys nedir?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Şifrelere güvenli alternatif.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Hesabınızın kilidini telefonunuz gibi açın - biyometri, yüz tarama veya PIN ile.';

  @override
  String get whyPasskeys => 'Neden Passkey?';

  @override
  String get whyPasskeysDescription1 => 'Ekstra güvenlik katmanı.';

  @override
  String get whyPasskeysDescription2 => 'Yetkisiz erişime ve kimlik avına karşı kalkanlar.';

  @override
  String get howToCreatePasskey => 'Passkey nasıl oluşturulur?';

  @override
  String get howToCreatePasskeyDescription1 => 'Deriv\'de \'Hesap Ayarları\'na gidin.';

  @override
  String get howToCreatePasskeyDescription2 => 'Cihaz başına bir passkey oluşturabilirsiniz.';

  @override
  String get p2pHowToCreatePasskey => 'Passkey nasıl oluşturulur?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Deriv P2P uygulamanızdaki \'Profil\' bölümüne gidin.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Passkey\'inizi oluşturmak için \"Passkeys\" ögesine dokunun.';

  @override
  String get whereArePasskeysSaved => 'Passkeys nereye kaydedilir?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google şifre yöneticisi.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud anahtar zinciri.';

  @override
  String get whatHappensIfEmailChanged => 'Deriv hesabım e-posta adresim değiştirilirse ne olur?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Sorun yok! Passkey hâlâ çalışıyor.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Mevcut passkey ile Deriv\'de oturum açın.';

  @override
  String get tips => 'İpuçları';

  @override
  String get beforeUsingPasskeys => 'Passkey kullanmadan önce';

  @override
  String get enableScreenLock => 'Cihazınızda ekran kilidini etkinleştirin.';

  @override
  String get signInGoogleOrIcloud => 'Google veya iCloud hesabınızda oturum açın.';

  @override
  String get enableBluetooth => 'Bluetooth\'u etkinleştir.';

  @override
  String get noPasskeyFound => 'Passkey bulunamadı!';

  @override
  String get noPasskeyFoundDescription => 'Bu özelliği kullanmak için lütfen bir passkey oluşturun.';

  @override
  String get maybeLater => 'Belki daha sonra';

  @override
  String get effortlessLoginWithPasskeys => 'Passkey tuşları ile zahmetsiz giriş';

  @override
  String get learnMoreAboutPasskeys => 'Passkeys hakkında daha fazla bilgi edinin';

  @override
  String get noNeedToRememberPassword => 'Şifreyi hatırlamanıza gerek yok';

  @override
  String get useYourBiometrics => 'Biyometri veya ekran kilidi ile gelişmiş güvenlik';

  @override
  String get syncAcrossDevices => 'Cihazlar arasında senkronizasyon';

  @override
  String get createPasskey => 'Passkey oluştur';

  @override
  String get unsupportedPlatform => 'Desteklenmeyen Platform';

  @override
  String get storedOn => 'Şurada saklanır';

  @override
  String get lastUsed => 'Son kullanılan';

  @override
  String get rename => 'Yeniden Adlandır';

  @override
  String get revoke => 'İptal';

  @override
  String get continueTradingButtonText => 'Alım satıma devam';

  @override
  String get addMorePasskeysButtonText => 'Daha fazla passkeys ekle';

  @override
  String get unableToSetupPasskey => 'Passkey ayarlanamıyor';

  @override
  String get unableToSetupPasskeyDescription => 'Passkey ayarlarken bir sorunla karşılaştık. İşlem yarıda kesilmiş veya oturum zaman aşımına uğramış olabilir. Lütfen tekrar deneyin.';

  @override
  String get passkeysOffErrorTitle => 'Passkeys hizmeti kullanılamıyor';

  @override
  String get never => 'Asla';

  @override
  String get unable_to_process_your_request => 'Talebiniz işleme alınamıyor';

  @override
  String get unable_to_process_your_request_description => 'Talebinizin işlenmesinde geçici bir sorun yaşıyoruz. Lütfen daha sonra tekrar deneyin.';
}
