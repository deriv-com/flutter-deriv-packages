import 'deriv_passkeys_localizations.dart';

/// The translations for Russian (`ru`).
class DerivPasskeysLocalizationsRu extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Готово!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Теперь ваша учетная запись защищена passkey. Управляйте своим passkey через настройки учетной записи $platformName.';
  }

  @override
  String get continueButtonText => 'Продолжить';

  @override
  String get unexpectedError => 'Произошла неожиданная ошибка!';

  @override
  String get unexpectedErrorDescription => 'Попробуйте позже.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Испытайте более безопасный вход в систему';

  @override
  String get enhanceSecurity => 'Повышенная безопасность — всего лишь одно касание.';

  @override
  String get here => 'здесь';

  @override
  String get effortlessLogin => 'Легкий вход в систему с помощью passkeys';

  @override
  String get whatArePasskeys => 'Что такое passkeys?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Безопасная альтернатива паролям.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Разблокируйте свою учетную запись, как телефон — с помощью биометрии, сканирования лица или PIN-кода.';

  @override
  String get whyPasskeys => 'Зачем нужны passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Дополнительный уровень безопасности.';

  @override
  String get whyPasskeysDescription2 => 'Защищает от несанкционированного доступа и фишинга.';

  @override
  String get howToCreatePasskey => 'Как создать passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Перейдите в ‘Настройки учетной записи’ на Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Вы можете создать один passkey для каждого устройства.';

  @override
  String get p2pHowToCreatePasskey => 'Как создать пароль?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Перейдите на «Профиль» в приложении Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Нажмите «Пароли», чтобы создать свой пароль.';

  @override
  String get whereArePasskeysSaved => 'Где хранятся passkeys?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Менеджер паролей Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: связка ключей iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Что произойдет, если адрес электронной почты моей учетной записи Deriv изменится?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Нет проблем! Ваш passkey по-прежнему работает.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Войдите в Deriv, используя существующий passkey.';

  @override
  String get tips => 'Советы';

  @override
  String get beforeUsingPasskeys => 'Перед использованием passkey';

  @override
  String get enableScreenLock => 'Включите блокировку экрана на своем устройстве.';

  @override
  String get signInGoogleOrIcloud => 'Войдите в свою учетную запись Google или iCloud.';

  @override
  String get enableBluetooth => 'Включите Bluetooth.';

  @override
  String get noPasskeyFound => 'Passkey не найден!';

  @override
  String get noPasskeyFoundDescription => 'Чтобы использовать эту функцию, создайте Passkey.';

  @override
  String get maybeLater => 'Может быть позже';

  @override
  String get effortlessLoginWithPasskeys => 'Легкий вход в систему с помощью passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Узнайте больше о passkeys';

  @override
  String get noNeedToRememberPassword => 'Нет необходимости запоминать пароль';

  @override
  String get useYourBiometrics => 'Повышенная безопасность с помощью биометрии или блокировки экрана';

  @override
  String get syncAcrossDevices => 'Синхронизация между устройствами';

  @override
  String get createPasskey => 'Создать passkey';

  @override
  String get unsupportedPlatform => 'Неподдерживаемая платформа';

  @override
  String get storedOn => 'Хранится в';

  @override
  String get lastUsed => 'Недавние';

  @override
  String get rename => 'Переименовать';

  @override
  String get revoke => 'Отменить';

  @override
  String get continueTradingButtonText => 'Продолжить торговлю';

  @override
  String get addMorePasskeysButtonText => 'Больше passkeys';

  @override
  String get unableToSetupPasskey => 'Невозможно настроить passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Мы столкнулись с проблемой при настройке вашего passkey. Возможно, процесс был прерван, или сессия завершилась по таймеру. Пожалуйста, попробуйте еще раз.';

  @override
  String get passkeysOffErrorTitle => 'Служба Passkeys недоступна';

  @override
  String get never => 'Никогда';

  @override
  String get unable_to_process_your_request => 'Не удалось обработать ваш запрос';

  @override
  String get unable_to_process_your_request_description => 'При обработке вашего запроса возникла временная проблема. Пожалуйста, повторите попытку позже.';
}
