import 'deriv_auth_localizations.dart';

/// The translations for Arabic (`ar`).
class DerivAuthLocalizationsAr extends DerivAuthLocalizations {
  DerivAuthLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get labelNotAvailable => 'غير متاح';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app غير متاح في بلدك';
  }

  @override
  String get actionOk => 'حسنا';

  @override
  String get warnNotAvailableCountries => 'إذا كانت لديك أي أسئلة، فاتصل بنا عبر ';

  @override
  String get labelLiveChat => 'دردشة مباشرة';

  @override
  String get actionSignUpForFree => 'اشترك مجاناً';

  @override
  String get actionLogin => 'تسجيل دخول';

  @override
  String get labelTwoFactorAuth => 'المصادقة الثنائية (2FA)';

  @override
  String get informEnterTwoFactorAuthCode => 'أدخل الرمز المكون من 6 أرقام من تطبيق المصادقة على هاتفك.';

  @override
  String get labelTwoFactorAuthenticationCode => 'كود 2FA';

  @override
  String get actionProceed => 'تقدم';

  @override
  String get labelLogIn => 'تسجيل دخول';

  @override
  String get informLoginOptions => 'أو قم بتسجيل الدخول باستخدام';

  @override
  String get labelEmail => 'البريد الإلكتروني';

  @override
  String get labelPassword => 'كلمة المرور';

  @override
  String get actionForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get labelDontHaveAnAccountYet => 'ليس لديك حساب حتى الآن؟';

  @override
  String get actionCreateANewAccount => 'إنشاء حساب جديد';

  @override
  String get informInvalidEmailFormat => 'أدخل عنوان بريد إلكتروني صالح';

  @override
  String get warnPasswordLength => 'يجب إدخال 8-25 حرفًا.';

  @override
  String get labelResetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get labelChooseNewPass => 'اختر كلمة مرور جديدة';

  @override
  String get labelCreatePass => 'كلمة المرور';

  @override
  String get informYourPassHasBeenReset => 'تم إعادة تعيين كلمة المرور الخاصة بك';

  @override
  String get informRedirectLogin => 'ستحتاج إلى تسجيل الدخول باستخدام كلمة المرور الجديدة. انتظر، سنعيد توجيهك.';

  @override
  String get actionResetPass => 'إعادة تعيين كلمة المرور الخاصة بي';

  @override
  String get informInvalidPasswordFormat => 'يرجى إدخال صيغة كلمة مرور صالحة';

  @override
  String get labelCheckEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'لقد أرسلنا رسالة إلى $email مع رابط لإعادة تعيين كلمة المرور الخاصة بك.';
  }

  @override
  String get informResetPassByEmail => 'سنرسل لك تعليمات عبر البريد الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك.';

  @override
  String get labelSelectCountry => 'أين تعيش؟';

  @override
  String get labelChooseCountry => 'اختر البلد';

  @override
  String get warnCountryNotAvailable => 'للأسف، Deriv غير متوفر في بلدك.';

  @override
  String get actionNext => 'التالي';

  @override
  String get labelEmailIssueHeader => 'إذا لم تشاهد بريدًا إلكترونيًا منا في غضون بضع دقائق، فقد تحدث بعض الأشياء:';

  @override
  String get labelEmailIssueSpam => 'البريد الإلكتروني موجود في مجلد الرسائل غير المرغوب فيها (أحيانًا تضيع الأشياء هناك).';

  @override
  String get labelEmailIssueWrongEmail => 'لقد أعطيتنا عن طريق الخطأ عنوان بريد إلكتروني آخر (عادةً ما يكون عنوان عمل أو عنوان شخصي بدلاً من العنوان الذي قصدته).';

  @override
  String get labelEmailIssueTypo => 'عنوان البريد الإلكتروني الذي أدخلته به خطأ أو خطأ مطبعي (يحدث لأفضل منا).';

  @override
  String get labelEmailIssueFirewall => 'لا يمكننا تسليم البريد الإلكتروني إلى هذا العنوان (عادةً بسبب جدران الحماية أو التصفية).';

  @override
  String get actionReenterEmail => 'أعد إدخال بريدك الإلكتروني وحاول مرة أخرى';

  @override
  String get labelKeepPassword => 'حافظ على أمان حسابك باستخدام كلمة مرور';

  @override
  String get labelCreatePassword => 'قم بإنشاء كلمة مرور';

  @override
  String get actionStartTrading => 'ابدأ التداول';

  @override
  String get actionPrevious => 'السابق';

  @override
  String get labelSignUp => 'قم بالتسجيل';

  @override
  String get labelOrSignUpWith => 'أو قم بالتسجيل باستخدام';

  @override
  String get labelReferralInfoTitle => 'رمز الإحالة التابع';

  @override
  String get infoReferralInfoDescription => 'رمز أبجدي رقمي مقدم من شركة تابعة لـ Deriv، ينطبق على عمليات الاشتراك في البريد الإلكتروني فقط.';

  @override
  String get labelGotReferralCode => 'هل لديك رمز إحالة؟';

  @override
  String get labelHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get actionCreateAccount => 'إنشاء حساب تجريبي مجاني';

  @override
  String get informInvalidReferralCode => 'رمز الإحالة الذي أدخلته غير صالح. تحقق وحاول مرة أخرى.';

  @override
  String get labelVerifyYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get labelThanksEmail => 'شكرًا لك على التحقق من بريدك الإلكتروني';

  @override
  String get informLetsContinue => 'دعونا نواصل.';

  @override
  String get actionContinue => 'استمر';

  @override
  String get labelSearchCountry => 'ابحث عن البلد';

  @override
  String informVerificationEmailSent(String email) {
    return 'لقد أرسلنا رسالة إلى $email رابط لتفعيل حسابك.';
  }

  @override
  String get actionEmailNotReceived => 'لم تستلم بريدك الإلكتروني؟';

  @override
  String get informPasswordPolicy => 'يجب أن تحتوي كلمة المرور الخاصة بك على:';

  @override
  String get informPasswordPolicyLength => '8-25 حرفًا';

  @override
  String get informPasswordPolicyLowerAndUpper => 'الأحرف الكبيرة والصغيرة';

  @override
  String get informPasswordPolicyNumber => 'رقم واحد على الأقل';

  @override
  String get warnPasswordContainsSymbol => 'استخدم الرموز لكلمة مرور قوية.';

  @override
  String get labelReferralCode => 'رمز الإحالة';

  @override
  String get actionTryAgain => 'حاول مرة أخرى';

  @override
  String get informInvalid2FACode => 'الرمز الذي أدخلته غير صالح. تحقق وحاول مرة أخرى.';

  @override
  String get informFailedAuthentication => 'قد يكون بريدك الإلكتروني أو كلمة المرور غير صحيحة. هل قمت بالتسجيل باستخدام حساب اجتماعي؟ تحقق وحاول مرة أخرى.';

  @override
  String get informDeactivatedAccount => 'تم إلغاء تنشيط حسابك.';

  @override
  String get informFailedAuthorization => 'فشلت عملية التخويل.';

  @override
  String get informInvalidResidence => 'إقامة غير صالحة.';

  @override
  String get informInvalidCredentials => 'بيانات اعتماد غير صالحة.';

  @override
  String get informMissingOtp => 'كلمة مرور مفقودة لمرة واحدة.';

  @override
  String get informSelfClosed => 'تم إغلاق الحساب الخاص بك.';

  @override
  String get informUnexpectedError => 'حدث خطأ غير متوقع.';

  @override
  String get informUnsupportedCountry => 'بلدك غير مدعوم.';

  @override
  String get informExpiredAccount => 'انتهت صلاحية حسابك';

  @override
  String get labelCountryConsentBrazil => 'أؤكد بموجب هذا أن طلبي لفتح حساب مع Deriv لتداول منتجات OTC الصادرة والمعروضة حصريًا خارج البرازيل قد بادرت به. أفهم تمامًا أن Deriv لا تخضع للتنظيم من قبل CVM ومن خلال الاتصال بـ Deriv أعتزم إقامة علاقة مع شركة أجنبية.';

  @override
  String get informConnectionError => 'خطأ اتصال. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get informSwitchAccountError => 'خطأ في تبديل الحساب. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get labelDeveloper => 'المطوّر';

  @override
  String get labelEndpoint => 'نقطة النهاية';

  @override
  String get semanticEndpoint => 'نقطة النهاية';

  @override
  String get warnInvalidEndpoint => 'نقطة نهاية غير صالحة';

  @override
  String get labelApplicationID => 'معرف التطبيق';

  @override
  String get semanticApplicationID => 'معرف التطبيق';

  @override
  String get warnInvalidApplicationID => 'معرف تطبيق غير صالح';

  @override
  String get labelLanguage => 'اللغة';
}
