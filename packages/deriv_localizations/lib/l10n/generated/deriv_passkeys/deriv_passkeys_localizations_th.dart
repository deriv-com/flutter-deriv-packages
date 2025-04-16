import 'deriv_passkeys_localizations.dart';

/// The translations for Thai (`th`).
class DerivPasskeysLocalizationsTh extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'สำเร็จแล้ว!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'ตอนนี้บัญชีของคุณได้รับการรักษาความปลอดภัยด้วย Passkey โดยสามารถจัดการ Passkey นี้ได้ผ่านการตั้งค่าบัญชี $platformName ของคุณ';
  }

  @override
  String get continueButtonText => 'ดำเนินการต่อ';

  @override
  String get unexpectedError => 'มีข้อผิดพลาดเกิดขึ้น!';

  @override
  String get unexpectedErrorDescription => 'โปรดลองอีกครั้งในภายหลัง';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'สัมผัสประสบการณ์การเข้าสู่ระบบที่ปลอดภัยขึ้น';

  @override
  String get enhanceSecurity => 'การเสริมความปลอดภัยที่อยู่แค่เพียงคุณแตะปุ่มเดียว';

  @override
  String get here => 'ที่นี่';

  @override
  String get effortlessLogin => 'เข้าสู่ระบบได้อย่างง่ายดายด้วย Passkey';

  @override
  String get whatArePasskeys => 'Passkey คืออะไร?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'ทางเลือกที่ปลอดภัยนอกเหนือไปจากรหัสผ่าน';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'ปลดล็อคบัญชีคุณได้เหมือนที่ทำในโทรศัพท์ - ผ่านไบโอเมตริกซ์ การสแกนใบหน้า หรือหมายเลข PIN';

  @override
  String get whyPasskeys => 'ทำไมต้องใช้ Passkey?';

  @override
  String get whyPasskeysDescription1 => 'เพิ่มอีกชั้นความปลอดภัยพิเศษ';

  @override
  String get whyPasskeysDescription2 => 'กันการเข้าถึงที่ไม่ได้อนุญาตและการโจมตีแบบฟิชชิ่ง';

  @override
  String get howToCreatePasskey => 'จะสร้าง Passkey ได้อย่างไร?';

  @override
  String get howToCreatePasskeyDescription1 => 'ไปที่ \'การตั้งค่าบัญชี\' บน Deriv';

  @override
  String get howToCreatePasskeyDescription2 => 'คุณสามารถสร้างหนึ่ง Passkey ต่ออุปกรณ์';

  @override
  String get p2pHowToCreatePasskey => 'จะสร้าง Passkey ได้อย่างไร?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'ไปที่ \'โปรไฟล์\' ในแอป Deriv P2P ของคุณ';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'แตะ \'Passkeys\' เพื่อสร้าง Passkey ของคุณ';

  @override
  String get whereArePasskeysSaved => 'Passkey จะถูกบันทึกไว้ที่ไหน?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: ตัวจัดการรหัสผ่าน Google';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: พวงกุญแจ iCloud';

  @override
  String get whatHappensIfEmailChanged => 'จะเกิดอะไรขึ้นหากอีเมล์บัญชี Deriv ของฉันเปลี่ยนไป?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'ไม่มีปัญหา! Passkey ของคุณยังใช้งานได้อยู่';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'ลงชื่อเข้าใช้ Deriv ด้วย Passkey ที่มีอยู่ของคุณ';

  @override
  String get tips => 'เคล็ดลับ';

  @override
  String get beforeUsingPasskeys => 'ก่อนที่จะใช้ Passkey';

  @override
  String get enableScreenLock => 'เปิดใช้งานการล็อคหน้าจอบนอุปกรณ์ของคุณ';

  @override
  String get signInGoogleOrIcloud => 'ลงชื่อเข้าใช้บัญชี Google หรือ iCloud ของคุณ';

  @override
  String get enableBluetooth => 'เปิดใช้งานบลูทูธ';

  @override
  String get noPasskeyFound => 'ไม่พบ Passkey!';

  @override
  String get noPasskeyFoundDescription => 'กรุณาสร้าง Passkey เพื่อใช้ฟีเจอร์นี้';

  @override
  String get maybeLater => 'ไว้ทีหลัง';

  @override
  String get effortlessLoginWithPasskeys => 'เข้าสู่ระบบได้อย่างง่ายดายด้วย Passkey';

  @override
  String get learnMoreAboutPasskeys => 'เรียนรู้เพิ่มเติมเกี่ยวกับ Passkey';

  @override
  String get noNeedToRememberPassword => 'ไม่จำเป็นต้องจดจำรหัสผ่าน';

  @override
  String get useYourBiometrics => 'เพิ่มความปลอดภัยด้วยไบโอเมตริกซ์หรือการล็อคหน้าจอ';

  @override
  String get syncAcrossDevices => 'ซิงค์ได้ระหว่างอุปกรณ์ต่างๆ';

  @override
  String get createPasskey => 'สร้าง Passkey';

  @override
  String get unsupportedPlatform => 'แพลตฟอร์มที่ไม่รองรับ';

  @override
  String get storedOn => 'เก็บไว้ใน';

  @override
  String get lastUsed => 'ใช้ครั้งล่าสุด';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get revoke => 'เพิกถอน';

  @override
  String get continueTradingButtonText => 'ดำเนินการเทรดต่อ';

  @override
  String get addMorePasskeysButtonText => 'เพิ่มจำนวน Passkey';

  @override
  String get unableToSetupPasskey => 'ไม่สามารถตั้งค่า Passkey ได้';

  @override
  String get unableToSetupPasskeyDescription => 'เราพบปัญหาขณะตั้งค่า Passkey ของคุณ กระบวนการอาจถูกขัดจังหวะหรือเซสชั่นหมดเวลา โปรดลองอีกครั้ง';

  @override
  String get passkeysOffErrorTitle => 'บริการ Passkey ไม่พร้อมใช้งาน';

  @override
  String get never => 'ไม่เคย';

  @override
  String get unable_to_process_your_request => 'ไม่สามารถประมวลผลคำขอของคุณได้';

  @override
  String get unable_to_process_your_request_description => 'เรากำลังประสบปัญหาชั่วคราวในการประมวลผลคำขอของคุณ โปรดลองอีกครั้งในภายหลัง';
}
