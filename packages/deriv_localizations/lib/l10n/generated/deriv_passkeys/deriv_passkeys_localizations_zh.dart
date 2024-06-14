import 'deriv_passkeys_localizations.dart';

/// The translations for Chinese (`zh`).
class DerivPasskeysLocalizationsZh extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => '成功！';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return '帳戶現在已使用金鑰保護。請透過 <0/>$platformName 帳戶設定<0/>管理金鑰。';
  }

  @override
  String get continueButtonText => '繼續';

  @override
  String get unexpectedError => '發生不可預測錯誤！';

  @override
  String get unexpectedErrorDescription => '請稍後重試。';

  @override
  String get ok => '確定';

  @override
  String get experienceSaferLogins => '體驗更安全的登入';

  @override
  String get enhanceSecurity => '只需輕按一下即可增強安全性。';

  @override
  String get here => '這裡';

  @override
  String get effortlessLogin => '使用金鑰輕鬆登入';

  @override
  String get whatArePasskeys => '什麼是金鑰？';

  @override
  String get whatArePasskeysDescriptionPoint1 => '密碼之外的安全替代品。';

  @override
  String get whatArePasskeysDescriptionPoint2 => '使用生物特徵、臉部掃描或 PIN 像手機一樣解鎖帳戶。';

  @override
  String get whyPasskeys => '為什麼要使用金鑰？';

  @override
  String get whyPasskeysDescription1 => '額外的安全層。';

  @override
  String get whyPasskeysDescription2 => '防止未經授權的存取和網絡釣魚。';

  @override
  String get howToCreatePasskey => '如何建立金鑰？';

  @override
  String get howToCreatePasskeyDescription1 => '轉到 Deriv 的‘帳戶設定‘。';

  @override
  String get howToCreatePasskeyDescription2 => '可以為每個裝置建立一個金鑰。';

  @override
  String get p2pHowToCreatePasskey => 'How to create passkey?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Go to ‘Profile‘ in your Deriv P2P app.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Tap ‘Passkeys‘ to create your passkey.';

  @override
  String get whereArePasskeysSaved => '金鑰儲存在哪裡？';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google 密碼管理器。';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS：iCloud 鑰匙圈。';

  @override
  String get whatHappensIfEmailChanged => '如果 Deriv 帳戶電子郵件更改，會怎麼樣？';

  @override
  String get whatHappensIfEmailChangedDescription1 => '沒問題！金鑰仍然有效。';

  @override
  String get whatHappensIfEmailChangedDescription2 => '使用現有的金鑰登入 Deriv。';

  @override
  String get tips => '提示';

  @override
  String get beforeUsingPasskeys => '使用金鑰之前';

  @override
  String get enableScreenLock => '啟用裝置螢幕鎖定。';

  @override
  String get signInGoogleOrIcloud => '登入 Google 或 iCloud 帳戶。';

  @override
  String get enableBluetooth => '啟用藍牙。';

  @override
  String get noPasskeyFound => '找不到金鑰！';

  @override
  String get noPasskeyFoundDescription => '請建立金鑰以使用此功能。';

  @override
  String get maybeLater => '以後再說';

  @override
  String get effortlessLoginWithPasskeys => '使用金鑰輕鬆登入';

  @override
  String get learnMoreAboutPasskeys => '進一步了解金鑰';

  @override
  String get noNeedToRememberPassword => '無需記住密碼';

  @override
  String get useYourBiometrics => '通過生物特徵或螢幕鎖定增強安全性';

  @override
  String get syncAcrossDevices => '跨裝置同步';

  @override
  String get createPasskey => '建立金鑰';

  @override
  String get unsupportedPlatform => '不支援的平台';

  @override
  String get storedOn => '儲存在';

  @override
  String get lastUsed => '上一次使用';

  @override
  String get rename => '重命名';

  @override
  String get revoke => '撤銷';

  @override
  String get continueTradingButtonText => '繼續交易';

  @override
  String get addMorePasskeysButtonText => '新增更多金鑰';

  @override
  String get unableToSetupPasskey => '無法設定金鑰';

  @override
  String get unableToSetupPasskeyDescription => '設定金鑰時遇到問題。程序可能已中斷，或工作階段逾時。請再試一次。';

  @override
  String get passkeysOffErrorTitle => '金鑰服務無法使用';

  @override
  String get never => '從未';

  @override
  String get unable_to_process_your_request => '無法處理請求';

  @override
  String get unable_to_process_your_request_description => '處理請求時遇到臨時問題。請稍後再試。';
}
