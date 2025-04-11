import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class DerivAuthLocalizationsTr extends DerivAuthLocalizations {
  DerivAuthLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get labelNotAvailable => 'Mevcut değil';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app ülkenizde mevcut değil';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'Herhangi bir sorunuz varsa, bizimle şu yolla iletişime geçin ';

  @override
  String get labelLiveChat => 'Canlı sohbet';

  @override
  String get actionSignUpForFree => 'Ücretsiz Üye Olun';

  @override
  String get actionLogin => 'Giriş yap';

  @override
  String get labelTwoFactorAuth => 'İki faktörlü kimlik doğrulama';

  @override
  String get informEnterTwoFactorAuthCode => 'Telefonunuzdaki kimlik doğrulayıcı uygulamasından 6 haneli kodu girin.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA kodu';

  @override
  String get actionProceed => 'Devam et';

  @override
  String get labelLogIn => 'Oturum Aç';

  @override
  String get informLoginOptions => 'Veya bununla oturum aç';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Şifre';

  @override
  String get actionForgotPassword => 'Şifreyi mi unuttun?';

  @override
  String get labelDontHaveAnAccountYet => 'Henüz bir hesabınız yok mu?';

  @override
  String get actionCreateANewAccount => 'Yeni bir hesap oluştur';

  @override
  String get informInvalidEmailFormat => 'Geçerli bir e-posta adresi girin';

  @override
  String get warnPasswordLength => '6-25 arası karakter girmelisiniz.';

  @override
  String get labelResetPassword => 'Şifreyi sıfırla';

  @override
  String get labelChooseNewPass => 'Yeni bir şifre seç';

  @override
  String get labelCreatePass => 'Şifre';

  @override
  String get informYourPassHasBeenReset => 'Şifreniz sıfırlandı';

  @override
  String get informRedirectLogin => 'Yeni şifrenizle giriş yapmanız gerekecek. Bekle, seni yönlendiriyoruz.';

  @override
  String get actionResetPass => 'Şifremi sıfırla';

  @override
  String get informInvalidPasswordFormat => 'Lütfen geçerli bir şifre formatı girin';

  @override
  String get labelCheckEmail => 'E-postanızı kontrol edin';

  @override
  String informSendResetPasswordEmail(String email) {
    return '$email adresine şifrenizi sıfırlamanız için bir bağlantı içeren bir mesaj gönderdik.';
  }

  @override
  String get informResetPassByEmail => 'Şifrenizi sıfırlamak için size e-posta ile talimatlar göndereceğiz.';

  @override
  String get labelSelectCountry => 'Nerede yaşıyorsunuz?';

  @override
  String get labelChooseCountry => 'Ülke seçin';

  @override
  String get warnCountryNotAvailable => 'Maalesef, Deriv ülkenizde mevcut değil.';

  @override
  String get actionNext => 'Sonraki';

  @override
  String get labelEmailIssueHeader => 'Birkaç dakika içinde bizden bir e-posta görmezseniz, birkaç şey olmuş olabilir:';

  @override
  String get labelEmailIssueSpam => 'E-posta, spam klasörünüzdedir (bazen orada bir şeyler kaybolur).';

  @override
  String get labelEmailIssueWrongEmail => 'Yanlışlıkla bize başka bir e-posta adresi verdiniz (Genellikle kastettiğiniz e-posta yerine bir iş veya kişisel bir e-posta).';

  @override
  String get labelEmailIssueTypo => 'Girdiğiniz e-posta adresi bir hata veya yazım hatası içerdi (en iyilerimizin bile başına geliyor).';

  @override
  String get labelEmailIssueFirewall => 'E-postayı bu adrese teslim edemiyoruz (Genellikle güvenlik duvarları veya filtreleme nedeniyle).';

  @override
  String get actionReenterEmail => 'E-postanızı yine girin ve deneyin';

  @override
  String get labelKeepPassword => 'Hesabınızı bir şifre ile güvende tutun';

  @override
  String get labelCreatePassword => 'Bir şifre oluşturun';

  @override
  String get actionStartTrading => 'Ticarete başlayın';

  @override
  String get actionPrevious => 'Önceki';

  @override
  String get labelSignUp => 'Kayıt ol';

  @override
  String get labelOrSignUpWith => 'Veya bununla kaydolun';

  @override
  String get labelReferralInfoTitle => 'Affiliate yönlendirme kodu';

  @override
  String get infoReferralInfoDescription => 'Bir Deriv affiliate tarafından sağlanan ve yalnızca e-posta kayıtları için geçerli olan alfanümerik bir kod.';

  @override
  String get labelGotReferralCode => 'Yönlendirme kodunuz var mı?';

  @override
  String get labelHaveAccount => 'Zaten bir hesabınız var?';

  @override
  String get actionCreateAccount => 'Ücretsiz demo hesabı oluştur';

  @override
  String get informInvalidReferralCode => 'Girdiğiniz yönlendirme kodu geçersiz. Kontrol edin ve tekrar deneyin.';

  @override
  String get labelVerifyYourEmail => 'E-postanızı doğrulayın';

  @override
  String get labelThanksEmail => 'E-posta doğrulama için teşekkürler';

  @override
  String get informLetsContinue => 'Devam edelim.';

  @override
  String get actionContinue => 'Devam et';

  @override
  String get labelSearchCountry => 'Ülke ara';

  @override
  String informVerificationEmailSent(String email) {
    return 'Hesabınızı etkinleştirmek için $email adresine bir bağlantı içeren bir mesaj gönderdik.';
  }

  @override
  String get actionEmailNotReceived => 'E-postanızı almadınız mı?';

  @override
  String get informPasswordPolicy => 'Şifreniz şunlara sahip olmalıdır:';

  @override
  String get informPasswordPolicyLength => '8-25 karakter';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Büyük ve küçük harfler';

  @override
  String get informPasswordPolicyNumber => 'En az bir sayı';

  @override
  String get warnPasswordContainsSymbol => 'Güçlü şifre için semboller kullanın.';

  @override
  String get labelReferralCode => 'Yönlendirme Kodu';

  @override
  String get actionTryAgain => 'Tekrar Deneyin';

  @override
  String get informInvalid2FACode => 'Girdiğiniz kod geçersiz. Kontrol edin ve tekrar deneyin.';

  @override
  String get informFailedAuthentication => 'E-posta adresiniz veya şifreniz yanlış olabilir. Sosyal bir hesapla mı kaydoldunuz? Kontrol edin ve tekrar deneyin.';

  @override
  String get informDeactivatedAccount => 'Hesabınız devre dışı bırakıldı.';

  @override
  String get informFailedAuthorization => 'Yetkilendirme başarısız oldu.';

  @override
  String get informInvalidResidence => 'Geçersiz ikamet.';

  @override
  String get informInvalidCredentials => 'Geçersiz kimlik bilgileri.';

  @override
  String get informMissingOtp => 'Tek seferlik şifre eksik.';

  @override
  String get informSelfClosed => 'Hesabınız kapatıldı.';

  @override
  String get informUnexpectedError => 'Beklenmedik bir hata oluştu.';

  @override
  String get informUnsupportedCountry => 'Ülkeniz desteklenmiyor.';

  @override
  String get informExpiredAccount => 'Hesabınızın süresi doldu';

  @override
  String get labelCountryConsentBrazil => 'Sadece Brezilya dışında yayınlanan ve sunulan OTC ürünlerinin ticaretini yapmak için Deriv\'de bir hesap açma talebimin tarafımdan başlatıldığını onaylıyorum. Deriv\'in CVM tarafından düzenlenmediğini ve Deriv\'e başvurarak yabancı bir şirketle ilişki kurmayı amaçladığımı tamamen anlıyorum.';

  @override
  String get informConnectionError => 'Bağlantı hatası. Lütfen daha sonra tekrar deneyin.';

  @override
  String get informSwitchAccountError => 'Hesap hatası değiştir. Lütfen daha sonra tekrar deneyin.';

  @override
  String get labelDeveloper => 'Geliştirici';

  @override
  String get labelEndpoint => 'Bitiş noktası';

  @override
  String get semanticEndpoint => 'Bitiş noktası';

  @override
  String get warnInvalidEndpoint => 'geçersiz bitiş noktası';

  @override
  String get labelApplicationID => 'Başvuru ID';

  @override
  String get semanticApplicationID => 'Başvuru ID';

  @override
  String get warnInvalidApplicationID => 'geçersiz başvuru ID';

  @override
  String get labelLanguage => 'Dil';
}
