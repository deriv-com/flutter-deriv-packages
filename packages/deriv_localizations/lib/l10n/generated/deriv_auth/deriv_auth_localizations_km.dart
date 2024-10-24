import 'deriv_auth_localizations.dart';

/// The translations for Khmer Central Khmer (`km`).
class DerivAuthLocalizationsKm extends DerivAuthLocalizations {
  DerivAuthLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get labelNotAvailable => 'មិនមាន';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app មិនមាននៅក្នុងប្រទេសរបស់អ្នកទេ';
  }

  @override
  String get actionOk => 'យល់ព្រម';

  @override
  String get warnNotAvailableCountries => 'ប្រសិនបើអ្នកមានសំណួរណាមួយ សូមទាក់ទងមកយើងខ្ញុំតាមរយៈ ';

  @override
  String get labelLiveChat => 'ជជែកផ្ទាល់';

  @override
  String get actionSignUpForFree => 'ចុះឈ្មោះដោយឥតគិតថ្លៃ';

  @override
  String get actionLogin => 'ចូល';

  @override
  String get labelTwoFactorAuth => 'ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវពីរកម្រិត';

  @override
  String get informEnterTwoFactorAuthCode => 'បញ្ចូលលេខកូដ 6 ខ្ទង់ពីកម្មវិធីផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៅលើទូរស័ព្ទរបស់អ្នក។';

  @override
  String get labelTwoFactorAuthenticationCode => 'លេខកូដ 2FA';

  @override
  String get actionProceed => 'បន្ត';

  @override
  String get labelLogIn => 'ចូល';

  @override
  String get informLoginOptions => 'ឬចូលជាមួយ';

  @override
  String get labelEmail => 'អ៊ីមែល';

  @override
  String get labelPassword => 'ពាក្យសម្ងាត់';

  @override
  String get actionForgotPassword => 'ភ្លេចពាក្យសម្ងាត់?';

  @override
  String get labelDontHaveAnAccountYet => 'មិនទាន់មានគណនីនៅឡើយទេ?';

  @override
  String get actionCreateANewAccount => 'បង្កើតគណនីថ្មី';

  @override
  String get informInvalidEmailFormat => 'បញ្ចូលអាសយដ្ឋានអ៊ីមែលដែលត្រឹមត្រូវ';

  @override
  String get warnPasswordLength => 'អ្នកគួរតែបញ្ចូលតួអក្សរចំនួន 6-25 ។';

  @override
  String get labelResetPassword => 'កំណត់ពាក្យសម្ងាត់ឡើងវិញ';

  @override
  String get labelChooseNewPass => 'ជ្រើសរើសពាក្យសម្ងាត់ថ្មី';

  @override
  String get labelCreatePass => 'ពាក្យសម្ងាត់';

  @override
  String get informYourPassHasBeenReset => 'ពាក្យសម្ងាត់របស់អ្នកត្រូវបានកំណត់ឡើងវិញ';

  @override
  String get informRedirectLogin => 'អ្នកនឹងត្រូវចូលដោយប្រើពាក្យសម្ងាត់ថ្មីរបស់អ្នក។ រង់ចាំបន្តិច យើងកំពុងបញ្ជូនអ្នកឡើងវិញ។';

  @override
  String get actionResetPass => 'កំណត់ពាក្យសម្ងាត់របស់ខ្ញុំឡើងវិញ';

  @override
  String get informInvalidPasswordFormat => 'សូមបញ្ចូលទម្រង់ពាក្យសម្ងាត់ត្រឹមត្រូវ';

  @override
  String get labelCheckEmail => 'ពិនិត្យអ៊ីមែលរបស់អ្នក';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'យើងបានផ្ញើសារទៅ $email ជាមួយនឹងតំណដើម្បីកំណត់ពាក្យសម្ងាត់របស់អ្នកឡើងវិញ។';
  }

  @override
  String get informResetPassByEmail => 'យើងនឹងផ្ញើអ៊ីមែលជូនអ្នកនូវការណែនាំដើម្បីកំណត់ពាក្យសម្ងាត់របស់អ្នកឡើងវិញ។';

  @override
  String get labelSelectCountry => 'តើអ្នករស់នៅឯណា?';

  @override
  String get labelChooseCountry => 'ជ្រើសរើសប្រទេស';

  @override
  String get warnCountryNotAvailable => 'ជាអកុសល Deriv មិនមាននៅក្នុងប្រទេសរបស់អ្នកទេ។';

  @override
  String get actionNext => 'បន្ទាប់';

  @override
  String get labelEmailIssueHeader => 'ប្រសិនបើអ្នកមិនឃើញអ៊ីមែលពីយើងក្នុងរយៈពេលពីរបីនាទី អ្វីៗមួយចំនួនអាចនឹងកើតឡើង៖';

  @override
  String get labelEmailIssueSpam => 'អ៊ីមែលនេះស្ថិតនៅក្នុងថតឯកសារឥតបានការរបស់អ្នក (ពេលខ្លះរបស់របរបាត់បង់នៅទីនោះ)។';

  @override
  String get labelEmailIssueWrongEmail => 'អ្នកបានផ្តល់អាសយដ្ឋានអ៊ីមែលផ្សេងទៀតដល់យើងដោយចៃដន្យ (ជាធម្មតាជាការងារ ឬផ្ទាល់ខ្លួនជំនួសឱ្យអ្វីដែលអ្នកចង់បាន)។';

  @override
  String get labelEmailIssueTypo => 'អាសយដ្ឋានអ៊ីមែលដែលអ្នកបានបញ្ចូលមានកំហុស ឬវាយអក្សរខុស (កើតឡើងចំពោះយើងភាគច្រើន)។';

  @override
  String get labelEmailIssueFirewall => 'យើងមិនអាចផ្ញើអ៊ីមែលទៅកាន់អាសយដ្ឋាននេះបានទេ (ជាធម្មតាដោយសារតែជញ្ជាំងភ្លើង ឬការច្រោះ)។';

  @override
  String get actionReenterEmail => 'បញ្ចូលអ៊ីមែលរបស់អ្នកឡើងវិញ ហើយសាកល្បងម្តងទៀត';

  @override
  String get labelKeepPassword => 'រក្សាគណនីរបស់អ្នកឱ្យមានសុវត្ថិភាពជាមួយពាក្យសម្ងាត់';

  @override
  String get labelCreatePassword => 'បង្កើតពាក្យសម្ងាត់';

  @override
  String get actionStartTrading => 'ចាប់ផ្តើមការជួញដូរ';

  @override
  String get actionPrevious => 'មុន';

  @override
  String get labelSignUp => 'ចុះឈ្មោះ';

  @override
  String get labelOrSignUpWith => 'ឬចុះឈ្មោះជាមួយ';

  @override
  String get labelReferralInfoTitle => 'លេខកូដបញ្ជូនសម្ព័ន្ធ';

  @override
  String get infoReferralInfoDescription => 'លេខកូដអក្សរក្រម និងលេខដែលផ្តល់ដោយសម្ព័ន្ធ Deriv ដែលអាចអនុវត្តបានសម្រាប់ការចុះឈ្មោះតាមអ៊ីមែលតែប៉ុណ្ណោះ។';

  @override
  String get labelGotReferralCode => 'មានលេខកូដបញ្ជូនទេ?';

  @override
  String get labelHaveAccount => 'មានគណនីរួចហើយឬនៅ?';

  @override
  String get actionCreateAccount => 'បង្កើតគណនីបង្ហាញឥតគិតថ្លៃ';

  @override
  String get informInvalidReferralCode => 'លេខកូដបញ្ជូនដែលអ្នកបានបញ្ចូលមិនត្រឹមត្រូវ។ ពិនិត្យ និងសាកល្បងម្តងទៀត។';

  @override
  String get labelVerifyYourEmail => 'ផ្ទៀងផ្ទាត់អ៊ីមែលរបស់អ្នក';

  @override
  String get labelThanksEmail => 'សូមអរគុណសម្រាប់ការផ្ទៀងផ្ទាត់អ៊ីមែលរបស់អ្នក';

  @override
  String get informLetsContinue => 'តោះបន្ត។';

  @override
  String get actionContinue => 'បន្ត';

  @override
  String get labelSearchCountry => 'ស្វែងរកប្រទេស';

  @override
  String informVerificationEmailSent(String email) {
    return 'យើងបានផ្ញើសារទៅ $email ជាមួយនឹងតំណដើម្បីធ្វើឱ្យគណនីរបស់អ្នកសកម្ម។';
  }

  @override
  String get actionEmailNotReceived => 'មិនបានទទួលអ៊ីមែលរបស់អ្នកទេ?';

  @override
  String get informPasswordPolicy => 'ពាក្យសម្ងាត់របស់អ្នកត្រូវតែមាន៖';

  @override
  String get informPasswordPolicyLength => '8-25 តួអក្សរ';

  @override
  String get informPasswordPolicyLowerAndUpper => 'អក្សរធំ និងអក្សរតូច';

  @override
  String get informPasswordPolicyNumber => 'យ៉ាងហោចណាស់មួយលេខ';

  @override
  String get warnPasswordContainsSymbol => 'ប្រើនិមិត្តសញ្ញាសម្រាប់ពាក្យសម្ងាត់ខ្លាំង។';

  @override
  String get labelReferralCode => 'លេខកូដបញ្ជូន';

  @override
  String get actionTryAgain => 'សាកល្បងម្តងទៀត';

  @override
  String get informInvalid2FACode => 'លេខកូដដែលអ្នកបានបញ្ចូលមិនត្រឹមត្រូវ។ ពិនិត្យ និងសាកល្បងម្តងទៀត។';

  @override
  String get informFailedAuthentication => 'អ៊ីមែល ឬពាក្យសម្ងាត់របស់អ្នកអាចនឹងមិនត្រឹមត្រូវ។ តើអ្នកបានចុះឈ្មោះជាមួយគណនីសង្គមមែនទេ? ពិនិត្យ និងសាកល្បងម្តងទៀត។';

  @override
  String get informDeactivatedAccount => 'គណនីរបស់អ្នកត្រូវបានអសកម្ម។';

  @override
  String get informFailedAuthorization => 'ការអនុញ្ញាតបរាជ័យ។';

  @override
  String get informInvalidResidence => 'ការស្នាក់នៅមិនត្រឹមត្រូវ។';

  @override
  String get informInvalidCredentials => 'អត្តសញ្ញាណមិនត្រឹមត្រូវ។';

  @override
  String get informMissingOtp => 'ពាក្យសម្ងាត់មួយដងបាត់។';

  @override
  String get informSelfClosed => 'គណនីរបស់អ្នកត្រូវបានបិទ។';

  @override
  String get informUnexpectedError => 'កំហុសដែលមិនបានរំពឹងទុកបានកើតឡើង។';

  @override
  String get informUnsupportedCountry => 'ប្រទេសរបស់អ្នកមិនត្រូវបានគាំទ្រទេ។';

  @override
  String get informExpiredAccount => 'គណនីរបស់អ្នកផុតកំណត់ហើយ';

  @override
  String get labelCountryConsentBrazil => 'ខ្ញុំសូមបញ្ជាក់នៅទីនេះថា សំណើរបស់ខ្ញុំសម្រាប់ការបើកគណនីជាមួយ Deriv ដើម្បីធ្វើពាណិជ្ជកម្មផលិតផល OTC ដែលចេញ និងផ្តល់ជូនផ្តាច់មុខនៅខាងក្រៅប្រទេសប្រេស៊ីល ត្រូវបានផ្តួចផ្តើមដោយខ្ញុំ។ ខ្ញុំយល់ច្បាស់ទាំងស្រុងថា Deriv មិនត្រូវបានគ្រប់គ្រងដោយ CVM ហើយដោយការទាក់ទង Deriv ខ្ញុំមានបំណងបង្កើតទំនាក់ទំនងជាមួយក្រុមហ៊ុនបរទេស។';

  @override
  String get informConnectionError => 'កំហុសក្នុងការតភ្ជាប់។ សូមព្យាយាមម្តងទៀតនៅពេលក្រោយ។';

  @override
  String get informSwitchAccountError => 'កំហុសក្នុងការប្តូរគណនី។ សូមព្យាយាមម្តងទៀតនៅពេលក្រោយ។';

  @override
  String get labelDeveloper => 'អ្នកអភិវឌ្ឍន៍';

  @override
  String get labelEndpoint => 'ចំណុចបញ្ចប់';

  @override
  String get semanticEndpoint => 'ចំណុចបញ្ចប់';

  @override
  String get warnInvalidEndpoint => 'ចំណុចបញ្ចប់មិនត្រឹមត្រូវ';

  @override
  String get labelApplicationID => 'លេខសម្គាល់កម្មវិធី';

  @override
  String get semanticApplicationID => 'លេខសម្គាល់កម្មវិធី';

  @override
  String get warnInvalidApplicationID => 'លេខសម្គាល់កម្មវិធីមិនត្រឹមត្រូវ';

  @override
  String get labelLanguage => 'ភាសា';
}
