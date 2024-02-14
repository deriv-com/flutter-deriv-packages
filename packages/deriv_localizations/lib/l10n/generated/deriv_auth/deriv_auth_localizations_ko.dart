import 'deriv_auth_localizations.dart';

/// The translations for Korean (`ko`).
class DerivAuthLocalizationsKo extends DerivAuthLocalizations {
  DerivAuthLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get labelNotAvailable => '사용할 수 없습니다';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app isn\'t available in your country';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => '궁금하신 점이 있으면 다음의 연락처로 문의해 주세요 ';

  @override
  String get labelLiveChat => '실시간 채팅';

  @override
  String get actionGetAFreeAccount => '무료 계정 개설';

  @override
  String get actionLogin => '로그인';

  @override
  String get labelTwoFactorAuth => '2단계 인증';

  @override
  String get informEnterTwoFactorAuthCode => '휴대폰의 인증 앱에서 6자리 코드를 입력하세요.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA 코드';

  @override
  String get actionProceed => '진행';

  @override
  String get labelLogIn => '로그인';

  @override
  String get informLoginOptions => '또는 다음 계정으로 로그인하세요';

  @override
  String get labelEmail => '이메일';

  @override
  String get labelPassword => '비밀번호';

  @override
  String get actionForgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get labelDontHaveAnAccountYet => '아직 계정이 없는가요?';

  @override
  String get actionCreateANewAccount => '새 계정 생성';

  @override
  String get informInvalidEmailFormat => '유효한 이메일 주소를 입력하세요';

  @override
  String get warnPasswordLength => '8~25자의 문자를 입력해야 합니다.';

  @override
  String get labelResetPassword => 'Reset password';

  @override
  String get labelChooseNewPass => '새 비밀번호를 선택하세요';

  @override
  String get labelCreatePass => 'Password';

  @override
  String get informYourPassHasBeenReset => '비밀번호가 재설정되었습니다';

  @override
  String get informRedirectLogin => '새 비밀번호로 로그인해야 합니다. 잠시만 기다려 주세요, 리디렉션 중입니다.';

  @override
  String get actionResetPass => '비밀번호 재설정';

  @override
  String get informInvalidPasswordFormat => '올바른 형식의 비밀번호를 입력해 주세요';

  @override
  String get labelCheckEmail => '이메일을 확인해 주세요';

  @override
  String informSendResetPasswordEmail(String email) {
    return '비밀번호 재설정을 위한 링크가 포함된 메시지를 $email로 전송했습니다.';
  }

  @override
  String get informResetPassByEmail => '비밀번호 재설정에 대한 지침을 이메일로 전송해 드리겠습니다.';

  @override
  String get labelSelectCountry => '어디에 사시나요?';

  @override
  String get labelChooseCountry => '국가 선택';

  @override
  String get warnCountryNotAvailable => '안타깝게도 귀하의 국가에서는 Deriv를 사용할 수 없습니다.';

  @override
  String get actionNext => '다음';

  @override
  String get labelEmailIssueHeader => '몇 분 내에 이메일이 오지 않는다면 다음과 같은 몇 가지 문제가 발생했을 수 있습니다:';

  @override
  String get labelEmailIssueSpam => '해당 이메일이 스팸 폴더에 있습니다(때로는 이메일이 스팸 폴더로 전송됩니다).';

  @override
  String get labelEmailIssueWrongEmail => '실수로 저희에게 다른 이메일 주소를 알려주셨습니다(일반적으로는 귀하께서 주시려고 의도하신 이메일 주소 대신 회사 및 개인 이메일 주소입니다).';

  @override
  String get labelEmailIssueTypo => '입력하신 이메일 주소에 실수 또는 오타가 있습니다(누구에게나 발생할 수 있습니다).';

  @override
  String get labelEmailIssueFirewall => '이 주소로 이메일을 전송할 수 없습니다(일반적으로는 방화벽 또는 필터링 떄문입니다).';

  @override
  String get actionReenterEmail => '이메일을 다시 입력하고 다시 시도해 주세요';

  @override
  String get labelKeepPassword => '비밀번호로 계정을 안전하게 보호하세요';

  @override
  String get labelCreatePassword => '비밀번호 생성';

  @override
  String get actionStartTrading => '거래 시작';

  @override
  String get actionPrevious => '이전';

  @override
  String get labelSignUp => '가입';

  @override
  String get labelOrSignUpWith => '또는 다음을 통해 가입하세요';

  @override
  String get labelReferralInfoTitle => '제휴 추천 코드';

  @override
  String get infoReferralInfoDescription => 'Deriv 제휴자가 제공하는 영숫자 코드이며 이메일 가입 시에만 사용할 수 있습니다.';

  @override
  String get labelGotReferralCode => '추천 코드가 있나요?';

  @override
  String get labelHaveAccount => '보유하고 계신 계정이 있나요?';

  @override
  String get actionCreateAccount => '무료 데모 계정 생성하기';

  @override
  String get informInvalidReferralCode => '입력하신 추천 코드가 유효하지 않습니다. 확인 후 다시 시도해 주세요.';

  @override
  String get labelVerifyYourEmail => '이메일 인증';

  @override
  String get labelThanksEmail => '이메일을 인증해 주셔서 감사합니다';

  @override
  String get informLetsContinue => '계속 진행하겠습니다.';

  @override
  String get actionContinue => '계속하기';

  @override
  String get labelSearchCountry => '국가 검색';

  @override
  String informVerificationEmailSent(String email) {
    return '계정 활성화를 위한 링크가 포함된 메시지를 $email로 전송했습니다.';
  }

  @override
  String get actionEmailNotReceived => '이메일을 받지 않으셨나요?';

  @override
  String get informPasswordPolicy => '비밀번호에는 다음이 포함되어야 합니다:';

  @override
  String get informPasswordPolicyLength => '8~25자';

  @override
  String get informPasswordPolicyLowerAndUpper => '대문자 및 소문자';

  @override
  String get informPasswordPolicyNumber => '최소 하나 이상의 숫자';

  @override
  String get warnPasswordContainsSymbol => '비밀번호를 강화하기 위해 기호를 사용하세요.';

  @override
  String get labelReferralCode => '추천 코드';

  @override
  String get actionTryAgain => '재시도하기';

  @override
  String get informInvalid2FACode => '입력하신 코드가 유효하지 않습니다. 확인하고 다시 시도해 주세요.';

  @override
  String get informFailedAuthentication => '이메일 또는 비밀번호가 올바르지 않을 수 있습니다. 소셜 계정으로 가입하셨나요? 확인 후 다시 시도해 주세요.';

  @override
  String get informDeactivatedAccount => 'Your account is deactivated.';

  @override
  String get informFailedAuthorization => 'Authorization failed.';

  @override
  String get informInvalidResidence => 'Invalid residence.';

  @override
  String get informInvalidCredentials => 'Invalid credentials.';

  @override
  String get informMissingOtp => 'Missing one-time password.';

  @override
  String get informSelfClosed => '귀하의 계좌는 닫겼습니다.';

  @override
  String get informUnexpectedError => '예상하지 못한 오류가 발생했습니다.';

  @override
  String get informUnsupportedCountry => 'Your country is not supported.';

  @override
  String get informExpiredAccount => 'Your account is expired';

  @override
  String get labelCountryConsentBrazil => '본인은 브라질 이외의 지역에서만 발행 및 제공되는 OTC 상품을 거래하기 위해 Deriv를 통한 계정을 개설하고자 하는 요청이 본인에 의해 시작되었음을 확정합니다. 본인은 Deriv가 CVM의 규제를 받지 않는다는 것을 충분히 이해하고 있으며 Deriv에 접근함으로써 외국 회사와 관계를 구축하고자 합니다.';

  @override
  String get informConnectionError => 'Connection error. Please try again later.';

  @override
  String get informSwitchAccountError => 'Switch account error. Please try again later.';

  @override
  String get labelDeveloper => '개발자';

  @override
  String get labelEndpoint => '엔드포인트';

  @override
  String get semanticEndpoint => '엔드포인트';

  @override
  String get warnInvalidEndpoint => '유효하지 않은 엔드포인트';

  @override
  String get labelApplicationID => '애플리케이션 ID';

  @override
  String get semanticApplicationID => '애플리케이션 ID';

  @override
  String get warnInvalidApplicationID => '유효하지 않은 애플리케이션 ID';
}
