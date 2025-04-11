import 'deriv_auth_localizations.dart';

/// The translations for Thai (`th`).
class DerivAuthLocalizationsTh extends DerivAuthLocalizations {
  DerivAuthLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get labelNotAvailable => 'ไม่พร้อมใช้งาน';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app ไม่พร้อมใช้งานในประเทศของคุณ';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries =>
      'หากคุณมีคำถามใดๆ โปรดติดต่อเราผ่านทาง ';

  @override
  String get labelLiveChat => 'แชทสด';

  @override
  String get actionSignUpForFree => 'ลงทะเบียนได้ฟรี';

  @override
  String get actionLogin => 'เข้าสู่ระบบ';

  @override
  String get labelTwoFactorAuth => 'ระบบยืนยันตัวตนสองขั้นตอน';

  @override
  String get informEnterTwoFactorAuthCode =>
      'ป้อนรหัส 6 หลักจากแอปตรวจสอบสิทธิ์บนโทรศัพท์ของคุณ';

  @override
  String get labelTwoFactorAuthenticationCode => 'รหัส 2FA';

  @override
  String get actionProceed => 'ประมวลผล';

  @override
  String get labelLogIn => 'เข้าสู่ระบบ';

  @override
  String get informLoginOptions => 'หรือเข้าสู่ระบบด้วย';

  @override
  String get labelEmail => 'อีเมล์';

  @override
  String get labelPassword => 'รหัสผ่าน';

  @override
  String get actionForgotPassword => 'คุณลืมรหัสผ่านหรือไม่';

  @override
  String get labelDontHaveAnAccountYet => 'ยังไม่มีบัญชีใช่ไหม?';

  @override
  String get actionCreateANewAccount => 'สร้างบัญชีใหม่';

  @override
  String get informInvalidEmailFormat => 'ป้อนที่อยู่อีเมล์ที่ถูกต้อง';

  @override
  String get warnPasswordLength => 'คุณควรป้อนอักขระ 6-25 ตัว';

  @override
  String get labelResetPassword => 'ตั้งค่ารหัสผ่าน';

  @override
  String get labelChooseNewPass => 'เลือกรหัสผ่านอันใหม่';

  @override
  String get labelCreatePass => 'รหัสผ่าน';

  @override
  String get informYourPassHasBeenReset => 'รหัสผ่านของคุณถูกเปลี่ยนแปลงแล้ว';

  @override
  String get informRedirectLogin =>
      'คุณจะต้องเข้าสู่ระบบด้วยรหัสผ่านใหม่ของคุณ รอสักครู่ เรากำลังพาคุณไป';

  @override
  String get actionResetPass => 'ตั้งรหัสผ่านของฉันใหม่';

  @override
  String get informInvalidPasswordFormat => 'กรุณากรอกรูปแบบรหัสผ่านที่ถูกต้อง';

  @override
  String get labelCheckEmail => 'ตรวจสอบอีเมล์ของคุณ';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'เราได้ส่งข้อความไปที่ $email พร้อมลิงก์เพื่อรีเซ็ตรหัสผ่านของคุณ';
  }

  @override
  String get informResetPassByEmail =>
      'เราจะส่งอีเมล์ให้คุณเพื่อแนะนำเกี่ยวกับการตั้งรหัสผ่านใหม่ของคุณ';

  @override
  String get labelSelectCountry => 'คุณอาศัยอยู่ที่ไหน?';

  @override
  String get labelChooseCountry => 'เลือกประเทศ';

  @override
  String get warnCountryNotAvailable =>
      'ขออภัย Deriv ไม่พร้อมให้บริการในประเทศของคุณ';

  @override
  String get actionNext => 'ถัดไป';

  @override
  String get labelEmailIssueHeader =>
      'หากคุณไม่ได้รับอีเมล์จากเราภายในไม่กี่นาที อาจมีบางสิ่งเกิดขึ้น:';

  @override
  String get labelEmailIssueSpam =>
      'อีเมล์นั้นอยู่ในโฟลเดอร์จดหมายขยะของคุณ (บางทีก็มีการพลัดหลงไปที่นั่นได้)';

  @override
  String get labelEmailIssueWrongEmail =>
      'คุณเผอิญให้ที่อยู่อีเมล์อื่นแก่เรา (ปกติมักจะเป็นอีเมล์จากที่ทำงานหรืออีเมล์ส่วนตัวแทนที่จะเป็นอันที่คุณต้องการใช้)';

  @override
  String get labelEmailIssueTypo =>
      'ที่อยู่อีเมล์ที่คุณป้อนมีข้อผิดพลาดหรือคำพิมพ์ผิด (เกิดขึ้นได้กับทุกคน)';

  @override
  String get labelEmailIssueFirewall =>
      'เราไม่สามารถส่งอีเมล์ไปยังที่อยู่นี้ (โดยปกติจะเป็นเพราะไฟร์วอลล์หรือการกรอง)';

  @override
  String get actionReenterEmail => 'ป้อนที่อยู่อีเมล์ของคุณแล้วลองอีกครั้ง';

  @override
  String get labelKeepPassword => 'รักษาบัญชีของคุณให้ปลอดภัยด้วยรหัสผ่าน';

  @override
  String get labelCreatePassword => 'สร้างรหัสผ่าน';

  @override
  String get actionStartTrading => 'เริ่มการเทรด';

  @override
  String get actionPrevious => 'ก่อนหน้า';

  @override
  String get labelSignUp => 'ลงทะเบียนสมัครใช้งาน';

  @override
  String get labelOrSignUpWith => 'หรือลงทะเบียนสมัครไปกับ';

  @override
  String get labelReferralInfoTitle => 'รหัสอ้างอิงพันธมิตร';

  @override
  String get infoReferralInfoDescription =>
      'รหัสตัวอักษรและตัวเลขที่จัดทำโดยพันธมิตรของ Deriv ซึ่งใช้ได้สำหรับการลงทะเบียนสมัครทางอีเมล์เท่านั้น';

  @override
  String get labelGotReferralCode => 'มีรหัสอ้างอิงหรือไม่?';

  @override
  String get labelHaveAccount => 'มีบัญชีอยู่แล้วใช่ไหม?';

  @override
  String get actionCreateAccount => 'สร้างบัญชีทดลองฟรี';

  @override
  String get informInvalidReferralCode =>
      'รหัสอ้างอิงที่คุณป้อนไม่ถูกต้อง โปรดตรวจสอบและลองอีกครั้ง';

  @override
  String get labelVerifyYourEmail => 'ยืนยันอีเมล์ของคุณ';

  @override
  String get labelThanksEmail => 'ขอบคุณที่ยืนยันอีเมล์ของคุณ';

  @override
  String get informLetsContinue => 'ดำเนินการต่อกันเถอะ';

  @override
  String get actionContinue => 'ดำเนินการต่อ';

  @override
  String get labelSearchCountry => 'ค้นหาประเทศ';

  @override
  String informVerificationEmailSent(String email) {
    return 'เราได้ส่งข้อความไปที่ $email พร้อมลิงก์เพื่อเปิดใช้งานบัญชีของคุณ';
  }

  @override
  String get actionEmailNotReceived => 'ไม่ได้รับอีเมล์ของคุณใช่หรือไม่?';

  @override
  String get informPasswordPolicy => 'รหัสผ่านของคุณต้องมี:';

  @override
  String get informPasswordPolicyLength => '8-25 อักขระ';

  @override
  String get informPasswordPolicyLowerAndUpper =>
      'ตัวอักษรตัวพิมพ์ใหญ่และตัวพิมพ์เล็ก';

  @override
  String get informPasswordPolicyNumber => 'อย่างน้อยหนึ่งหมายเลข';

  @override
  String get warnPasswordContainsSymbol =>
      'ใช้สัญลักษณ์เพื่อให้รหัสผ่านเดาได้ยาก';

  @override
  String get labelReferralCode => 'รหัสอ้างอิง';

  @override
  String get actionTryAgain => 'ลองอีกครั้ง';

  @override
  String get informInvalid2FACode =>
      'รหัสที่คุณป้อนไม่ถูกต้อง โปรดตรวจสอบแล้วลองอีกครั้ง';

  @override
  String get informFailedAuthentication =>
      'อีเมล์หรือรหัสผ่านของคุณอาจไม่ถูกต้อง คุณได้ลงทะเบียนด้วยบัญชีโซเชียลหรือไม่? โปรดตรวจสอบแล้วลองอีกครั้ง';

  @override
  String get informDeactivatedAccount => 'บัญชีของคุณถูกปิดใช้งาน';

  @override
  String get informFailedAuthorization => 'การอนุญาตให้สิทธิ์ล้มเหลว';

  @override
  String get informInvalidResidence => 'ที่พักอาศัยไม่ถูกต้อง';

  @override
  String get informInvalidCredentials => 'ข้อมูลประจำตัวไม่ถูกต้อง';

  @override
  String get informMissingOtp => 'รหัสผ่านแบบครั้งเดียวขาดหายไป';

  @override
  String get informSelfClosed => 'บัญชีของคุณได้ถูกปิดแล้ว';

  @override
  String get informUnexpectedError => 'มีข้อผิดพลาดเกิดขึ้น';

  @override
  String get informUnsupportedCountry => 'ไม่รองรับการใช้งานในประเทศของคุณ';

  @override
  String get informExpiredAccount => 'บัญชีของคุณหมดอายุ';

  @override
  String get labelCountryConsentBrazil =>
      'ข้าพเจ้าขอยืนยันว่าคำขอเปิดบัญชีกับ Deriv เพื่อทำการซื้อขายผลิตภัณฑ์ OTC ที่ออกและนำเสนอเฉพาะนอกประเทศบราซิลนั้นมาจากความคิดริเริ่มโดยข้าพเจ้าเอง ข้าพเจ้าเข้าใจดีว่า Deriv ไม่ได้ถูกควบคุมดูแลโดย CVM และในการที่ข้าพเจ้าเข้าหา Deriv นั้นข้าพเจ้ามีเจตนาที่จะสร้างความสัมพันธ์กับบริษัทจากต่างประเทศ';

  @override
  String get informConnectionError =>
      'มีข้อผิดพลาดในการเชื่อมต่อ โปรดลองใหม่ในภายหลัง';

  @override
  String get informSwitchAccountError =>
      'มีข้อผิดพลาดในการสลับบัญชี โปรดลองใหม่ในภายหลัง';

  @override
  String get labelDeveloper => 'ผู้พัฒนาระบบ';

  @override
  String get labelEndpoint => 'อุปกรณ์ปลายทาง';

  @override
  String get semanticEndpoint => 'อุปกรณ์ปลายทาง';

  @override
  String get warnInvalidEndpoint => 'อุปกรณ์ปลายทางไม่ถูกต้อง';

  @override
  String get labelApplicationID => 'รหัสไอดีแอปพลิเคชั่น';

  @override
  String get semanticApplicationID => 'รหัสไอดีแอปพลิเคชั่น';

  @override
  String get warnInvalidApplicationID => 'รหัสไอดีแอปพลิเคชั่นไม่ถูกต้อง';

  @override
  String get labelLanguage => 'ภาษา';
}
