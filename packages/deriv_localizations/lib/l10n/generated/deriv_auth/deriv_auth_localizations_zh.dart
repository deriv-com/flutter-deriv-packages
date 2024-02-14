import 'deriv_auth_localizations.dart';

/// The translations for Chinese (`zh`).
class DerivAuthLocalizationsZh extends DerivAuthLocalizations {
  DerivAuthLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get labelNotAvailable => '不可用';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app isn\'t available in your country';
  }

  @override
  String get actionOk => '確定';

  @override
  String get warnNotAvailableCountries => '如有任何疑问，请通过以下方式联系我们 ';

  @override
  String get labelLiveChat => '实时聊天';

  @override
  String get actionGetAFreeAccount => '获取免费账号';

  @override
  String get actionLogin => '登录';

  @override
  String get labelTwoFactorAuth => '双因素身份验证';

  @override
  String get informEnterTwoFactorAuthCode => '在手机输入身份验证器应用程序的 6 位数代码。';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA 代码';

  @override
  String get actionProceed => '执行';

  @override
  String get labelLogIn => '登录';

  @override
  String get informLoginOptions => '或通过以下登录';

  @override
  String get labelEmail => '电子邮件';

  @override
  String get labelPassword => '密码';

  @override
  String get actionForgotPassword => '忘记密码?';

  @override
  String get labelDontHaveAnAccountYet => '还没有账户？';

  @override
  String get actionCreateANewAccount => '开立新账户';

  @override
  String get informInvalidEmailFormat => '输入有效的电子邮件地址';

  @override
  String get warnPasswordLength => '必须输入 8-25 个字符。';

  @override
  String get labelResetPassword => 'Reset password';

  @override
  String get labelChooseNewPass => '选新密码';

  @override
  String get labelCreatePass => 'Password';

  @override
  String get informYourPassHasBeenReset => '密码已重置';

  @override
  String get informRedirectLogin => '需要使用新密码登录。请稍等，正在重定向。';

  @override
  String get actionResetPass => '重置密码';

  @override
  String get informInvalidPasswordFormat => '请输入有效的密码格式';

  @override
  String get labelCheckEmail => '查看您的電子郵件';

  @override
  String informSendResetPasswordEmail(String email) {
    return '已发送邮件至 $email，内含重置密码的链接。';
  }

  @override
  String get informResetPassByEmail => '会传送内含重设密码的说明的电子邮件。';

  @override
  String get labelSelectCountry => '您的居住地是哪裡？';

  @override
  String get labelChooseCountry => '选择国家';

  @override
  String get warnCountryNotAvailable => '对不起，您的所在国不可用 Deriv。';

  @override
  String get actionNext => '下一步';

  @override
  String get labelEmailIssueHeader => '如果数分钟内没有收到我们发送的电子邮件，可能是因为发生了几种情况而引起的：';

  @override
  String get labelEmailIssueSpam => '郵件在您的垃圾郵箱（有時一些郵件會誤送到那兒）。';

  @override
  String get labelEmailIssueWrongEmail => '您不小心给了我们另一个电子邮件地址（通常非您本意，而是属于工作或个人性质的）。';

  @override
  String get labelEmailIssueTypo => '您输入的电子邮件地址拼写有误（有时这是难免的）。';

  @override
  String get labelEmailIssueFirewall => '无法发送电子邮件到此地址（通常是因为安装了防火墙或筛选器）。';

  @override
  String get actionReenterEmail => '重新输入电子邮件并重试';

  @override
  String get labelKeepPassword => '用密碼保障您的帳戶安全';

  @override
  String get labelCreatePassword => '创建密码';

  @override
  String get actionStartTrading => '开始交易';

  @override
  String get actionPrevious => '之前';

  @override
  String get labelSignUp => '注册';

  @override
  String get labelOrSignUpWith => '或通过以下注册';

  @override
  String get labelReferralInfoTitle => '联盟推荐码';

  @override
  String get infoReferralInfoDescription => 'Deriv 联盟会员提供的字母数字代码，仅用于电子邮件注册。';

  @override
  String get labelGotReferralCode => '有推荐码吗？';

  @override
  String get labelHaveAccount => '已经有账户？';

  @override
  String get actionCreateAccount => '开立免费演示账户';

  @override
  String get informInvalidReferralCode => '输入的推荐码无效。请检查并重试。';

  @override
  String get labelVerifyYourEmail => '电子邮件验证';

  @override
  String get labelThanksEmail => '谢谢您验证了电子邮件';

  @override
  String get informLetsContinue => '让我们继续。';

  @override
  String get actionContinue => '继续';

  @override
  String get labelSearchCountry => '搜索国家';

  @override
  String informVerificationEmailSent(String email) {
    return '已发送邮件至 $email，内含激活账户的链接。';
  }

  @override
  String get actionEmailNotReceived => '没收到邮件？';

  @override
  String get informPasswordPolicy => '密码必须有：';

  @override
  String get informPasswordPolicyLength => '8-25 个字符';

  @override
  String get informPasswordPolicyLowerAndUpper => '大写和小写字母';

  @override
  String get informPasswordPolicyNumber => '至少一个数字';

  @override
  String get warnPasswordContainsSymbol => '使用符号加强密码安全。';

  @override
  String get labelReferralCode => '推荐码';

  @override
  String get actionTryAgain => '重試';

  @override
  String get informInvalid2FACode => '输入的代码无效。请检查并重试。';

  @override
  String get informFailedAuthentication => '电子邮件或密码可能不正确。是否用社交账户注册？请检查并重试。';

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
  String get informSelfClosed => '帳戶已關閉.';

  @override
  String get informUnexpectedError => '發生不可預測錯誤.';

  @override
  String get informUnsupportedCountry => 'Your country is not supported.';

  @override
  String get informExpiredAccount => 'Your account is expired';

  @override
  String get labelCountryConsentBrazil => '本人特此确认，在 Deriv 开立账户以交易由巴西境外推出和提供的场外交易产品的请求是由本人提出的。本人完全理解 Deriv 不受 CVM 监管，且通过与 Deriv 接触，本人打算与一家外国公司建立关系。';

  @override
  String get informConnectionError => 'Connection error. Please try again later.';

  @override
  String get informSwitchAccountError => 'Switch account error. Please try again later.';

  @override
  String get labelDeveloper => '开发员';

  @override
  String get labelEndpoint => '终结点';

  @override
  String get semanticEndpoint => '终结点';

  @override
  String get warnInvalidEndpoint => '无效的终结点';

  @override
  String get labelApplicationID => '应用程序 ID';

  @override
  String get semanticApplicationID => '应用程序 ID';

  @override
  String get warnInvalidApplicationID => '无效的应用程序 ID';
}
