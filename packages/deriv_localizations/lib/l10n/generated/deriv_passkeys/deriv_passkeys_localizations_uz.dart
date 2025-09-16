import 'deriv_passkeys_localizations.dart';

/// The translations for Uzbek (`uz`).
class DerivPasskeysLocalizationsUz extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Muvaffaqiyat!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Sizning hisobingiz endi biometriya bilan himoyalangan. Biometrik ma\'lumotlaringizni $platformName hisob sozlamalaringiz orqali boshqaring.';
  }

  @override
  String get continueButtonText => 'Davom etish';

  @override
  String get unexpectedError => 'Kutilmagan xato yuz berdi!';

  @override
  String get unexpectedErrorDescription => 'Iltimos, keyinroq qayta urinib ko‘ring.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Xavfsiz kirish uchun kalitingiz';

  @override
  String get enhanceSecurity => 'Oson va xavfsiz tizimga kirish uchun barmoq izi, yuzni aniqlash yoki boshqa biometrik ma\'lumotlardan foydalaning.';

  @override
  String get here => 'bu yerda';

  @override
  String get effortlessLogin => 'Biometriya bilan muammosiz kirish';

  @override
  String get whatArePasskeys => 'Biometriya nima?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Parollarga xavfsiz alternativ.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Barmoq izi, yuzni aniqlash yoki qurilma PIN yordamida hisobingizni oching.';

  @override
  String get whyPasskeys => 'Nima uchun biometriyadan foydalanish kerak?';

  @override
  String get whyPasskeysDescription1 => 'Ruxsatsiz kirishdan himoya qiladi.';

  @override
  String get whyPasskeysDescription2 => 'Fishing urinishlaridan himoya qiladi.';

  @override
  String get howToCreatePasskey => 'Biometriyani qanday yoqish mumkin?';

  @override
  String get howToCreatePasskeyDescription1 => 'Deriv-da \"Hisob sozlamalari\" ga o\'ting.';

  @override
  String get howToCreatePasskeyDescription2 => 'Biometriya ma\'lumotlarini yaratish uchun “Biometriya” tugmasini bosing.';

  @override
  String get p2pHowToCreatePasskey => 'Biometriyani qanday yoqish mumkin?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Deriv P2P ilovangizdagi “Profil” ga o\'ting.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Biometriya ma\'lumotlarini yaratish uchun “Biometriya” tugmasini bosing.';

  @override
  String get whereArePasskeysSaved => 'Biometrik ma\'lumotlar qaerda saqlanadi?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google parol menejeri.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'Deriv hisobimdagi email o\'zgartirsam nima bo\'ladi?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Muammo yo\'q! Sizning biometriyangiz hali ham ishlaydi.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Mavjud biometrik ma\'lumotlaringizdan foydalanib kirishingiz mumkin.';

  @override
  String get tips => 'Maslahatlar';

  @override
  String get beforeUsingPasskeys => 'Biometriyadan foydalanishdan oldin';

  @override
  String get enableScreenLock => 'Qurilmangizda ekran qulfini yoqing.';

  @override
  String get signInGoogleOrIcloud => 'Google yoki iCloud hisobingizga kiring.';

  @override
  String get enableBluetooth => 'Bluetooth-ni yoqing.';

  @override
  String get noPasskeyFound => 'Biometriya topilmadi!';

  @override
  String get noPasskeyFoundDescription => 'Iltimos, ushbu xususiyatdan foydalanish uchun biometriya yarating.';

  @override
  String get maybeLater => 'Balki keyinroq';

  @override
  String get effortlessLoginWithPasskeys => 'Biometriya bilan muammosiz kirish';

  @override
  String get learnMoreAboutPasskeys => 'Biometriya haqida ko\'proq bilib oling';

  @override
  String get noNeedToRememberPassword => 'Parolni eslab qolishning hojati yo\'q';

  @override
  String get useYourBiometrics => 'Biometriya yoki ekranni qulflash bilan yaxshilangan xavfsizlik';

  @override
  String get syncAcrossDevices => 'Qurilmalar bo\'ylab sinxronlash';

  @override
  String get createPasskey => 'Biometriyani yoqish';

  @override
  String get unsupportedPlatform => 'Qo\'llab-quvvatlanmaydigan Platforma';

  @override
  String get storedOn => 'Saqlangan';

  @override
  String get lastUsed => 'Oxirgi ishlatilgan';

  @override
  String get rename => 'Nomini o\'zgartirish';

  @override
  String get revoke => 'Bekor qilish';

  @override
  String get continueTradingButtonText => 'Hozir savdo qiling';

  @override
  String get addMorePasskeysButtonText => 'Yangi biometriya ma\'lumotlarini qo\'shing';

  @override
  String get unableToSetupPasskey => 'Biometriya parametrlarini sozlash mumkin emas';

  @override
  String get unableToSetupPasskeyDescription => 'Biometrik ma\'lumotlaringizni sozlashda biz muammoga duch keldik. Jarayon to\'xtatilgan bo\'lishi yoki sessiya muddati tugagan bo\'lishi mumkin. Iltimos, yana urinib ko\'ring.';

  @override
  String get passkeysOffErrorTitle => 'Biometriya xizmati mavjud emas';

  @override
  String get never => 'Hech qachon';

  @override
  String get unable_to_process_your_request => 'So\'rovingizni qayta ishlay olmadi';

  @override
  String get unable_to_process_your_request_description => 'Biz sizning so\'rovingizni qayta ishlashda vaqtinchalik muammoga duch kelmoqdamiz. Iltimos, keyinroq qayta urinib ko\'ring.';
}
