import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class DerivAuthLocalizationsEs extends DerivAuthLocalizations {
  DerivAuthLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get labelNotAvailable => 'No disponible';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app no está disponible en tu país';
  }

  @override
  String get actionOk => 'Aceptar';

  @override
  String get warnNotAvailableCountries => 'Si tiene alguna pregunta, póngase en contacto con nosotros a través de ';

  @override
  String get labelLiveChat => 'Live Chat';

  @override
  String get actionSignUpForFree => 'Regístrate gratis';

  @override
  String get actionLogin => 'Iniciar sesión';

  @override
  String get labelTwoFactorAuth => 'Autenticación de dos factores';

  @override
  String get informEnterTwoFactorAuthCode => 'Introduzca el código de 6 dígitos de la aplicación autenticadora de su teléfono.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Código 2FA';

  @override
  String get actionProceed => 'Seguir';

  @override
  String get labelLogIn => 'Iniciar sesión';

  @override
  String get informLoginOptions => 'O inicie sesión con';

  @override
  String get labelEmail => 'Correo electrónico';

  @override
  String get labelPassword => 'Contraseña';

  @override
  String get actionForgotPassword => '¿Olvidó la contraseña?';

  @override
  String get labelDontHaveAnAccountYet => '¿Aún no tiene una cuenta?';

  @override
  String get actionCreateANewAccount => 'Crear una cuenta nueva';

  @override
  String get informInvalidEmailFormat => 'Introduzca una dirección de correo electrónico válida';

  @override
  String get warnPasswordLength => 'Debería ingresar de 8 a 25 caracteres.';

  @override
  String get labelResetPassword => 'Restablecer contraseña';

  @override
  String get labelChooseNewPass => 'Elija una contraseña nueva';

  @override
  String get labelCreatePass => 'Contraseña';

  @override
  String get informYourPassHasBeenReset => 'Su contraseña ha sido restablecida';

  @override
  String get informRedirectLogin => 'Tendrá que iniciar sesión con su nueva contraseña. Espere, le estamos redirigiendo.';

  @override
  String get actionResetPass => 'Restablecer mi contraseña';

  @override
  String get informInvalidPasswordFormat => 'Por favor, introduzca un formato de contraseña válido';

  @override
  String get labelCheckEmail => 'Revise su correo electrónico';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Hemos enviado un mensaje a $email con un enlace para restablecer su contraseña.';
  }

  @override
  String get informResetPassByEmail => 'Le enviaremos instrucciones por correo electrónico para restablecer su contraseña.';

  @override
  String get labelSelectCountry => '¿Dónde vive?';

  @override
  String get labelChooseCountry => 'Elija su país';

  @override
  String get warnCountryNotAvailable => 'Lamentablemente, Deriv no está disponible en su país.';

  @override
  String get actionNext => 'Siguiente';

  @override
  String get labelEmailIssueHeader => 'Si no ve un correo electrónico nuestro en unos minutos, podrían haber sucedido algunas cosas:';

  @override
  String get labelEmailIssueSpam => 'El correo electrónico está en su carpeta de spam (a veces las cosas se pierden allí).';

  @override
  String get labelEmailIssueWrongEmail => 'Accidentalmente nos proporcionó otra dirección de correo electrónico (tal vez una de trabajo o una personal diferente a la que pensaba utilizar).';

  @override
  String get labelEmailIssueTypo => 'La dirección de correo electrónico que ingresó tenía un fallo o error tipográfico (pasa hasta en las mejores familias).';

  @override
  String get labelEmailIssueFirewall => 'No podemos enviar el correo electrónico a esta dirección (Usualmente debido a firewalls o al filtrado).';

  @override
  String get actionReenterEmail => 'Vuelva a ingresar su correo e inténtelo de nuevo';

  @override
  String get labelKeepPassword => 'Mantenga su cuenta segura con una contraseña';

  @override
  String get labelCreatePassword => 'Cree una contraseña';

  @override
  String get actionStartTrading => 'Comenzar a operar';

  @override
  String get actionPrevious => 'Anterior';

  @override
  String get labelSignUp => 'Crear cuenta';

  @override
  String get labelOrSignUpWith => 'O regístrese con';

  @override
  String get labelReferralInfoTitle => 'Código de referencia del afiliado';

  @override
  String get infoReferralInfoDescription => 'Un código alfanumérico proporcionado por un afiliado de Deriv, aplicable únicamente a las inscripciones por correo electrónico.';

  @override
  String get labelGotReferralCode => '¿Tiene un código de referencia?';

  @override
  String get labelHaveAccount => '¿Ya tiene una cuenta?';

  @override
  String get actionCreateAccount => 'Crear cuenta demo gratis';

  @override
  String get informInvalidReferralCode => 'El código de referencia que ha introducido no es válido. Compruébelo e inténtelo de nuevo.';

  @override
  String get labelVerifyYourEmail => 'Verifique su correo electrónico';

  @override
  String get labelThanksEmail => 'Gracias por verificar su correo electrónico';

  @override
  String get informLetsContinue => 'Continuemos.';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get labelSearchCountry => 'Buscar país';

  @override
  String informVerificationEmailSent(String email) {
    return 'Hemos enviado un mensaje a $email con un enlace para activar su cuenta.';
  }

  @override
  String get actionEmailNotReceived => '¿No recibió su correo electrónico?';

  @override
  String get informPasswordPolicy => 'Su contraseña debe tener:';

  @override
  String get informPasswordPolicyLength => '8-25 caracteres';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Letras mayúsculas y minúsculas';

  @override
  String get informPasswordPolicyNumber => 'Al menos un número';

  @override
  String get warnPasswordContainsSymbol => 'Utilice símbolos para una contraseña segura.';

  @override
  String get labelReferralCode => 'Código de Referencia';

  @override
  String get actionTryAgain => 'Intentar de nuevo';

  @override
  String get informInvalid2FACode => 'El código que ha introducido no es válido. Compruébelo e inténtelo de nuevo.';

  @override
  String get informFailedAuthentication => 'Su correo electrónico o contraseña pueden ser incorrectos. ¿Se ha registrado con una cuenta social? Compruébelo e inténtelo de nuevo.';

  @override
  String get informDeactivatedAccount => 'Tu cuenta está desactivada.';

  @override
  String get informFailedAuthorization => 'Fallo en la autorización.';

  @override
  String get informInvalidResidence => 'Residencia no válida.';

  @override
  String get informInvalidCredentials => 'Credenciales no válidas.';

  @override
  String get informMissingOtp => 'Falta la contraseña de un solo uso.';

  @override
  String get informSelfClosed => 'Su cuenta ha sido cerrada.';

  @override
  String get informUnexpectedError => 'Ha ocurrido un error inesperado.';

  @override
  String get informUnsupportedCountry => 'Tu país no es compatible.';

  @override
  String get informExpiredAccount => 'Tu cuenta ha caducado';

  @override
  String get labelCountryConsentBrazil => 'Confirmo que mi solicitud de apertura de cuenta en Deriv para operar productos OTC emitidos y ofrecidos exclusivamente fuera de Brasil fue iniciada por mí. Entiendo plenamente que Deriv no está regulada por la CVM y al dirigirme a Deriv pretendo establecer una relación con una empresa extranjera.';

  @override
  String get informConnectionError => 'Error de conexión. Vuelva a intentarlo más tarde.';

  @override
  String get informSwitchAccountError => 'Error al cambiar de cuenta. Vuelva a intentarlo más tarde.';

  @override
  String get labelDeveloper => 'Desarrollador';

  @override
  String get labelEndpoint => 'Punto final';

  @override
  String get semanticEndpoint => 'Punto final';

  @override
  String get warnInvalidEndpoint => 'punto final no válido';

  @override
  String get labelApplicationID => 'ID de aplicación';

  @override
  String get semanticApplicationID => 'ID de aplicación';

  @override
  String get warnInvalidApplicationID => 'ID de aplicación no válido';

  @override
  String get labelLanguage => 'Idioma';
}
