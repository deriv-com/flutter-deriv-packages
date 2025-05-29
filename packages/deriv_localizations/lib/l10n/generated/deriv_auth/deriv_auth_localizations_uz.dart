import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class DerivAuthLocalizationsUz extends DerivAuthLocalizations {
  DerivAuthLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get labelNotAvailable => 'Mavjud emas';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app mamlakatingizda ishlamaydi';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'Agar savollaringiz bo`lsa, biz bilan bog`laning ';

  @override
  String get labelLiveChat => 'Jonli chat';

  @override
  String get actionSignUpForFree => 'Bepul ro`yxatdan o`ting';

  @override
  String get actionLogin => 'Kirish';

  @override
  String get labelTwoFactorAuth => 'Ikki faktorli autentifikatsiya';

  @override
  String get informEnterTwoFactorAuthCode => 'Telefoningizdagi autentifikatsiya ilovasidan 6 raqamli kodni kiriting.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA kodi';

  @override
  String get actionProceed => 'Davom etish';

  @override
  String get labelLogIn => 'Kirish';

  @override
  String get informLoginOptions => 'Yoki tizimga kiring';

  @override
  String get labelEmail => 'Email';

  @override
  String get labelPassword => 'Parol';

  @override
  String get actionForgotPassword => 'Parolni unutdingizmi?';

  @override
  String get labelDontHaveAnAccountYet => 'Hali hisobingiz yo`qmi?';

  @override
  String get actionCreateANewAccount => 'Haqiqiy hisob yaratish';

  @override
  String get informInvalidEmailFormat => 'Yaroqli elektron pochta manzilini kiriting';

  @override
  String get warnPasswordLength => 'Siz 6-25 belgini kiritishingiz kerak.';

  @override
  String get labelResetPassword => 'Parolni tiklash';

  @override
  String get labelChooseNewPass => 'Yangi parolni tanlang';

  @override
  String get labelCreatePass => 'Parol';

  @override
  String get informYourPassHasBeenReset => 'Parolingiz tiklandi';

  @override
  String get informRedirectLogin => 'Siz yangi parolingiz bilan tizimga kirishingiz kerak. Kuting, sizni qayta yo`naltiryapmiz.';

  @override
  String get actionResetPass => 'Parolimni tiklash';

  @override
  String get informInvalidPasswordFormat => 'Iltimos, yaroqli parol formatini kiriting';

  @override
  String get labelCheckEmail => 'Elektron pochtaingizni tekshiring';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Biz $email manziliga parolingizni tiklash havolasi bilan xabar yubordik.';
  }

  @override
  String get informResetPassByEmail => 'Parolni tiklash bo`yicha ko`rsatmalarni elektron pochta orqali yuboramiz.';

  @override
  String get labelSelectCountry => 'Qayerda yashaysız?';

  @override
  String get labelChooseCountry => 'Mamlakatni tanlang';

  @override
  String get warnCountryNotAvailable => 'Afsuski, Deriv sizning mamlakatingizda mavjud emas.';

  @override
  String get actionNext => 'Keyingisi';

  @override
  String get labelEmailIssueHeader => 'Agar siz bir necha daqiqa ichida bizning elektron pochta xabarimizni olmagan bo`lsangiz, quyidagi sabablar bo`lishi mumkin:';

  @override
  String get labelEmailIssueSpam => 'Email spam papkangizda (Ba`zan narsalar u yerda yo`qoladi).';

  @override
  String get labelEmailIssueWrongEmail => 'Siz bizga boshqa elektron pochta manzilini xato bilan berdingiz (Odatda bu ish yoki shaxsiy elektron pochta manzili bo`ladi).';

  @override
  String get labelEmailIssueTypo => 'Siz kiritgan elektron pochta manzilida xato yozilgan (Buni eng yaxshilari ham qiladi).';

  @override
  String get labelEmailIssueFirewall => 'Bu manzilga elektron pochtani yetkazib bera olmaymiz (Odatda firewalls yoki filtrlash tufayli).';

  @override
  String get actionReenterEmail => 'Elektron pochtangizni qayta kiriting va qayta urinib ko\'ring';

  @override
  String get labelKeepPassword => 'Hisobingizni parol bilan himoya qiling';

  @override
  String get labelCreatePassword => 'Parol yaratish';

  @override
  String get actionStartTrading => 'Savdoni boshlang';

  @override
  String get actionPrevious => 'Oldingi';

  @override
  String get labelSignUp => 'Ro\'yxatdan o\'tish';

  @override
  String get labelOrSignUpWith => 'Yoki ro\'yxatdan o\'ting';

  @override
  String get labelReferralInfoTitle => 'Affiliate referal kodlari';

  @override
  String get infoReferralInfoDescription => 'Deriv hamkori tomonidan taqdim etilgan alfanumerik kod, faqat elektron pochta orqali ro`yxatdan o`tish uchun amal qiladi.';

  @override
  String get labelGotReferralCode => 'Referal kodingiz bormi?';

  @override
  String get labelHaveAccount => 'Hisobingiz bormi?';

  @override
  String get actionCreateAccount => 'Bepul demo hisob yaratish';

  @override
  String get informInvalidReferralCode => 'Siz kiritgan referal kodi yaroqsiz. Tekshirib, qayta urinib ko`ring.';

  @override
  String get labelVerifyYourEmail => 'Elektron pochtaingizni tekshiring';

  @override
  String get labelThanksEmail => 'Emailingizni tasdiqlaganingiz uchun rahmat';

  @override
  String get informLetsContinue => 'Keling, davom etamiz.';

  @override
  String get actionContinue => 'Davom etish';

  @override
  String get labelSearchCountry => 'Mamlakatni qidirish';

  @override
  String informVerificationEmailSent(String email) {
    return 'Hisobingizni faollashtirish uchun havola bilan $email manziliga xabar yubordik.';
  }

  @override
  String get actionEmailNotReceived => 'Elektron pochtani olmadingizmi?';

  @override
  String get informPasswordPolicy => 'Sizning parolingizda bo`lishi kerak:';

  @override
  String get informPasswordPolicyLength => '8-25 ta belgi';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Katta va kichik harflar';

  @override
  String get informPasswordPolicyNumber => 'Kamida bitta raqam';

  @override
  String get warnPasswordContainsSymbol => 'Kuchli parol uchun belgilardan foydalaning.';

  @override
  String get labelReferralCode => 'Referal Kod';

  @override
  String get actionTryAgain => 'Qayta urinib ko\'ring';

  @override
  String get informInvalid2FACode => 'Siz kiritgan kod yaroqsiz. Tekshirib, qayta urinib ko`ring.';

  @override
  String get informFailedAuthentication => 'Sizning elektron pochta manzilingiz yoki parolingiz noto`g`ri bo`lishi mumkin. Ijtimoiy hisob bilan ro`yxatdan o`tganmisiz? Tekshirib, qayta urinib ko`ring.';

  @override
  String get informDeactivatedAccount => 'Hisobingiz o\'chirilgan.';

  @override
  String get informFailedAuthorization => 'Avtorizatsiya amalga oshmadi.';

  @override
  String get informInvalidResidence => 'Yaroqsiz yashash joyi.';

  @override
  String get informInvalidCredentials => 'Hisob maʼlumotlari yaroqsiz.';

  @override
  String get informMissingOtp => 'Bir martalik parol yetishmayapti.';

  @override
  String get informSelfClosed => 'Hisobingiz yopildi.';

  @override
  String get informUnexpectedError => 'Kutilmagan xato yuz berdi.';

  @override
  String get informUnsupportedCountry => 'Mamlakatingiz qoʻllab-quvvatlanmaydi.';

  @override
  String get informExpiredAccount => 'Hisobingiz muddati tugagan';

  @override
  String get labelCountryConsentBrazil => 'Shu bilan Braziliyadan tashqarida chiqarilgan va taklif qilingan birjadan tashqari mahsulotlar savdosi uchun Deriv bilan hisob ochish haqidagi so`rovim men tomonidan qo`yilganligini tasdiqlayman. Men Deriv CVM tomonidan tartibga solinmasligini to`liq tushunaman va Derivga murojaat qilib, men xorijiy kompaniya bilan aloqa o`rnatish niyatidaman.';

  @override
  String get informConnectionError => 'Ulanish xatosi. Keyinroq qayta urinib ko‘ring.';

  @override
  String get informSwitchAccountError => 'Hisobni almashtirish xatosi. Keyinroq qayta urinib ko‘ring.';

  @override
  String get labelDeveloper => 'Dasturchi';

  @override
  String get labelEndpoint => 'Oxirgi nuqta';

  @override
  String get semanticEndpoint => 'Oxirgi nuqta';

  @override
  String get warnInvalidEndpoint => 'yaroqsiz oxirgi nuqta';

  @override
  String get labelApplicationID => 'Ilovaning ID';

  @override
  String get semanticApplicationID => 'Arizaning ID';

  @override
  String get warnInvalidApplicationID => 'yaroqsiz ariza ID';

  @override
  String get labelLanguage => 'Til';
}
