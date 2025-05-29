import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class DerivPasskeysLocalizationsRu extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Готово!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Ваш счет теперь защищен биометрией. Управляйте биометрическими данными в настройках счета $platformName.';
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
  String get enhanceSecurity => 'Используйте отпечаток пальца, распознавание лица или другую биометрию для простого и безопасного входа.';

  @override
  String get here => 'здесь';

  @override
  String get effortlessLogin => 'Легкий вход с помощью биометрии';

  @override
  String get whatArePasskeys => 'Что такое биометрия?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Безопасная альтернатива паролям.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Разблокируйте свою учетную запись, как телефон — с помощью биометрии, сканирования лица или PIN-кода.';

  @override
  String get whyPasskeys => 'Зачем использовать биометрию?';

  @override
  String get whyPasskeysDescription1 => 'Дополнительный уровень безопасности.';

  @override
  String get whyPasskeysDescription2 => 'Защищает от несанкционированного доступа и фишинга.';

  @override
  String get howToCreatePasskey => 'Как включить биометрию?';

  @override
  String get howToCreatePasskeyDescription1 => 'Перейдите в ‘Настройки учетной записи’ на Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Нажмите «Биометрия», чтобы создать биометрические данные.';

  @override
  String get p2pHowToCreatePasskey => 'Как включить биометрию?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Перейдите на «Профиль» в приложении Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Нажмите «Биометрия», чтобы создать биометрические данные.';

  @override
  String get whereArePasskeysSaved => 'Где хранятся биометрические данные?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Менеджер паролей Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: связка ключей iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Что произойдет, если адрес электронной почты моей учетной записи Deriv изменится?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Все в порядке! Биометрия по-прежнему работает.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Вы можете войти с помощью ранее сохраненной биометрии.';

  @override
  String get tips => 'Советы';

  @override
  String get beforeUsingPasskeys => 'Перед использованием биометрии';

  @override
  String get enableScreenLock => 'Включите блокировку экрана на своем устройстве.';

  @override
  String get signInGoogleOrIcloud => 'Войдите в свою учетную запись Google или iCloud.';

  @override
  String get enableBluetooth => 'Включите Bluetooth.';

  @override
  String get noPasskeyFound => 'Биометрия не найдена!';

  @override
  String get noPasskeyFoundDescription => 'Создайте биометрию, чтобы воспользоваться этой функцией.';

  @override
  String get maybeLater => 'Может быть позже';

  @override
  String get effortlessLoginWithPasskeys => 'Легкий вход с помощью биометрии';

  @override
  String get learnMoreAboutPasskeys => 'Подробнее о биометрии';

  @override
  String get noNeedToRememberPassword => 'Нет необходимости запоминать пароль';

  @override
  String get useYourBiometrics => 'Повышенная защита с биометрией или блокировкой экрана';

  @override
  String get syncAcrossDevices => 'Синхронизация между устройствами';

  @override
  String get createPasskey => 'Включить биометрию';

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
  String get addMorePasskeysButtonText => 'Добавить новую биометрию';

  @override
  String get unableToSetupPasskey => 'Не удалось настроить биометрию';

  @override
  String get unableToSetupPasskeyDescription => 'Произошла ошибка при настройке биометрии. Возможно, сессия истекла или процесс был прерван. Попробуйте снова.';

  @override
  String get passkeysOffErrorTitle => 'Сервис биометрии недоступен';

  @override
  String get never => 'Никогда';

  @override
  String get unable_to_process_your_request => 'Не удалось обработать ваш запрос';

  @override
  String get unable_to_process_your_request_description => 'При обработке вашего запроса возникла временная проблема. Пожалуйста, повторите попытку позже.';
}
