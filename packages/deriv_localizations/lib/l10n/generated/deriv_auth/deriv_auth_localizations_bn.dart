import 'deriv_auth_localizations.dart';

/// The translations for Bengali Bangla (`bn`).
class DerivAuthLocalizationsBn extends DerivAuthLocalizations {
  DerivAuthLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get labelNotAvailable => 'উপলব্ধ নেই';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app আপনার দেশে উপলব্ধ নেই';
  }

  @override
  String get actionOk => 'ওকে';

  @override
  String get warnNotAvailableCountries => 'আপনার যদি কোনও প্রশ্ন থাকে তবে আমাদের মাধ্যমে যোগাযোগ করুন ';

  @override
  String get labelLiveChat => 'লাইভ চ্যাট';

  @override
  String get actionSignUpForFree => 'বিনামূল্যে সাইন আপ করুন';

  @override
  String get actionLogin => 'লগ ইন';

  @override
  String get labelTwoFactorAuth => 'দুই ফ্যাক্টর প্রমাণীকরণ';

  @override
  String get informEnterTwoFactorAuthCode => 'আপনার ফোনে প্রমাণীকরণকারী অ্যাপ থেকে 6-অঙ্কের কোড লিখুন।';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA কোড';

  @override
  String get actionProceed => 'এগিয়ে যাও';

  @override
  String get labelLogIn => 'লগ ইন';

  @override
  String get informLoginOptions => 'অথবা লগ ইন করুন';

  @override
  String get labelEmail => 'ই-মেইল';

  @override
  String get labelPassword => 'পাসওয়ার্ড';

  @override
  String get actionForgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get labelDontHaveAnAccountYet => 'এখনও অ্যাকাউন্ট নেই?';

  @override
  String get actionCreateANewAccount => 'একটি নতুন অ্যাকাউন্ট তৈরি করুন';

  @override
  String get informInvalidEmailFormat => 'একটি বৈধ ইমেল ঠিকানা লিখুন';

  @override
  String get warnPasswordLength => 'আপনার 8-25 অক্ষর লিখতে হবে।';

  @override
  String get labelResetPassword => 'পাসওয়ার্ড রিসেট';

  @override
  String get labelChooseNewPass => 'একটি নতুন পাসওয়ার্ড বেছে নিন';

  @override
  String get labelCreatePass => 'পাসওয়ার্ড';

  @override
  String get informYourPassHasBeenReset => 'আপনার পাসওয়ার্ড পুনরায় সেট করা হয়েছে';

  @override
  String get informRedirectLogin => 'আপনাকে আপনার নতুন পাসওয়ার্ড দিয়ে লগ ইন করতে হবে। ধরে রাখুন, আমরা আপনাকে পুনর্নির্দেশ করছি।';

  @override
  String get actionResetPass => 'আমার পাসওয়ার্ড রিসেট';

  @override
  String get informInvalidPasswordFormat => 'অনুগ্রহ করে একটি বৈধ পাসওয়ার্ড ফর্ম্যাট লিখুন';

  @override
  String get labelCheckEmail => 'আপনার ইমেইল চেক করুন';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'আমরা আপনার পাসওয়ার্ড পুনরায় সেট $email করার জন্য একটি লিঙ্ক সহ একটি বার্তা পাঠিয়েছি।';
  }

  @override
  String get informResetPassByEmail => 'আপনার পাসওয়ার্ড পুনরায় সেট করার জন্য আমরা আপনাকে নির্দেশাবলী ইমেইল করব।';

  @override
  String get labelSelectCountry => 'আপনি কোথায় থাকেন?';

  @override
  String get labelChooseCountry => 'দেশ নির্বাচন করুন';

  @override
  String get warnCountryNotAvailable => 'দুর্ভাগ্যবশত, Deriv আপনার দেশে পাওয়া যায় না।';

  @override
  String get actionNext => 'পরবর্তী';

  @override
  String get labelEmailIssueHeader => 'যদি আপনি কয়েক মিনিটের মধ্যে আমাদের কাছ থেকে কোন ইমেল না দেখেন, তবে কিছু ঘটনা ঘটতে পারত:';

  @override
  String get labelEmailIssueSpam => 'ইমেলটি আপনার স্প্যাম ফোল্ডারে রয়েছে (কখনও কখনও কিছু সেখানে হারিয়ে যায়)।';

  @override
  String get labelEmailIssueWrongEmail => 'আপনি ঘটনাক্রমে আমাদের অন্য একটি ইমেল ঠিকানা দিয়েছেন (সাধারণত একটি কাজ বা আপনি বোঝানো এক পরিবর্তে একটি ব্যক্তিগত এক)।';

  @override
  String get labelEmailIssueTypo => 'আপনার প্রবেশ করা ইমেল ঠিকানাটি একটি ভুল বা টাইপো ছিল (আমাদের সেরা ক্ষেত্রে ঘটে)।';

  @override
  String get labelEmailIssueFirewall => 'আমরা এই ঠিকানায় ইমেলটি সরবরাহ করতে পারি না (সাধারণত ফায়ারওয়াল বা ফিল্টারিংয়ের কারণে)।';

  @override
  String get actionReenterEmail => 'আপনার ইমেইল পুনরায় প্রবেশ করুন এবং পুনরায় চেষ্টা করুন';

  @override
  String get labelKeepPassword => 'পাসওয়ার্ড দিয়ে আপনার অ্যাকাউন্টকে নিরাপদ রাখুন';

  @override
  String get labelCreatePassword => 'পাসওয়ার্ড তৈরি করুন';

  @override
  String get actionStartTrading => 'ট্রেডিং শুরু করুন';

  @override
  String get actionPrevious => 'পূর্ববর্তী';

  @override
  String get labelSignUp => 'সাইন আপ';

  @override
  String get labelOrSignUpWith => 'অথবা সাইন আপ করুন';

  @override
  String get labelReferralInfoTitle => 'অ্যাফিলিয়েট রেফারেল';

  @override
  String get infoReferralInfoDescription => 'একটি Deriv অ্যাফিলিয়েট দ্বারা প্রদত্ত একটি আলফানিমেরিক কোড, শুধুমাত্র ইমেল সাইন আপের জন্য প্রযোজ্য।';

  @override
  String get labelGotReferralCode => 'একটি রেফারেল কোড পেয়েছেন?';

  @override
  String get labelHaveAccount => 'ইতিমধ্যে একটি অ্যাকাউন্ট আছে কি?';

  @override
  String get actionCreateAccount => 'ফ্রি ডেমো অ্যাকাউন্ট তৈরি করুন';

  @override
  String get informInvalidReferralCode => 'আপনি যে রেফারেল কোড লিখেছেন তা অবৈধ। চেক করুন এবং আবার চেষ্টা করুন।';

  @override
  String get labelVerifyYourEmail => 'আমার ইমেইল যাচাই';

  @override
  String get labelThanksEmail => 'আপনার ইমেইল যাচাই করার জন্য ধন্যবাদ';

  @override
  String get informLetsContinue => 'চলুন চালিয়ে যাক।';

  @override
  String get actionContinue => 'চালিয়ে যান';

  @override
  String get labelSearchCountry => 'দেশ অনুসন্ধান করুন';

  @override
  String informVerificationEmailSent(String email) {
    return 'আমরা আপনার অ্যাকাউন্ট সক্রিয় করার জন্য $email একটি লিঙ্ক সহ একটি বার্তা পাঠিয়েছি।';
  }

  @override
  String get actionEmailNotReceived => 'আপনার ইমেইল কি পাওয়া যায়নি?';

  @override
  String get informPasswordPolicy => 'আপনার পাসওয়ার্ড অবশ্যই থাকতে হবে:';

  @override
  String get informPasswordPolicyLength => '8-25 অক্ষর';

  @override
  String get informPasswordPolicyLowerAndUpper => 'উচ্চ এবং নিম্ন কেস অক্ষর';

  @override
  String get informPasswordPolicyNumber => 'অন্তত একটি সংখ্যা';

  @override
  String get warnPasswordContainsSymbol => 'শক্তিশালী পাসওয়ার্ড জন্য প্রতীক ব্যবহার';

  @override
  String get labelReferralCode => 'রেফারেল কোড';

  @override
  String get actionTryAgain => 'পুনরায় চেষ্টা করুন';

  @override
  String get informInvalid2FACode => 'আপনি যে কোডটি প্রবেশ করেছেন তা অবৈধ। চেক করুন এবং আবার চেষ্টা করুন।';

  @override
  String get informFailedAuthentication => 'আপনার ইমেল বা পাসওয়ার্ড ভুল হতে পারে। আপনি কি একটি সামাজিক অ্যাকাউন্ট দিয়ে সাইন আপ করেছেন? চেক করুন এবং আবার চেষ্টা করুন।';

  @override
  String get informDeactivatedAccount => 'আপনার অ্যাকাউন্ট নিষ্ক্রিয় করা হয়েছে।';

  @override
  String get informFailedAuthorization => 'অনুমোদন ব্যর্থ হয়েছে।';

  @override
  String get informInvalidResidence => 'অবৈধ বাসস্থান।';

  @override
  String get informInvalidCredentials => 'অবৈধ শংসাপত্র।';

  @override
  String get informMissingOtp => 'একবার পাসওয়ার্ড অনুপস্থিত।';

  @override
  String get informSelfClosed => 'আপনার অ্যাকাউন্ট বন্ধ করা হয়েছে।';

  @override
  String get informUnexpectedError => 'অপ্রত্যাশিত ত্রুটি ঘটেছে।';

  @override
  String get informUnsupportedCountry => 'আপনার দেশ সমর্থিত হয়নি।';

  @override
  String get informExpiredAccount => 'আপনার অ্যাকাউন্টের মেয়াদ শেষ হয়েছে';

  @override
  String get labelCountryConsentBrazil => 'আমি এর মাধ্যমে নিশ্চিত করি যে ব্রাজিলের বাইরে একচেটিয়াভাবে জারি করা এবং দেওয়া ওটিসি পণ্যগুলি বাণিজ্য করার জন্য ডেরিভের সাথে একটি অ্যাকাউন্ট খোলার জন্য আমার অনুরোধ আমার দ্বারা শুরু আমি পুরোপুরি বুঝতে পারি যে ডেরিভ সিভিএম দ্বারা নিয়ন্ত্রিত নয় এবং ডেরিভের কাছে পৌঁছানোর মাধ্যমে আমি একটি বিদেশী সংস্থার সাথে সম্পর্ক স্থাপন করার ইচ্ছা করি।';

  @override
  String get informConnectionError => 'সংযোগ ত্রুটি। দয়া করে পরে আবার চেষ্টা করুন।';

  @override
  String get informSwitchAccountError => 'অ্যাকাউন্ট ত্রুটি পরিবর্তন করুন দয়া করে পরে আবার চেষ্টা করুন।';

  @override
  String get labelDeveloper => 'ডেভেলপার';

  @override
  String get labelEndpoint => 'শেষপ্রান্ত';

  @override
  String get semanticEndpoint => 'শেষপ্রান্ত';

  @override
  String get warnInvalidEndpoint => 'অবৈধ শেষ পয়েন্ট';

  @override
  String get labelApplicationID => 'অ্যাপলিকেশন আইডি';

  @override
  String get semanticApplicationID => 'অ্যাপলিকেশন আইডি';

  @override
  String get warnInvalidApplicationID => 'অবৈধ অ্যাপ্লিকেশন আইডি';

  @override
  String get labelLanguage => 'ভাষা';
}
