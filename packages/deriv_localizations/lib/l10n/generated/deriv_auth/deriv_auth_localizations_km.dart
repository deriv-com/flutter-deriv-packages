import 'deriv_auth_localizations.dart';

/// The translations for Khmer Central Khmer (`km`).
class DerivAuthLocalizationsKm extends DerivAuthLocalizations {
  DerivAuthLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get labelNotAvailable => 'មិនអាចប្រើបានទេ';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app មិនអាចប្រើបានទេនៅក្នុងប្រទេសរបស់អ្នក។';
  }

  @override
  String get actionOk => 'យល់ព្រម';

  @override
  String get warnNotAvailableCountries => 'ប្រសិនបើអ្នកមានសំណួរណាមួយ សូមទាក់ទងមកយើងខ្ញុំតាមរយៈ ';

  @override
  String get labelLiveChat => 'ការជជែកផ្ទាល់';

  @override
  String get actionSignUpForFree => 'ចុះឈ្មោះដោយឥតគិតថ្លៃ';

  @override
  String get actionLogin => 'ចូលប្រព័ន្ធ';

  @override
  String get labelTwoFactorAuth => 'ការផ្ទៀងផ្ទាត់បែបពីរជាន់';

  @override
  String get informEnterTwoFactorAuthCode => 'បញ្ចូលលេខកូដ 6 ខ្ទង់ពីកម្មវិធីផ្ទៀងផ្ទាត់នៅលើទូរសព្ទរបស់អ្នក។';

  @override
  String get labelTwoFactorAuthenticationCode => 'លេខកូដ 2FA';

  @override
  String get actionProceed => 'ដំណើរការ';

  @override
  String get labelLogIn => 'ចូលប្រព័ន្ធ';

  @override
  String get informLoginOptions => 'ឬចូលប្រព័ន្ធដោយ';

  @override
  String get labelEmail => 'អ៊ីមែល';

  @override
  String get labelPassword => 'ពាក្យសម្ងាត់';

  @override
  String get actionForgotPassword => 'ភ្លេចពាក្យសម្ងាត់?';

  @override
  String get labelDontHaveAnAccountYet => 'មិនទាន់មានគណនីមែនទេ?';

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
  String get informRedirectLogin => 'អ្នកនឹងត្រូវចូលប្រព័ន្ធដោយប្រើពាក្យសម្ងាត់ថ្មីរបស់អ្នក។ សូមរង់ចាំ យើងកំពុងបញ្ជូនអ្នកបន្ត។';

  @override
  String get actionResetPass => 'កំណត់ពាក្យសម្ងាត់របស់ខ្ញុំឡើងវិញ';

  @override
  String get informInvalidPasswordFormat => 'សូមបញ្ចូលទម្រង់ពាក្យសម្ងាត់ដែលត្រឹមត្រូវ';

  @override
  String get labelCheckEmail => 'ពិនិត្យអ៊ីមែលរបស់អ្នក';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'យើង​បាន​ផ្ញើ​សារ​ទៅ $email ដោយ​មាន​តំណ​ដើម្បី​កំណត់​ពាក្យ​សម្ងាត់​របស់​អ្នក​ឡើង​វិញ។';
  }

  @override
  String get informResetPassByEmail => 'យើងនឹងផ្ញើអ៊ីមែលទៅអ្នកនូវការណែនាំដើម្បីកំណត់ពាក្យសម្ងាត់របស់អ្នកឡើងវិញ។';

  @override
  String get labelSelectCountry => 'តើអ្នករស់នៅឯណា?';

  @override
  String get labelChooseCountry => 'ជ្រើសរើសប្រទេស';

  @override
  String get warnCountryNotAvailable => 'សូមអភ័យទោស Deriv មិនមាននៅក្នុងប្រទេសរបស់អ្នកទេ។';

  @override
  String get actionNext => 'បន្ទាប់';

  @override
  String get labelEmailIssueHeader => 'ប្រសិនបើអ្នកមិនឃើញអ៊ីមែលពីយើងក្នុងរយៈពេលពីរបីនាទីទេ រឿងមួយចំនួនអាចកើតឡើង៖';

  @override
  String get labelEmailIssueSpam => 'អ៊ីមែលស្ថិតនៅក្នុងថតសារឥតបានការរបស់អ្នក (ពេលខ្លះអ្វីៗត្រូវបានបាត់បង់នៅទីនោះ)។';

  @override
  String get labelEmailIssueWrongEmail => 'អ្នកបានផ្តល់អាសយដ្ឋានអ៊ីមែលមួយទៀតមកយើងដោយចៃដន្យ (ជាធម្មតាជាអ៊ីមេលការងារ ឬអ៊ីមែលផ្ទាល់ខ្លួនជំនួសឱ្យអ៊ីមែលដែលអ្នកចង់ប្រើ)។';

  @override
  String get labelEmailIssueTypo => 'អាសយដ្ឋានអ៊ីមែលដែលអ្នកបានបញ្ចូលមានកំហុស ឬវាយអក្សរខុស (កើតឡើងចំពោះពួកយើងគ្រប់គ្នា)។';

  @override
  String get labelEmailIssueFirewall => 'យើង​មិន​អាច​ផ្ញើ​អ៊ីមែល​ទៅ​អាសយដ្ឋាន​នេះ​បាន​ទេ (ជា​ធម្មតា​ដោយ​សារមានការកំណត់​ជញ្ជាំង​ភ្លើង ឬ​តម្រង)។';

  @override
  String get actionReenterEmail => 'បញ្ចូលអ៊ីមែលរបស់អ្នកឡើងវិញ ហើយព្យាយាមម្តងទៀត';

  @override
  String get labelKeepPassword => 'រក្សាគណនីរបស់អ្នកឱ្យមានសុវត្ថិភាពដោយប្រើពាក្យសម្ងាត់';

  @override
  String get labelCreatePassword => 'បង្កើតពាក្យសម្ងាត់';

  @override
  String get actionStartTrading => 'ចាប់ផ្តើមការជួញដូរ';

  @override
  String get actionPrevious => 'ពីមុន';

  @override
  String get labelSignUp => 'ចុះឈ្មោះ';

  @override
  String get labelOrSignUpWith => 'ឬចុះឈ្មោះដោយ';

  @override
  String get labelReferralInfoTitle => 'លេខ​កូដណែនាំសម្ព័ន្ធមិត្ត';

  @override
  String get infoReferralInfoDescription => 'លេខកូដអក្សរក្រមលេខដែលផ្តល់ដោយសម្ព័ន្ធមិត្ត Deriv អាចប្រើបានសម្រាប់ការចុះឈ្មោះតាមអ៊ីមែលតែប៉ុណ្ណោះ។';

  @override
  String get labelGotReferralCode => 'មានលេខកូដណែនាំទេ?';

  @override
  String get labelHaveAccount => 'មានគណនីរួចហើយមែនទេ?';

  @override
  String get actionCreateAccount => 'បង្កើតគណនីសាកល្បងឥតគិតថ្លៃ';

  @override
  String get informInvalidReferralCode => 'លេខកូដណែនាំដែលអ្នកបានបញ្ចូលមិនត្រឹមត្រូវទេ។ ពិនិត្យមើល ហើយព្យាយាមម្តងទៀត។';

  @override
  String get labelVerifyYourEmail => 'ផ្ទៀងផ្ទាត់អ៊ីមែលរបស់អ្នក';

  @override
  String get labelThanksEmail => 'អរគុណសម្រាប់ការផ្ទៀងផ្ទាត់អ៊ីមែលរបស់អ្នក';

  @override
  String get informLetsContinue => 'សូមបន្តដំណើរការ។';

  @override
  String get actionContinue => 'ដំណើរការបន្ត';

  @override
  String get labelSearchCountry => 'ស្វែងរកប្រទេស';

  @override
  String informVerificationEmailSent(String email) {
    return 'យើង​បាន​ផ្ញើ​សារ​ទៅ $email ដោយ​មាន​តំណ​ដើម្បី​ដំណើរការ​គណនី​របស់​អ្នក។';
  }

  @override
  String get actionEmailNotReceived => 'មិនបានទទួលអ៊ីមែលរបស់អ្នកមេនទេ?';

  @override
  String get informPasswordPolicy => 'ពាក្យសម្ងាត់របស់អ្នកត្រូវតែមាន៖';

  @override
  String get informPasswordPolicyLength => '8-25 តួអក្សរ';

  @override
  String get informPasswordPolicyLowerAndUpper => 'អក្សរធំ និងអក្សរតូច';

  @override
  String get informPasswordPolicyNumber => 'យ៉ាងហោចណាស់មានមួយតួលេខ';

  @override
  String get warnPasswordContainsSymbol => 'ប្រើនិមិត្តសញ្ញាដើម្បីឲ្យពាក្យសម្ងាត់ខ្លាំង។';

  @override
  String get labelReferralCode => 'លេខកូដយោង';

  @override
  String get actionTryAgain => 'ព្យាយាមម្តងទៀត';

  @override
  String get informInvalid2FACode => 'លេខកូដដែលអ្នកបានបញ្ចូលមិនត្រឹមត្រូវទេ។ ពិនិត្យមើល ហើយព្យាយាមម្តងទៀត។';

  @override
  String get informFailedAuthentication => 'អ៊ីមែល ឬពាក្យសម្ងាត់របស់អ្នកអាចមិនត្រឹមត្រូវ។ តើអ្នកបានចុះឈ្មោះជាមួយគណនីសង្គមទេ? ពិនិត្យមើល ហើយព្យាយាមម្តងទៀត។';

  @override
  String get informDeactivatedAccount => 'គណនីរបស់អ្នកត្រូវបានបិទដំណើរការ។';

  @override
  String get informFailedAuthorization => 'ការអនុញ្ញាតបានបរាជ័យ។';

  @override
  String get informInvalidResidence => 'ទីលំនៅមិនត្រឹមត្រូវ។';

  @override
  String get informInvalidCredentials => 'ព័ត៌មានសម្គាល់ខ្លួនមិនត្រឹមត្រូវ';

  @override
  String get informMissingOtp => 'បាត់ពាក្យសម្ងាត់បែបមួយជាន់។';

  @override
  String get informSelfClosed => 'គណនីរបស់អ្នកត្រូវបានបិទ។';

  @override
  String get informUnexpectedError => 'កំហុសដែលមិនបានរំពឹងទុកបានកើតឡើង។';

  @override
  String get informUnsupportedCountry => 'ប្រទេសរបស់អ្នកមិនត្រូវបានគាំទ្រការប្រើប្រាស់ទេ។';

  @override
  String get informExpiredAccount => 'គណនីរបស់អ្នកផុតកំណត់ហើយ';

  @override
  String get labelCountryConsentBrazil => 'ខ្ញុំសូមបញ្ជាក់ថា សំណើរបស់ខ្ញុំសម្រាប់ការបើកគណនីជាមួយ Deriv ដើម្បីជួញដូរផលិតផល OTC ដែលបានចេញ និងផ្តល់ជូនផ្តាច់មុខនៅខាងក្រៅប្រទេសប្រេស៊ីលត្រូវបានផ្តួចផ្តើមដោយខ្ញុំផ្ទាល់។ ខ្ញុំយល់ច្បាស់ថា Deriv មិនត្រូវបានគ្រប់គ្រងដោយ CVM ហើយដោយការចូលទៅជិត Deriv ខ្ញុំមានបំណងបង្កើតទំនាក់ទំនងជាមួយក្រុមហ៊ុនបរទេស។';

  @override
  String get informConnectionError => 'កំហុសក្នុងការតភ្ជាប់។ សូមព្យាយាមម្តងទៀតនៅពេលក្រោយ។';

  @override
  String get informSwitchAccountError => 'កំហុសក្នុងការប្តូរគណនី។ សូមព្យាយាមម្តងទៀតនៅពេលក្រោយ។';

  @override
  String get labelDeveloper => 'អ្នកអភិវឌ្ឍន៍';

  @override
  String get labelEndpoint => 'ឧបករណ៍គោលដៅ';

  @override
  String get semanticEndpoint => 'ឧបករណ៍គោលដៅ';

  @override
  String get warnInvalidEndpoint => 'ឧបករណ៍គោលដៅមិនត្រឹមត្រូវ';

  @override
  String get labelApplicationID => 'លេខសម្គាល់កម្មវិធី';

  @override
  String get semanticApplicationID => 'លេខសម្គាល់កម្មវិធី';

  @override
  String get warnInvalidApplicationID => 'លេខសម្គាល់កម្មវិធីមិនត្រឹមត្រូវ';

  @override
  String get labelLanguage => 'ភាសា';
}
