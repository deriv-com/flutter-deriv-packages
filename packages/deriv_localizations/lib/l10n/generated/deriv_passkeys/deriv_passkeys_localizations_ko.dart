import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class DerivPasskeysLocalizationsKo extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => '성공!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return '이제 여러분의 계정은 passkey로 보호됩니다. $platformName 계정 설정을 통해 passkey를 관리하세요.';
  }

  @override
  String get continueButtonText => '계속';

  @override
  String get unexpectedError => '예상하지 못한 오류가 발생했습니다!';

  @override
  String get unexpectedErrorDescription => '나중에 다시 시도해 주시기 바랍니다.';

  @override
  String get ok => '확인';

  @override
  String get experienceSaferLogins => '로그인이 더 안전합니다';

  @override
  String get enhanceSecurity => '탭 한 번으로 보안을 강화할 수 있습니다.';

  @override
  String get here => '여기';

  @override
  String get effortlessLogin => 'Passkeys로 간편한 로그인';

  @override
  String get whatArePasskeys => 'Passkeys란 무엇인가요?';

  @override
  String get whatArePasskeysDescriptionPoint1 => '비밀번호를 대체할 수 있는 안전한 비밀번호.';

  @override
  String get whatArePasskeysDescriptionPoint2 => '생체 인식, 얼굴 스캔 또는 PIN을 사용하여 휴대폰처럼 계정을 잠금해제하세요.';

  @override
  String get whyPasskeys => 'Passkeys를 사용하는 이유는 무엇인가요?';

  @override
  String get whyPasskeysDescription1 => '추가 보안 계층.';

  @override
  String get whyPasskeysDescription2 => '무단 접근 및 피싱으로부터 보호합니다.';

  @override
  String get howToCreatePasskey => 'Passkey는 어떻게 생성할 수 있나요?';

  @override
  String get howToCreatePasskeyDescription1 => 'Deriv의 \'계정 설정\'으로 이동하세요.';

  @override
  String get howToCreatePasskeyDescription2 => '기기당 하나의 Passkey를 만들 수 있습니다.';

  @override
  String get p2pHowToCreatePasskey => '암호 키는 어떻게 만드나요?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Deriv P2P 앱에서 \'프로필\'로 이동합니다.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => '\'암호\'를 눌러 암호를 생성합니다.';

  @override
  String get whereArePasskeysSaved => 'Passkeys는 어디에 저장되나요?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google 비밀번호 관리자.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud 키체인.';

  @override
  String get whatHappensIfEmailChanged => '제 Deriv 계정 이메일이 변경되면 어떻게 되나요?';

  @override
  String get whatHappensIfEmailChangedDescription1 => '괜찮습니다! 귀하의 Passkey를 그대로 사용하실 수 있습니다.';

  @override
  String get whatHappensIfEmailChangedDescription2 => '기존 Passkey를 사용하여 Deriv에 로그인하세요.';

  @override
  String get tips => '팁';

  @override
  String get beforeUsingPasskeys => 'Passkeys를 사용하기 전에';

  @override
  String get enableScreenLock => '기기에서 화면 잠금을 활성화하세요.';

  @override
  String get signInGoogleOrIcloud => 'Google 또는 iCloud 계정으로 로그인하세요.';

  @override
  String get enableBluetooth => '블루투스를 활성화하세요.';

  @override
  String get noPasskeyFound => 'Passkey를 찾을 수 없습니다!';

  @override
  String get noPasskeyFoundDescription => '이 기능을 사용하기 위해서는 passkey를 생성하시기 바랍니다.';

  @override
  String get maybeLater => '다음으로 미루겠습니다';

  @override
  String get effortlessLoginWithPasskeys => 'Passkeys를 통한 간단한 로그인';

  @override
  String get learnMoreAboutPasskeys => 'Passkeys에 대해 더 알아보기';

  @override
  String get noNeedToRememberPassword => '비밀번호를 기억하지 않아도 됩니다';

  @override
  String get useYourBiometrics => '생체인식 또는 화면 잠금을 통한 보안 강화';

  @override
  String get syncAcrossDevices => '기기 간 동기화';

  @override
  String get createPasskey => 'Passkey 생성';

  @override
  String get unsupportedPlatform => '지원되지 않는 플랫폼입니다';

  @override
  String get storedOn => '저장 위치';

  @override
  String get lastUsed => '최근 사용';

  @override
  String get rename => '이름 변경';

  @override
  String get revoke => '철회';

  @override
  String get continueTradingButtonText => '계속 거래하기';

  @override
  String get addMorePasskeysButtonText => '더 많은 passkeys';

  @override
  String get unableToSetupPasskey => 'Passkey를 설정할 수 없습니다';

  @override
  String get unableToSetupPasskeyDescription => 'Passkey를 설정하는 동안 문제가 발생했습니다. 프로세스가 중단되었거나 세션 시간이 초과되었을 수 있습니다. 다시 시도해 주시기 바랍니다.';

  @override
  String get passkeysOffErrorTitle => 'Passkeys 서비스를 이용할 수 없습니다';

  @override
  String get never => '절대 안 돼';

  @override
  String get unable_to_process_your_request => '요청을 처리할 수 없습니다';

  @override
  String get unable_to_process_your_request_description => '요청을 처리하는 동안 일시적인 문제가 발생했습니다.나중에 다시 시도하세요.';
}
