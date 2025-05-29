import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class DerivAuthLocalizationsZh extends DerivAuthLocalizations {
  DerivAuthLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get labelNotAvailable => '不可用';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '您的國家/地區不能使用 $app';
  }

  @override
  String get actionOk => '确定';

  @override
  String get warnNotAvailableCountries => '如果有任何疑問，請通過以下方式與我們聯繫 ';

  @override
  String get labelLiveChat => '即時聊天';

  @override
  String get actionSignUpForFree => '免費註冊';

  @override
  String get actionLogin => '登入';

  @override
  String get labelTwoFactorAuth => '雙因素身份驗證';

  @override
  String get informEnterTwoFactorAuthCode => '在手機的驗證器應用程式中輸入 6 位數代碼。';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA 代碼';

  @override
  String get actionProceed => '執行';

  @override
  String get labelLogIn => '登入';

  @override
  String get informLoginOptions => '或通過以下方式登入';

  @override
  String get labelEmail => '電子郵件';

  @override
  String get labelPassword => '密碼';

  @override
  String get actionForgotPassword => '忘記密碼？';

  @override
  String get labelDontHaveAnAccountYet => '還沒有帳戶？';

  @override
  String get actionCreateANewAccount => '開立新帳戶';

  @override
  String get informInvalidEmailFormat => '請輸入有效的電子郵件地址';

  @override
  String get warnPasswordLength => '必須輸入 6-25 個字元。';

  @override
  String get labelResetPassword => '重設密碼';

  @override
  String get labelChooseNewPass => '選新密碼';

  @override
  String get labelCreatePass => '密碼';

  @override
  String get informYourPassHasBeenReset => '密碼已重設';

  @override
  String get informRedirectLogin => '需要使用新密碼登入。等等，正在重導向。';

  @override
  String get actionResetPass => '重設密碼';

  @override
  String get informInvalidPasswordFormat => '請輸入有效的密碼格式';

  @override
  String get labelCheckEmail => '查看電子郵件';

  @override
  String informSendResetPasswordEmail(String email) {
    return '已傳送郵件至$email ，內含重設密碼的連結。';
  }

  @override
  String get informResetPassByEmail => '將以電子郵件傳送重設密碼的說明。';

  @override
  String get labelSelectCountry => '您的居住地是哪里？';

  @override
  String get labelChooseCountry => '選擇國家';

  @override
  String get warnCountryNotAvailable => '對不起，您的所在國不可用 Deriv。';

  @override
  String get actionNext => '下一頁';

  @override
  String get labelEmailIssueHeader => '如果數分鐘內沒有收到我們傳送的電子郵件，可能是因為發生了幾種情況而引起的:';

  @override
  String get labelEmailIssueSpam => '郵件在您的垃圾郵箱（有時一些郵件會誤送到那兒）。';

  @override
  String get labelEmailIssueWrongEmail => '您不小心給了我們另一個電子郵件地址（通常非您本意，而是屬於工作或個人性質的）。';

  @override
  String get labelEmailIssueTypo => '您輸入的電子郵件地址拼寫有誤（有時這是難免的）。';

  @override
  String get labelEmailIssueFirewall => '電子郵件無法傳送到此地址（通常是因為安裝了防火牆或篩選器）。';

  @override
  String get actionReenterEmail => '重新輸入電子郵件並重試';

  @override
  String get labelKeepPassword => '用密碼保障帳戶安全';

  @override
  String get labelCreatePassword => '建立密碼';

  @override
  String get actionStartTrading => '開始交易';

  @override
  String get actionPrevious => '上一頁';

  @override
  String get labelSignUp => '註冊';

  @override
  String get labelOrSignUpWith => '或使用以下方式註冊';

  @override
  String get labelReferralInfoTitle => '聯盟推薦代碼';

  @override
  String get infoReferralInfoDescription => '由 Deriv 聯盟會員提供的字母數字代碼，僅適用於電子郵件註冊。';

  @override
  String get labelGotReferralCode => '有推薦代碼嗎？';

  @override
  String get labelHaveAccount => '已經有帳戶？';

  @override
  String get actionCreateAccount => '開立免費示範帳戶';

  @override
  String get informInvalidReferralCode => '輸入的推薦代碼無效。檢查並再試一次。';

  @override
  String get labelVerifyYourEmail => '電子郵件驗證';

  @override
  String get labelThanksEmail => '謝謝您驗證了電子郵件';

  @override
  String get informLetsContinue => '讓我們繼續。';

  @override
  String get actionContinue => '繼續';

  @override
  String get labelSearchCountry => '搜尋國家';

  @override
  String informVerificationEmailSent(String email) {
    return '已傳送郵件至$email ，內含激活帳戶的連結。';
  }

  @override
  String get actionEmailNotReceived => '沒收到郵件?';

  @override
  String get informPasswordPolicy => '密碼必須具有：';

  @override
  String get informPasswordPolicyLength => '8-25 個字元';

  @override
  String get informPasswordPolicyLowerAndUpper => '大小寫英文字母';

  @override
  String get informPasswordPolicyNumber => '至少一個數字';

  @override
  String get warnPasswordContainsSymbol => '使用符號加強密碼。';

  @override
  String get labelReferralCode => '推薦代碼';

  @override
  String get actionTryAgain => '重試';

  @override
  String get informInvalid2FACode => '輸入的推薦代碼無效。檢查並再試一次。';

  @override
  String get informFailedAuthentication => '電子郵件地址或密碼不正確。是否用社交帳戶註冊？檢查並再試一次。';

  @override
  String get informDeactivatedAccount => '帳戶已停用。';

  @override
  String get informFailedAuthorization => '授權失敗。';

  @override
  String get informInvalidResidence => '無效的居住地。';

  @override
  String get informInvalidCredentials => '無效的憑證.';

  @override
  String get informMissingOtp => '缺少一次性密碼。';

  @override
  String get informSelfClosed => '帳戶已關閉.';

  @override
  String get informUnexpectedError => '發生不可預測錯誤.';

  @override
  String get informUnsupportedCountry => '您的國家不受支援。';

  @override
  String get informExpiredAccount => '帳戶已過期';

  @override
  String get labelCountryConsentBrazil => '本人特此確認，在 Deriv 開立帳戶以交易由巴西境外推出和提供的場外交易產品的要求是由本人提出的。本人完全理解 Deriv 不受 CVM 監管，且通過與 Deriv 接觸，本人打算與一家外國公司建立關係。';

  @override
  String get informConnectionError => '連線錯誤。請稍後再試一次。';

  @override
  String get informSwitchAccountError => '切換帳戶錯誤。請稍後再試一次。';

  @override
  String get labelDeveloper => '開發員';

  @override
  String get labelEndpoint => '端點';

  @override
  String get semanticEndpoint => '端點';

  @override
  String get warnInvalidEndpoint => '無效的端點';

  @override
  String get labelApplicationID => '應用程式 ID';

  @override
  String get semanticApplicationID => '應用程式 ID';

  @override
  String get warnInvalidApplicationID => '無效的應用程式 ID';

  @override
  String get labelLanguage => '語言';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class DerivAuthLocalizationsZhCn extends DerivAuthLocalizationsZh {
  DerivAuthLocalizationsZhCn(): super('zh_CN');

  @override
  String get labelNotAvailable => '不可用';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '您的国家不能使用 $app';
  }

  @override
  String get actionOk => '确定';

  @override
  String get warnNotAvailableCountries => '如有任何疑问，请通过以下方式联系我们 ';

  @override
  String get labelLiveChat => '实时聊天';

  @override
  String get actionSignUpForFree => '免费注册';

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
  String get actionForgotPassword => '忘记密码？';

  @override
  String get labelDontHaveAnAccountYet => '还没有账户？';

  @override
  String get actionCreateANewAccount => '开立新账户';

  @override
  String get informInvalidEmailFormat => '输入有效的电子邮件地址';

  @override
  String get warnPasswordLength => '必须输入 6-25 个字符。';

  @override
  String get labelResetPassword => '重置密码';

  @override
  String get labelChooseNewPass => '选新密码';

  @override
  String get labelCreatePass => '密码';

  @override
  String get informYourPassHasBeenReset => '密码已重置';

  @override
  String get informRedirectLogin => '需要使用新密码登录。请稍等，正在重定向。';

  @override
  String get actionResetPass => '重置密码';

  @override
  String get informInvalidPasswordFormat => '请输入有效的密码格式';

  @override
  String get labelCheckEmail => '查看电子邮件';

  @override
  String informSendResetPasswordEmail(String email) {
    return '已发送邮件至 $email，内含重置密码的链接。';
  }

  @override
  String get informResetPassByEmail => '会传送内含重设密码的说明的电子邮件。';

  @override
  String get labelSelectCountry => '您的居住地是哪里？';

  @override
  String get labelChooseCountry => '选择国家';

  @override
  String get warnCountryNotAvailable => '对不起，您的所在国不可用 Deriv。';

  @override
  String get actionNext => '下一步';

  @override
  String get labelEmailIssueHeader => '如果数分钟内没有收到我们发送的电子邮件，可能是因为发生了几种情况而引起的：';

  @override
  String get labelEmailIssueSpam => '邮件在垃圾邮箱里 (有时一些邮件会误送到那儿)。';

  @override
  String get labelEmailIssueWrongEmail => '您不小心给了我们另一个电子邮件地址 (通常非您本意，而是属于工作或个人性质的)。';

  @override
  String get labelEmailIssueTypo => '您输入的电子邮件地址拼写有误 (有时这是难免的)。';

  @override
  String get labelEmailIssueFirewall => '无法发送电子邮件到此地址 (通常是因为安装了防火墙或筛选器)。';

  @override
  String get actionReenterEmail => '重新输入电子邮件并重试';

  @override
  String get labelKeepPassword => '用密码保障账户安全';

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
  String get actionTryAgain => '重试';

  @override
  String get informInvalid2FACode => '输入的代码无效。请检查并重试。';

  @override
  String get informFailedAuthentication => '电子邮件或密码可能不正确。是否用社交账户注册？请检查并重试。';

  @override
  String get informDeactivatedAccount => '账户已停用。';

  @override
  String get informFailedAuthorization => '授权失败。';

  @override
  String get informInvalidResidence => '无效的居住地。';

  @override
  String get informInvalidCredentials => '凭证无效。';

  @override
  String get informMissingOtp => '缺少一次性密码。';

  @override
  String get informSelfClosed => '账户已关闭.';

  @override
  String get informUnexpectedError => '发生不可预测的错误.';

  @override
  String get informUnsupportedCountry => '您的国家不受支持。';

  @override
  String get informExpiredAccount => '账户已过期';

  @override
  String get labelCountryConsentBrazil => '本人特此确认，在 Deriv 开立账户以交易由巴西境外推出和提供的场外交易产品的请求是由本人提出的。本人完全理解 Deriv 不受 CVM 监管，且通过与 Deriv 接触，本人打算与一家外国公司建立关系。';

  @override
  String get informConnectionError => '连接错误。请稍后再试。';

  @override
  String get informSwitchAccountError => '切换账户错误。请稍后再试。';

  @override
  String get labelDeveloper => '开发员';

  @override
  String get labelEndpoint => '端点';

  @override
  String get semanticEndpoint => '端点';

  @override
  String get warnInvalidEndpoint => '无效的端点';

  @override
  String get labelApplicationID => '应用程序 ID';

  @override
  String get semanticApplicationID => '应用程序 ID';

  @override
  String get warnInvalidApplicationID => '无效的应用程序 ID';

  @override
  String get labelLanguage => '语言';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class DerivAuthLocalizationsZhTw extends DerivAuthLocalizationsZh {
  DerivAuthLocalizationsZhTw(): super('zh_TW');

  @override
  String get labelNotAvailable => '不可用';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '您的國家/地區不能使用 $app';
  }

  @override
  String get actionOk => '確定';

  @override
  String get warnNotAvailableCountries => '如果有任何疑問，請透過以下方式與我們聯繫 ';

  @override
  String get labelLiveChat => '即時聊天';

  @override
  String get actionSignUpForFree => '免費註冊';

  @override
  String get actionLogin => '登入';

  @override
  String get labelTwoFactorAuth => '雙因素身份驗證';

  @override
  String get informEnterTwoFactorAuthCode => '在手機的驗證器應用程式中輸入 6 位數代碼。';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA 代碼';

  @override
  String get actionProceed => '執行';

  @override
  String get labelLogIn => '登入';

  @override
  String get informLoginOptions => '或透過以下方式登入';

  @override
  String get labelEmail => '電子郵件';

  @override
  String get labelPassword => '密碼';

  @override
  String get actionForgotPassword => '忘記密碼？';

  @override
  String get labelDontHaveAnAccountYet => '還沒有帳戶？';

  @override
  String get actionCreateANewAccount => '開立新帳戶';

  @override
  String get informInvalidEmailFormat => '請輸入有效的電子郵件地址';

  @override
  String get warnPasswordLength => '必須輸入 6-25 個字元。';

  @override
  String get labelResetPassword => '重設密碼';

  @override
  String get labelChooseNewPass => '選新密碼';

  @override
  String get labelCreatePass => '密碼';

  @override
  String get informYourPassHasBeenReset => '密碼已重設';

  @override
  String get informRedirectLogin => '需要使用新密碼登入。等等，正在重導向。';

  @override
  String get actionResetPass => '重設密碼';

  @override
  String get informInvalidPasswordFormat => '請輸入有效的密碼格式';

  @override
  String get labelCheckEmail => '查看電子郵件';

  @override
  String informSendResetPasswordEmail(String email) {
    return '已傳送郵件至$email ，內含重設密碼的連結。';
  }

  @override
  String get informResetPassByEmail => '將以電子郵件傳送重設密碼的說明。';

  @override
  String get labelSelectCountry => '您的居住地是哪里？';

  @override
  String get labelChooseCountry => '選擇國家';

  @override
  String get warnCountryNotAvailable => '對不起，您的所在國不可用 Deriv。';

  @override
  String get actionNext => '下一頁';

  @override
  String get labelEmailIssueHeader => '如果數分鐘內沒有收到我們傳送的電子郵件，可能是因為發生了幾種情況而引起的:';

  @override
  String get labelEmailIssueSpam => '郵件在垃圾郵箱 (有時一些郵件會誤送到那兒)。';

  @override
  String get labelEmailIssueWrongEmail => '您不小心給了另一個電子郵件地址 (通常非您本意，而是屬於工作或個人性質的)。';

  @override
  String get labelEmailIssueTypo => '輸入的電子郵件地址拼寫有誤 (有時這是難免的)。';

  @override
  String get labelEmailIssueFirewall => '電子郵件無法傳送到此地址 (通常是因為安裝了防火牆或篩選器)。';

  @override
  String get actionReenterEmail => '重新輸入電子郵件並重試';

  @override
  String get labelKeepPassword => '用密碼保障帳戶安全';

  @override
  String get labelCreatePassword => '建立密碼';

  @override
  String get actionStartTrading => '開始交易';

  @override
  String get actionPrevious => '上一頁';

  @override
  String get labelSignUp => '註冊';

  @override
  String get labelOrSignUpWith => '或使用以下方式註冊';

  @override
  String get labelReferralInfoTitle => '聯盟推薦代碼';

  @override
  String get infoReferralInfoDescription => '由 Deriv 聯盟會員提供的字母數字代碼，僅適用於電子郵件註冊。';

  @override
  String get labelGotReferralCode => '有推薦代碼嗎？';

  @override
  String get labelHaveAccount => '已經有帳戶？';

  @override
  String get actionCreateAccount => '開立免費示範帳戶';

  @override
  String get informInvalidReferralCode => '輸入的推薦代碼無效。檢查並再試一次。';

  @override
  String get labelVerifyYourEmail => '電子郵件驗證';

  @override
  String get labelThanksEmail => '謝謝您驗證了電子郵件';

  @override
  String get informLetsContinue => '讓我們繼續。';

  @override
  String get actionContinue => '繼續';

  @override
  String get labelSearchCountry => '搜尋國家';

  @override
  String informVerificationEmailSent(String email) {
    return '已傳送郵件至$email ，內含激活帳戶的連結。';
  }

  @override
  String get actionEmailNotReceived => '沒收到郵件?';

  @override
  String get informPasswordPolicy => '密碼必須具有：';

  @override
  String get informPasswordPolicyLength => '8-25 個字元';

  @override
  String get informPasswordPolicyLowerAndUpper => '大小寫英文字母';

  @override
  String get informPasswordPolicyNumber => '至少一個數字';

  @override
  String get warnPasswordContainsSymbol => '使用符號加強密碼。';

  @override
  String get labelReferralCode => '推薦代碼';

  @override
  String get actionTryAgain => '重試';

  @override
  String get informInvalid2FACode => '輸入的推薦代碼無效。檢查並再試一次。';

  @override
  String get informFailedAuthentication => '電子郵件地址或密碼不正確。是否用社交帳戶註冊？檢查並再試一次。';

  @override
  String get informDeactivatedAccount => '帳戶已停用。';

  @override
  String get informFailedAuthorization => '授權失敗。';

  @override
  String get informInvalidResidence => '無效的居住地。';

  @override
  String get informInvalidCredentials => '無效的憑證.';

  @override
  String get informMissingOtp => '缺少一次性密碼。';

  @override
  String get informSelfClosed => '帳戶已關閉.';

  @override
  String get informUnexpectedError => '發生不可預測錯誤.';

  @override
  String get informUnsupportedCountry => '您的國家不受支援。';

  @override
  String get informExpiredAccount => '帳戶已過期';

  @override
  String get labelCountryConsentBrazil => '本人特此確認，在 Deriv 開立帳戶以交易由巴西境外推出和提供的場外交易產品的要求是由本人提出的。本人完全理解 Deriv 不受 CVM 監管，且透過與 Deriv 接觸，本人打算與一家外國公司建立關係。';

  @override
  String get informConnectionError => '連線錯誤。請稍後再試一次。';

  @override
  String get informSwitchAccountError => '切換帳戶錯誤。請稍後再試一次。';

  @override
  String get labelDeveloper => '開發員';

  @override
  String get labelEndpoint => '端點';

  @override
  String get semanticEndpoint => '端點';

  @override
  String get warnInvalidEndpoint => '無效的端點';

  @override
  String get labelApplicationID => '應用程式 ID';

  @override
  String get semanticApplicationID => '應用程式 ID';

  @override
  String get warnInvalidApplicationID => '無效的應用程式 ID';

  @override
  String get labelLanguage => '語言';
}
