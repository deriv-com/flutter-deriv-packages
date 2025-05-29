import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class DerivPasskeysLocalizationsZh extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => '成功！';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return '帳戶現在已使用 passkey 保護。請透過 <0/>$platformName 帳戶設定<0/>管理 passkey 。';
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
  String get effortlessLogin => '使用 passkey 輕鬆登入';

  @override
  String get whatArePasskeys => '什麼是 passkey ？';

  @override
  String get whatArePasskeysDescriptionPoint1 => '密碼之外的安全替代品。';

  @override
  String get whatArePasskeysDescriptionPoint2 => '使用生物特徵、臉部掃描或 PIN 像手機一樣解鎖帳戶。';

  @override
  String get whyPasskeys => '為什麼要使用 passkey ？';

  @override
  String get whyPasskeysDescription1 => '額外的安全層。';

  @override
  String get whyPasskeysDescription2 => '防止未經授權的存取和網絡釣魚。';

  @override
  String get howToCreatePasskey => '如何建立 passkey ？';

  @override
  String get howToCreatePasskeyDescription1 => '轉到 Deriv 的‘帳戶設定‘。';

  @override
  String get howToCreatePasskeyDescription2 => '可以為每個裝置建立一個 passkey 。';

  @override
  String get p2pHowToCreatePasskey => '如何建立 passkey ？';

  @override
  String get p2pHowToCreatePasskeyDescription1 => '在 Deriv P2P 應用程式中轉到‘個人資料‘。';

  @override
  String get p2pHowToCreatePasskeyDescription2 => '點選‘密鑰‘以建立密鑰。';

  @override
  String get whereArePasskeysSaved => ' passkey 儲存在哪裡？';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google 密碼管理器。';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS：iCloud 鑰匙圈。';

  @override
  String get whatHappensIfEmailChanged => '如果 Deriv 帳戶電子郵件更改，會怎麼樣？';

  @override
  String get whatHappensIfEmailChangedDescription1 => '沒問題！ passkey 仍然有效。';

  @override
  String get whatHappensIfEmailChangedDescription2 => '使用現有的 passkey 登入 Deriv。';

  @override
  String get tips => '提示';

  @override
  String get beforeUsingPasskeys => '使用 passkey 之前';

  @override
  String get enableScreenLock => '啟用裝置螢幕鎖定。';

  @override
  String get signInGoogleOrIcloud => '登入 Google 或 iCloud 帳戶。';

  @override
  String get enableBluetooth => '啟用藍牙。';

  @override
  String get noPasskeyFound => '找不到 passkey ！';

  @override
  String get noPasskeyFoundDescription => '請建立 passkey 以使用此功能。';

  @override
  String get maybeLater => '以後再說';

  @override
  String get effortlessLoginWithPasskeys => '使用 passkey 輕鬆登入';

  @override
  String get learnMoreAboutPasskeys => '進一步了解 passkey ';

  @override
  String get noNeedToRememberPassword => '無需記住密碼';

  @override
  String get useYourBiometrics => '通過生物特徵或螢幕鎖定增強安全性';

  @override
  String get syncAcrossDevices => '跨裝置同步';

  @override
  String get createPasskey => '建立 passkey ';

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
  String get addMorePasskeysButtonText => '新增更多 passkey ';

  @override
  String get unableToSetupPasskey => '無法設定 passkey ';

  @override
  String get unableToSetupPasskeyDescription => '設定 passkey 時遇到問題。程序可能已中斷，或工作階段逾時。請再試一次。';

  @override
  String get passkeysOffErrorTitle => ' passkey 服務無法使用';

  @override
  String get never => '從未';

  @override
  String get unable_to_process_your_request => '無法處理請求';

  @override
  String get unable_to_process_your_request_description => '處理請求時遇到臨時問題。請稍後再試。';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class DerivPasskeysLocalizationsZhCn extends DerivPasskeysLocalizationsZh {
  DerivPasskeysLocalizationsZhCn(): super('zh_CN');

  @override
  String get passkeyCreatedSuccessTitle => '成功！';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return '账户现已使用生物识别技术保护。通过 $platformName 账户设置管理生物识别数据。';
  }

  @override
  String get continueButtonText => '继续';

  @override
  String get unexpectedError => '发生不可预测的错误！';

  @override
  String get unexpectedErrorDescription => '请稍后重试。';

  @override
  String get ok => '确定';

  @override
  String get experienceSaferLogins => '保障安全登录的关键';

  @override
  String get enhanceSecurity => '使用指纹、面部识别或其他生物识别数据轻松安全地登录。';

  @override
  String get here => '这里';

  @override
  String get effortlessLogin => '使用生物识别轻松登录';

  @override
  String get whatArePasskeys => '什么是生物识别？';

  @override
  String get whatArePasskeysDescriptionPoint1 => '密码的安全替代方案。';

  @override
  String get whatArePasskeysDescriptionPoint2 => '使用指纹、面部识别或设备 PIN 解锁账户。';

  @override
  String get whyPasskeys => '为什么使用生物识别？';

  @override
  String get whyPasskeysDescription1 => '防范未经授权的访问。';

  @override
  String get whyPasskeysDescription2 => '防范网络钓鱼攻击。';

  @override
  String get howToCreatePasskey => '如何启用生物识别？';

  @override
  String get howToCreatePasskeyDescription1 => '前往 Deriv 的‘账户设置’。';

  @override
  String get howToCreatePasskeyDescription2 => '点击‘Biometrics’以创建生物识别信息。';

  @override
  String get p2pHowToCreatePasskey => '如何启用生物识别？';

  @override
  String get p2pHowToCreatePasskeyDescription1 => '前往 Deriv P2P 应用程序中的 ‘个人资料‘。';

  @override
  String get p2pHowToCreatePasskeyDescription2 => '点击‘Biometrics’以创建生物识别信息。';

  @override
  String get whereArePasskeysSaved => '生物识别数据保存在何处？';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google 密码管理器。';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS：iCloud 钥匙串。';

  @override
  String get whatHappensIfEmailChanged => '如果 Deriv 账户电子邮件地址更改会怎样？';

  @override
  String get whatHappensIfEmailChangedDescription1 => '没问题！生物识别仍然有效。';

  @override
  String get whatHappensIfEmailChangedDescription2 => '可以使用现有的生物识别信息登录。';

  @override
  String get tips => '提示';

  @override
  String get beforeUsingPasskeys => '使用生物识别之前';

  @override
  String get enableScreenLock => '在设备启用屏幕锁定。';

  @override
  String get signInGoogleOrIcloud => '登录到 Google 或 iCloud 账户。';

  @override
  String get enableBluetooth => '启用蓝牙。';

  @override
  String get noPasskeyFound => '找不到生物识别信息！';

  @override
  String get noPasskeyFoundDescription => '请创建生物识别以使用此功能。';

  @override
  String get maybeLater => '以后再说';

  @override
  String get effortlessLoginWithPasskeys => '使用生物识别轻松登录';

  @override
  String get learnMoreAboutPasskeys => '了解有关生物识别的更多信息';

  @override
  String get noNeedToRememberPassword => '无需记住密码';

  @override
  String get useYourBiometrics => '通过生物识别或屏幕锁增强安全性';

  @override
  String get syncAcrossDevices => '跨设备同步';

  @override
  String get createPasskey => '启用生物识别';

  @override
  String get unsupportedPlatform => '不支持的平台';

  @override
  String get storedOn => '存储在';

  @override
  String get lastUsed => '上一次使用';

  @override
  String get rename => '重命名';

  @override
  String get revoke => '撤销';

  @override
  String get continueTradingButtonText => '立刻交易';

  @override
  String get addMorePasskeysButtonText => '添加新生物识别';

  @override
  String get unableToSetupPasskey => '无法设置生物识别';

  @override
  String get unableToSetupPasskeyDescription => '设置生物识别时遇到了问题。该过程可能已中断，或者会话超时。请再试一次。';

  @override
  String get passkeysOffErrorTitle => '生物识别服务不可用';

  @override
  String get never => '从未';

  @override
  String get unable_to_process_your_request => '无法处理请求';

  @override
  String get unable_to_process_your_request_description => '处理请求时遇到了临时问题。请稍后再试。';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class DerivPasskeysLocalizationsZhTw extends DerivPasskeysLocalizationsZh {
  DerivPasskeysLocalizationsZhTw(): super('zh_TW');

  @override
  String get passkeyCreatedSuccessTitle => '成功！';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return '帳戶現在已使用生物識別保護。請透過 $platformName 帳戶設定管理生物識別資料。';
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
  String get experienceSaferLogins => '更安全登入的關鍵';

  @override
  String get enhanceSecurity => '使用指紋、臉部辨識或其他生物識別資料輕鬆且安全地登入。';

  @override
  String get here => '這裡';

  @override
  String get effortlessLogin => '使用生物識別輕鬆登入';

  @override
  String get whatArePasskeys => '什麼是生物識別？';

  @override
  String get whatArePasskeysDescriptionPoint1 => '密碼之外的安全替代品。';

  @override
  String get whatArePasskeysDescriptionPoint2 => '使用指紋、臉部辨識或裝置 PIN 解鎖帳戶。';

  @override
  String get whyPasskeys => '為什麼要使用生物識別？';

  @override
  String get whyPasskeysDescription1 => '防止未經授權的存取。';

  @override
  String get whyPasskeysDescription2 => '防止網絡釣魚侵犯。';

  @override
  String get howToCreatePasskey => '如何啟用生物識別？';

  @override
  String get howToCreatePasskeyDescription1 => '轉到 Deriv 的‘帳戶設定‘。';

  @override
  String get howToCreatePasskeyDescription2 => '點選‘Biometrics’以建立生物辨識資訊。';

  @override
  String get p2pHowToCreatePasskey => '如何啟用生物識別？';

  @override
  String get p2pHowToCreatePasskeyDescription1 => '前前往 Deriv P2P 應用程式中的 ‘個人檔案‘。';

  @override
  String get p2pHowToCreatePasskeyDescription2 => '點選‘Biometrics’以建立生物辨識資訊。';

  @override
  String get whereArePasskeysSaved => '生物識別資料儲存在哪裡？';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google 密碼管理器。';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS：iCloud 鑰匙圈。';

  @override
  String get whatHappensIfEmailChanged => '如果變更 Deriv 帳戶電子郵件，會怎麼樣？';

  @override
  String get whatHappensIfEmailChangedDescription1 => '沒問題！生物識別資訊仍然有效。';

  @override
  String get whatHappensIfEmailChangedDescription2 => '可以使用現有的生物辨識資訊登入。';

  @override
  String get tips => '提示';

  @override
  String get beforeUsingPasskeys => '使用生物識別之前';

  @override
  String get enableScreenLock => '啟用裝置螢幕鎖定。';

  @override
  String get signInGoogleOrIcloud => '登入 Google 或 iCloud 帳戶。';

  @override
  String get enableBluetooth => '啟用藍牙。';

  @override
  String get noPasskeyFound => '找不到生物識別資訊！';

  @override
  String get noPasskeyFoundDescription => '請建立生物識別以使用此功能。';

  @override
  String get maybeLater => '以後再說';

  @override
  String get effortlessLoginWithPasskeys => '使用生物識別輕鬆登入';

  @override
  String get learnMoreAboutPasskeys => '了解生物識別的詳細資訊';

  @override
  String get noNeedToRememberPassword => '無需記住密碼';

  @override
  String get useYourBiometrics => '通過生物特徵或螢幕鎖定增強安全性';

  @override
  String get syncAcrossDevices => '跨裝置同步';

  @override
  String get createPasskey => '啟用生物識別';

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
  String get continueTradingButtonText => '立即交易';

  @override
  String get addMorePasskeysButtonText => '新增生物識別';

  @override
  String get unableToSetupPasskey => '無法設定生物識別';

  @override
  String get unableToSetupPasskeyDescription => '設定生物識別時遇到問題。該過程可能已中斷，或工作階段逾時。請再試一次。';

  @override
  String get passkeysOffErrorTitle => '生物識別服務無法使用';

  @override
  String get never => '從未';

  @override
  String get unable_to_process_your_request => '無法處理要求';

  @override
  String get unable_to_process_your_request_description => '處理要求時遇到臨時問題。請稍後再試。';
}
