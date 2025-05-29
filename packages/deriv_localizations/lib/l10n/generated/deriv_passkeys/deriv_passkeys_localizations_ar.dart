import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class DerivPasskeysLocalizationsAr extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'النجاح!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'تم تأمين حسابك الآن باستخدام Biometrics. قم بإدارة Biometrics الخاص بك من خلال إعدادات حساب $platformName الخاص بك.';
  }

  @override
  String get continueButtonText => 'استمر';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع!';

  @override
  String get unexpectedErrorDescription => 'يرجى المحاولة لاحقا.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'اختبر عمليات تسجيل دخول أكثر أمانًا';

  @override
  String get enhanceSecurity => 'الأمان المحسّن على بُعد نقرة واحدة فقط.';

  @override
  String get here => 'هنا';

  @override
  String get effortlessLogin => 'تسجيل الدخول بسهولة باستخدام Biometrics';

  @override
  String get whatArePasskeys => 'ما هي Biometricss؟';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'بديل آمن لكلمات المرور.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'قم بإلغاء قفل حسابك مثل هاتفك - باستخدام القياسات الحيوية أو مسح الوجه أو رقم التعريف الشخصي.';

  @override
  String get whyPasskeys => 'لماذا Biometrics؟';

  @override
  String get whyPasskeysDescription1 => 'طبقة أمان إضافية.';

  @override
  String get whyPasskeysDescription2 => 'الحماية من الوصول غير المصرح به والتصيد الاحتيالي.';

  @override
  String get howToCreatePasskey => 'كيفية إنشاء Biometrics؟';

  @override
  String get howToCreatePasskeyDescription1 => 'انتقل إلى \"إعدادات الحساب\" على المشتقات.';

  @override
  String get howToCreatePasskeyDescription2 => 'يمكنك إنشاء Biometrics واحد لكل جهاز.';

  @override
  String get p2pHowToCreatePasskey => 'كيفية إنشاء مفتاح مرور؟';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'انتقل إلى «الملف الشخصي» في تطبيق Deriv P2P الخاص بك.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'انقر فوق «مفاتيح المرور» لإنشاء مفتاح المرور الخاص بك.';

  @override
  String get whereArePasskeysSaved => 'أين يتم حفظ Biometrics؟';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'أندرويد: مدير كلمات مرور Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: سلسلة مفاتيح iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'ماذا يحدث إذا تم تغيير البريد الإلكتروني لحساب Deriv الخاص بي؟';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'لا توجد مشكلة! لا يزال مفتاح Biometrics بك يعمل.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'سجّل الدخول إلى Deriv باستخدام مفتاح Biometrics لديك.';

  @override
  String get tips => 'نصائح';

  @override
  String get beforeUsingPasskeys => 'قبل استخدام Biometrics';

  @override
  String get enableScreenLock => 'قم بتمكين قفل الشاشة على جهازك.';

  @override
  String get signInGoogleOrIcloud => 'قم بتسجيل الدخول إلى حساب Google أو iCloud الخاص بك.';

  @override
  String get enableBluetooth => 'قم بتمكين البلوتوث.';

  @override
  String get noPasskeyFound => 'لم يتم العثور على Biometrics!';

  @override
  String get noPasskeyFoundDescription => 'يرجى إنشاء Biometrics لاستخدام هذه الميزة.';

  @override
  String get maybeLater => 'ربما في وقت لاحق';

  @override
  String get effortlessLoginWithPasskeys => 'تسجيل الدخول بسهولة باستخدام Biometrics';

  @override
  String get learnMoreAboutPasskeys => 'تعرف على المزيد حول Biometricss';

  @override
  String get noNeedToRememberPassword => 'لا حاجة لتذكر كلمة المرور';

  @override
  String get useYourBiometrics => 'أمان محسّن باستخدام القياسات الحيوية أو قفل الشاشة';

  @override
  String get syncAcrossDevices => 'المزامنة عبر الأجهزة';

  @override
  String get createPasskey => 'إنشاء Biometrics';

  @override
  String get unsupportedPlatform => 'منصة غير مدعومة';

  @override
  String get storedOn => 'تم تخزينها على';

  @override
  String get lastUsed => 'آخر استخدام';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get revoke => 'إلغاء';

  @override
  String get continueTradingButtonText => 'استمر في التداول';

  @override
  String get addMorePasskeysButtonText => 'أضف المزيد من Biometricss';

  @override
  String get unableToSetupPasskey => 'تعذر إعداد مفتاح Biometrics';

  @override
  String get unableToSetupPasskeyDescription => 'لقد واجهنا مشكلة أثناء إعداد Biometrics الخاص بك. ربما تمت مقاطعة العملية، أو ربما انتهت مهلة الجلسة. يرجى المحاولة مرة أخرى.';

  @override
  String get passkeysOffErrorTitle => 'خدمة Biometrics غير متوفرة';

  @override
  String get never => 'أبداً';

  @override
  String get unable_to_process_your_request => 'غير قادر على معالجة طلبك';

  @override
  String get unable_to_process_your_request_description => 'نحن نواجه مشكلة مؤقتة في معالجة طلبك. يرجى المحاولة مرة أخرى لاحقًا.';
}
