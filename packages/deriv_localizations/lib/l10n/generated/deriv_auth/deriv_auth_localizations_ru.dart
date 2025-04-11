import 'deriv_auth_localizations.dart';

/// The translations for Russian (`ru`).
class DerivAuthLocalizationsRu extends DerivAuthLocalizations {
  DerivAuthLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get labelNotAvailable => 'Недоступно';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app недоступен в вашей стране';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries =>
      'Если у Вас возникли вопросы, свяжитесь с нами по ';

  @override
  String get labelLiveChat => 'Чат';

  @override
  String get actionSignUpForFree => 'Зарегистрируйтесь бесплатно';

  @override
  String get actionLogin => 'Вход';

  @override
  String get labelTwoFactorAuth => 'Двухфакторная аутентификация';

  @override
  String get informEnterTwoFactorAuthCode =>
      'Введите 6-значный код из приложения аутентификатора на Вашем телефоне.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Код 2FA';

  @override
  String get actionProceed => 'Далее';

  @override
  String get labelLogIn => 'Вход';

  @override
  String get informLoginOptions => 'Или войдите через';

  @override
  String get labelEmail => 'Email';

  @override
  String get labelPassword => 'Пароль';

  @override
  String get actionForgotPassword => 'Забыли пароль?';

  @override
  String get labelDontHaveAnAccountYet => 'У Вас еще нет учетной записи?';

  @override
  String get actionCreateANewAccount => 'Откройте новый счет';

  @override
  String get informInvalidEmailFormat =>
      'Введите действительный адрес электронной почты';

  @override
  String get warnPasswordLength => 'Вы должны ввести 8-25 символов.';

  @override
  String get labelResetPassword => 'Сбросить пароль';

  @override
  String get labelChooseNewPass => 'Выберите новый пароль';

  @override
  String get labelCreatePass => 'Пароль';

  @override
  String get informYourPassHasBeenReset => 'Ваш пароль был сброшен';

  @override
  String get informRedirectLogin =>
      'Вам нужно будет войти в систему с новым паролем. Подождите, мы перенаправляем Вас.';

  @override
  String get actionResetPass => 'Изменить пароль';

  @override
  String get informInvalidPasswordFormat =>
      'Введите пароль в действующем формате';

  @override
  String get labelCheckEmail => 'Проверьте эл. почту';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Мы отправили сообщение на адрес $email со ссылкой для сброса Вашего пароля.';
  }

  @override
  String get informResetPassByEmail =>
      'Инструкции для изменения пароля будут отправлены на ваш эл. адрес.';

  @override
  String get labelSelectCountry => 'Где вы живете?';

  @override
  String get labelChooseCountry => 'Выберите страну';

  @override
  String get warnCountryNotAvailable =>
      'К сожалению, Deriv недоступен в вашей стране.';

  @override
  String get actionNext => 'Далее';

  @override
  String get labelEmailIssueHeader =>
      'Если вы не получили наше письмо в течение нескольких минут, возможно, произошло следующее:';

  @override
  String get labelEmailIssueSpam => 'Письмо попало в папку со спамом.';

  @override
  String get labelEmailIssueWrongEmail =>
      'Вы по ошибке указали неправильный email (как правило, рабочий или личный email вместо нужного).';

  @override
  String get labelEmailIssueTypo =>
      'Адрес эл. почты был введен с ошибкой или опечаткой (случается с лучшими из нас).';

  @override
  String get labelEmailIssueFirewall =>
      'Мы не можем отправить письмо на этот адрес (из-за использования firewall или фильтрации).';

  @override
  String get actionReenterEmail => 'Введите email и попробуйте снова';

  @override
  String get labelKeepPassword => 'Защитите счет паролем';

  @override
  String get labelCreatePassword => 'Придумайте пароль';

  @override
  String get actionStartTrading => 'Начать торговлю';

  @override
  String get actionPrevious => 'Назад';

  @override
  String get labelSignUp => 'Регистрация';

  @override
  String get labelOrSignUpWith => 'Или войдите через';

  @override
  String get labelReferralInfoTitle => 'Партнерский реферальный код';

  @override
  String get infoReferralInfoDescription =>
      'Буквенно-цифровой код, предоставляемый партнером Deriv, применимый только для регистрации по электронной почте.';

  @override
  String get labelGotReferralCode => 'У Вас есть реферальный код?';

  @override
  String get labelHaveAccount => 'Уже зарегистрированы?';

  @override
  String get actionCreateAccount => 'Открыть бесплатный демо-счет';

  @override
  String get informInvalidReferralCode =>
      'Введенный Вами реферальный код недействителен. Проверьте и попробуйте еще раз.';

  @override
  String get labelVerifyYourEmail => 'Подтвердите эл. адрес';

  @override
  String get labelThanksEmail => 'Спасибо за подтверждение электронной почты';

  @override
  String get informLetsContinue => 'Давайте продолжим.';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get labelSearchCountry => 'Страна поиска';

  @override
  String informVerificationEmailSent(String email) {
    return 'Мы отправили сообщение на $email со ссылкой для активации Вашей учетной записи.';
  }

  @override
  String get actionEmailNotReceived => 'Не получили письмо?';

  @override
  String get informPasswordPolicy => 'Ваш пароль должен иметь:';

  @override
  String get informPasswordPolicyLength => '8-25 символов';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Строчные и заглавные буквы';

  @override
  String get informPasswordPolicyNumber => 'По крайней мере, одно число';

  @override
  String get warnPasswordContainsSymbol =>
      'Используйте символы для создания надежного пароля.';

  @override
  String get labelReferralCode => 'Реферальный код';

  @override
  String get actionTryAgain => 'Повторить';

  @override
  String get informInvalid2FACode =>
      'Введенный Вами код недействителен. Проверьте и попробуйте еще раз.';

  @override
  String get informFailedAuthentication =>
      'Возможно, Ваш e-mail или пароль неверны. Вы зарегистрировались с помощью социальной учетной записи? Проверьте и попробуйте еще раз.';

  @override
  String get informDeactivatedAccount => 'Ваш аккаунт деактивирован.';

  @override
  String get informFailedAuthorization => 'Не удалось авторизоваться.';

  @override
  String get informInvalidResidence => 'Недействительное место жительства.';

  @override
  String get informInvalidCredentials => 'Неверные учетные данные.';

  @override
  String get informMissingOtp => 'Отсутствует одноразовый пароль.';

  @override
  String get informSelfClosed => 'Ваш счет был закрыт.';

  @override
  String get informUnexpectedError => 'Произошла неожиданная ошибка.';

  @override
  String get informUnsupportedCountry =>
      'Ваша страна не пользуется поддержкой.';

  @override
  String get informExpiredAccount => 'Срок действия вашей учетной записи истек';

  @override
  String get labelCountryConsentBrazil =>
      'Настоящим я подтверждаю, что запрос на открытие счета в Deriv для торговли внебиржевыми продуктами, выпущенными и предлагаемыми исключительно за пределами Бразилии, был инициирован мной. Я понимаю, что деятельность Deriv не регулируется CVM, и, обратившись в Deriv, вступаю в деловые отношения с иностранной компанией.';

  @override
  String get informConnectionError =>
      'Ошибка подключения. Пожалуйста, попробуйте позже.';

  @override
  String get informSwitchAccountError =>
      'Ошибка переключения учетной записи. Пожалуйста, попробуйте позже.';

  @override
  String get labelDeveloper => 'Разработчик';

  @override
  String get labelEndpoint => 'Конечная точка';

  @override
  String get semanticEndpoint => 'Конечная точка';

  @override
  String get warnInvalidEndpoint => 'неверная конечная точка';

  @override
  String get labelApplicationID => 'ID приложения';

  @override
  String get semanticApplicationID => 'ID приложения';

  @override
  String get warnInvalidApplicationID => 'неверный ID приложения';

  @override
  String get labelLanguage => 'Язык';
}
