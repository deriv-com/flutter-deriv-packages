import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class DerivPasskeysLocalizationsEs extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => '¡Exitoso!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Su cuenta está ahora protegida con una passkey. Gestione su passkey a través de la configuración de su cuenta $platformName.';
  }

  @override
  String get continueButtonText => 'Continuar';

  @override
  String get unexpectedError => 'Ha ocurrido un error inesperado!';

  @override
  String get unexpectedErrorDescription => 'Por favor, inténtelo más tarde.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Experimente inicios de sesión más seguros';

  @override
  String get enhanceSecurity => 'La seguridad mejorada está a sólo un toque de distancia.';

  @override
  String get here => 'aquí';

  @override
  String get effortlessLogin => 'Inicio de sesión sin esfuerzo con passkeys';

  @override
  String get whatArePasskeys => '¿Qué son las passkeys?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Alternativa segura a las contraseñas.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Desbloquee su cuenta como si fuera su teléfono: con biometría, escáner facial o PIN.';

  @override
  String get whyPasskeys => '¿Por qué passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Capa de seguridad adicional.';

  @override
  String get whyPasskeysDescription2 => 'Protege contra el acceso no autorizado y la suplantación de identidad.';

  @override
  String get howToCreatePasskey => '¿Cómo crear una passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Vaya a \"Configuración de la cuenta\" en Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Puede crear una passkey por dispositivo.';

  @override
  String get p2pHowToCreatePasskey => '¿Cómo crear una clave de paso?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Ir a «Perfil» en tu aplicación Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Pulsa «Claves de paso» para crear tu clave de paso.';

  @override
  String get whereArePasskeysSaved => '¿Dónde se guardan las passkeys?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Gestor de contraseñas de Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: Llavero de iCloud.';

  @override
  String get whatHappensIfEmailChanged => '¿Qué ocurre si se cambia el correo electrónico de mi cuenta de Deriv?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'No hay problema. Su passkey sigue funcionando.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Inicie sesión en Deriv con su passkey actual.';

  @override
  String get tips => 'Consejos';

  @override
  String get beforeUsingPasskeys => 'Antes de usar la passkey:';

  @override
  String get enableScreenLock => 'Habilite el bloqueo de pantalla en su dispositivo.';

  @override
  String get signInGoogleOrIcloud => 'Inicie sesión en su cuenta de Google o iCloud.';

  @override
  String get enableBluetooth => 'Activar Bluetooth.';

  @override
  String get noPasskeyFound => '¡No se encontró ninguna passkey!';

  @override
  String get noPasskeyFoundDescription => 'Cree una passkey para usar esta función.';

  @override
  String get maybeLater => 'Quizás más tarde';

  @override
  String get effortlessLoginWithPasskeys => 'Inicio de sesión sin esfuerzo con passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Obtenga más información sobre las passkeys';

  @override
  String get noNeedToRememberPassword => 'No es necesario recordar una contraseña';

  @override
  String get useYourBiometrics => 'Seguridad mejorada con biometría o bloqueo de pantalla';

  @override
  String get syncAcrossDevices => 'Sincronización entre dispositivos';

  @override
  String get createPasskey => 'Crear passkey';

  @override
  String get unsupportedPlatform => 'Plataforma no compatible';

  @override
  String get storedOn => 'Almacenado en';

  @override
  String get lastUsed => 'Utilizado por última vez';

  @override
  String get rename => 'Renombrar';

  @override
  String get revoke => 'Revocar';

  @override
  String get continueTradingButtonText => 'Continúe operando';

  @override
  String get addMorePasskeysButtonText => 'Añadir más Passkeys';

  @override
  String get unableToSetupPasskey => 'No se puede configurar la passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Hemos encontrado un problema al configurar su passkey. Es posible que el proceso se haya interrumpido o que la sesión haya expirado. Por favor, inténtelo de nuevo.';

  @override
  String get passkeysOffErrorTitle => 'El servicio Passkeys no está disponible';

  @override
  String get never => 'Nunca';

  @override
  String get unable_to_process_your_request => 'No se puede procesar su solicitud';

  @override
  String get unable_to_process_your_request_description => 'Estamos teniendo un problema temporal al procesar tu solicitud. Vuelva a intentarlo más tarde.';
}
