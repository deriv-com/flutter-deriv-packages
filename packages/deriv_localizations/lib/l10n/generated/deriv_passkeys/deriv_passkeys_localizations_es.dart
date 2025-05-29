import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class DerivPasskeysLocalizationsEs extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => '¡Exitoso!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Su cuenta está ahora protegida con una Biometric. Gestione su Biometric a través de la configuración de su cuenta $platformName.';
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
  String get effortlessLogin => 'Inicio de sesión sin esfuerzo con Biometrics';

  @override
  String get whatArePasskeys => '¿Qué son las Biometrics?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Alternativa segura a las contraseñas.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Desbloquee su cuenta como si fuera su teléfono: con biometría, escáner facial o PIN.';

  @override
  String get whyPasskeys => '¿Por qué Biometrics?';

  @override
  String get whyPasskeysDescription1 => 'Capa de seguridad adicional.';

  @override
  String get whyPasskeysDescription2 => 'Protege contra el acceso no autorizado y la suplantación de identidad.';

  @override
  String get howToCreatePasskey => '¿Cómo crear una Biometric?';

  @override
  String get howToCreatePasskeyDescription1 => 'Vaya a \"Configuración de la cuenta\" en Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Puede crear una Biometric por dispositivo.';

  @override
  String get p2pHowToCreatePasskey => '¿Cómo crear una clave de paso?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Ir a «Perfil» en tu aplicación Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Pulsa «Claves de paso» para crear tu clave de paso.';

  @override
  String get whereArePasskeysSaved => '¿Dónde se guardan las Biometrics?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Gestor de contraseñas de Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: Llavero de iCloud.';

  @override
  String get whatHappensIfEmailChanged => '¿Qué ocurre si se cambia el correo electrónico de mi cuenta de Deriv?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'No hay problema. Su Biometric sigue funcionando.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Inicie sesión en Deriv con su Biometric actual.';

  @override
  String get tips => 'Consejos';

  @override
  String get beforeUsingPasskeys => 'Antes de usar la Biometric:';

  @override
  String get enableScreenLock => 'Habilite el bloqueo de pantalla en su dispositivo.';

  @override
  String get signInGoogleOrIcloud => 'Inicie sesión en su cuenta de Google o iCloud.';

  @override
  String get enableBluetooth => 'Activar Bluetooth.';

  @override
  String get noPasskeyFound => '¡No se encontró ninguna Biometric!';

  @override
  String get noPasskeyFoundDescription => 'Cree una Biometric para usar esta función.';

  @override
  String get maybeLater => 'Quizás más tarde';

  @override
  String get effortlessLoginWithPasskeys => 'Inicio de sesión sin esfuerzo con Biometrics';

  @override
  String get learnMoreAboutPasskeys => 'Obtenga más información sobre las Biometrics';

  @override
  String get noNeedToRememberPassword => 'No es necesario recordar una contraseña';

  @override
  String get useYourBiometrics => 'Seguridad mejorada con biometría o bloqueo de pantalla';

  @override
  String get syncAcrossDevices => 'Sincronización entre dispositivos';

  @override
  String get createPasskey => 'Crear Biometric';

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
  String get addMorePasskeysButtonText => 'Añadir más Biometrics';

  @override
  String get unableToSetupPasskey => 'No se puede configurar la Biometric';

  @override
  String get unableToSetupPasskeyDescription => 'Hemos encontrado un problema al configurar su Biometric. Es posible que el proceso se haya interrumpido o que la sesión haya expirado. Por favor, inténtelo de nuevo.';

  @override
  String get passkeysOffErrorTitle => 'El servicio Biometrics no está disponible';

  @override
  String get never => 'Nunca';

  @override
  String get unable_to_process_your_request => 'No se puede procesar su solicitud';

  @override
  String get unable_to_process_your_request_description => 'Estamos teniendo un problema temporal al procesar tu solicitud. Vuelva a intentarlo más tarde.';
}
