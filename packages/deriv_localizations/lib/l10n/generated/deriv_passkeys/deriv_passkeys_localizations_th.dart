import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class DerivPasskeysLocalizationsTh extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'สำเร็จแล้ว!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'ตอนนี้บัญชีของคุณได้รับการรักษาความปลอดภัยด้วยข้อมูลไบโอเมตริกซ์ (Biometrics) โดยสามารถจัดการข้อมูลไบโอเมตริกซ์นี้ได้ผ่านการตั้งค่าบัญชี $platformName ของคุณ';
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
  String get enhanceSecurity => 'ใช้รอยนิ้วมือ การจดจำใบหน้า หรือข้อมูลไบโอเมตริกซ์อื่นๆ เพื่อเข้าสู่ระบบได้อย่างง่ายดายและปลอดภัย';

  @override
  String get here => 'ที่นี่';

  @override
  String get effortlessLogin => 'เข้าสู่ระบบได้อย่างง่ายดายด้วยข้อมูลไบโอเมตริกซ์';

  @override
  String get whatArePasskeys => 'ข้อมูลไบโอเมตริกซ์ (Biometrics) คืออะไร?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'ทางเลือกที่ปลอดภัยนอกเหนือไปจากรหัสผ่าน';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'ปลดล็อคบัญชีของคุณโดยใช้ลายนิ้วมือ การจดจำใบหน้า หรือหมายเลข PIN ของอุปกรณ์';

  @override
  String get whyPasskeys => 'ทำไมต้องใช้ข้อมูลไบโอเมตริกซ์ (Biometrics)?';

  @override
  String get whyPasskeysDescription1 => 'ช่วยป้องกันการเข้าถึงโดยไม่ได้รับอนุญาต';

  @override
  String get whyPasskeysDescription2 => 'ช่วยป้องกันการโจมตีแบบฟิชชิ่ง';

  @override
  String get howToCreatePasskey => 'วิธีเปิดใช้งานข้อมูลไบโอเมตริกซ์นั้น ทำอย่างไร?';

  @override
  String get howToCreatePasskeyDescription1 => 'ไปที่ \'การตั้งค่าบัญชี\' บน Deriv';

  @override
  String get howToCreatePasskeyDescription2 => 'แตะ \'Biometrics\' เพื่อสร้างข้อมูลไบโอเมตริกซ์ของคุณ';

  @override
  String get p2pHowToCreatePasskey => 'วิธีเปิดใช้งานข้อมูลไบโอเมตริกซ์นั้น ทำอย่างไร?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'ไปที่ \'โปรไฟล์\' ในแอป Deriv P2P ของคุณ';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'แตะ \'Biometrics\' เพื่อสร้างข้อมูลไบโอเมตริกซ์ของคุณ';

  @override
  String get whereArePasskeysSaved => 'ข้อมูลไบโอเมตริกซ์จะถูกบันทึกไว้ที่ไหน?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: ตัวจัดการรหัสผ่าน Google';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: พวงกุญแจ iCloud';

  @override
  String get whatHappensIfEmailChanged => 'หากฉันเปลี่ยนอีเมล์บัญชี Deriv ของฉัน แล้วจะเกิดอะไรขึ้น?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'ไม่มีปัญหา! ข้อมูลไบโอเมตริกซ์ของคุณยังใช้งานได้อยู่';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'ลงชื่อเข้าใช้ Deriv ด้วยข้อมูลไบโอเมตริกซ์ที่มีอยู่ของคุณ';

  @override
  String get tips => 'เคล็ดลับ';

  @override
  String get beforeUsingPasskeys => 'ก่อนที่จะใช้ข้อมูลไบโอเมตริกซ์';

  @override
  String get enableScreenLock => 'เปิดใช้งานการล็อคหน้าจอบนอุปกรณ์ของคุณ';

  @override
  String get signInGoogleOrIcloud => 'ลงชื่อเข้าใช้บัญชี Google หรือ iCloud ของคุณ';

  @override
  String get enableBluetooth => 'เปิดใช้งานบลูทูธ';

  @override
  String get noPasskeyFound => 'ไม่พบข้อมูลไบโอเมตริกซ์!';

  @override
  String get noPasskeyFoundDescription => 'กรุณาสร้างข้อมูลไบโอเมตริกซ์เพื่อใช้ฟีเจอร์นี้';

  @override
  String get maybeLater => 'ไว้ทีหลัง';

  @override
  String get effortlessLoginWithPasskeys => 'เข้าสู่ระบบได้อย่างง่ายดายด้วยข้อมูลไบโอเมตริกซ์';

  @override
  String get learnMoreAboutPasskeys => 'เรียนรู้เพิ่มเติมเกี่ยวกับข้อมูลไบโอเมตริกซ์';

  @override
  String get noNeedToRememberPassword => 'ไม่จำเป็นต้องจดจำรหัสผ่าน';

  @override
  String get useYourBiometrics => 'เพิ่มความปลอดภัยด้วยไบโอเมตริกซ์หรือการล็อคหน้าจอ';

  @override
  String get syncAcrossDevices => 'ซิงค์ได้ระหว่างอุปกรณ์ต่างๆ';

  @override
  String get createPasskey => 'เปิดใช้งานข้อมูลไบโอเมตริกซ์';

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
  String get continueTradingButtonText => 'เทรดตอนนี้';

  @override
  String get addMorePasskeysButtonText => 'เพิ่มจำนวนข้อมูลไบโอเมตริกซ์';

  @override
  String get unableToSetupPasskey => 'ไม่สามารถตั้งค่าข้อมูลไบโอเมตริกซ์ได้';

  @override
  String get unableToSetupPasskeyDescription => 'เราพบปัญหาขณะตั้งค่าข้อมูลไบโอเมตริกซ์ของคุณ กระบวนการอาจถูกขัดจังหวะหรือเซสชั่นหมดเวลา โปรดลองอีกครั้ง';

  @override
  String get passkeysOffErrorTitle => 'บริการข้อมูลไบโอเมตริกซ์ไม่พร้อมใช้งาน';

  @override
  String get never => 'ไม่เคย';

  @override
  String get unable_to_process_your_request => 'ไม่สามารถประมวลผลคำขอของคุณได้';

  @override
  String get unable_to_process_your_request_description => 'เรากำลังประสบปัญหาชั่วคราวในการประมวลผลคำขอของคุณ โปรดลองอีกครั้งในภายหลัง';
}
