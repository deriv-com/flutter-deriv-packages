import 'deriv_auth_localizations.dart';

/// The translations for Portuguese (`pt`).
class DerivAuthLocalizationsPt extends DerivAuthLocalizations {
  DerivAuthLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get labelNotAvailable => 'Indisponível';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return 'A $app não está disponível no seu país';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'Em caso de dúvidas, contacte-nos via ';

  @override
  String get labelLiveChat => 'Live chat';

  @override
  String get actionSignUpForFree => 'Registe-se gratuitamente';

  @override
  String get actionLogin => 'Iniciar sessão';

  @override
  String get labelTwoFactorAuth => 'Autenticação de dois fatores';

  @override
  String get informEnterTwoFactorAuthCode => 'Introduza o código de 6 dígitos da aplicação de autenticação no seu telemóvel.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Código de autenticação de dois fatores (2FA)';

  @override
  String get actionProceed => 'Continuar';

  @override
  String get labelLogIn => 'Iniciar sessão';

  @override
  String get informLoginOptions => 'Ou inicie sessão através de';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Palavra-passe';

  @override
  String get actionForgotPassword => 'Esqueceu-se da palavra-passe?';

  @override
  String get labelDontHaveAnAccountYet => 'Ainda não tem uma conta?';

  @override
  String get actionCreateANewAccount => 'Criar nova conta';

  @override
  String get informInvalidEmailFormat => 'Introduza um e-mail válido';

  @override
  String get warnPasswordLength => 'Deve introduzir entre 6 a 25 caracteres.';

  @override
  String get labelResetPassword => 'Repor palavra-passe';

  @override
  String get labelChooseNewPass => 'Escolha uma nova palavra-passe';

  @override
  String get labelCreatePass => 'Palavra-passe';

  @override
  String get informYourPassHasBeenReset => 'A palavra-passe foi alterada';

  @override
  String get informRedirectLogin => 'É necessário iniciar sessão com a sua nova palavra-passe. Aguarde, estamos a reencaminhá-lo.';

  @override
  String get actionResetPass => 'Alterar palavra-passe';

  @override
  String get informInvalidPasswordFormat => 'Introduza um formato de palavra-passe válido';

  @override
  String get labelCheckEmail => 'Verifique seu e-mail';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Enviámos uma mensagem para o e-mail $email com um link para alterar a sua palavra-passe.';
  }

  @override
  String get informResetPassByEmail => 'Vamos enviar um e-mail com as instruções para alterar a sua palavra-passe.';

  @override
  String get labelSelectCountry => 'Onde é que vive?';

  @override
  String get labelChooseCountry => 'Selecionar país';

  @override
  String get warnCountryNotAvailable => 'Infelizmente, a Deriv não está disponível no seu país.';

  @override
  String get actionNext => 'Próximo';

  @override
  String get labelEmailIssueHeader => 'Se não receber um e-mail nosso dentro de alguns minutos, é possível que:';

  @override
  String get labelEmailIssueSpam => 'O e-mail encontre-se na pasta de spam (às vezes os e-mails ficam perdidos aí).';

  @override
  String get labelEmailIssueWrongEmail => 'Acidentalmente, deu-nos outro e-mail (normalmente um e-mail de trabalho ou pessoal, em vez daquele que pretendia).';

  @override
  String get labelEmailIssueTypo => 'O e-mail que introduziu tinha um erro ou uma gralha (acontece aos melhores).';

  @override
  String get labelEmailIssueFirewall => 'Não foi possível enviar um e-mail para este endereço (normalmente devido a firewalls ou filtragem).';

  @override
  String get actionReenterEmail => 'Volte a introduzir o seu e-mail e tente novamente';

  @override
  String get labelKeepPassword => 'Mantenha a sua conta segura utilizando uma palavra-passe';

  @override
  String get labelCreatePassword => 'Criar palavra-passe';

  @override
  String get actionStartTrading => 'Começar a negociar';

  @override
  String get actionPrevious => 'Anterior';

  @override
  String get labelSignUp => 'Registe-se';

  @override
  String get labelOrSignUpWith => 'Ou registe-se através de';

  @override
  String get labelReferralInfoTitle => 'Código de referência de afiliado';

  @override
  String get infoReferralInfoDescription => 'Código alfanumérico fornecido por um afiliado Deriv, aplicável apenas para registos por e-mail.';

  @override
  String get labelGotReferralCode => 'Tem um código de referência?';

  @override
  String get labelHaveAccount => 'Já tem uma conta?';

  @override
  String get actionCreateAccount => 'Criar conta demo gratuita';

  @override
  String get informInvalidReferralCode => 'O código de referência que introduziu não é válido. Verifique e tente novamente.';

  @override
  String get labelVerifyYourEmail => 'Validar e-mail';

  @override
  String get labelThanksEmail => 'Obrigado por validar o seu e-mail';

  @override
  String get informLetsContinue => 'Vamos continuar.';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get labelSearchCountry => 'Pesquisar país';

  @override
  String informVerificationEmailSent(String email) {
    return 'Enviámos uma mensagem para o $email com o link para ativar a sua conta.';
  }

  @override
  String get actionEmailNotReceived => 'Não recebeu o e-mail?';

  @override
  String get informPasswordPolicy => 'A palavra-passe deve ter:';

  @override
  String get informPasswordPolicyLength => 'Entre 8 a 25 caracteres';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Letras maiúsculas e minúsculas';

  @override
  String get informPasswordPolicyNumber => 'Pelo menos um número';

  @override
  String get warnPasswordContainsSymbol => 'Utilize símbolos para criar uma palavra-passe forte.';

  @override
  String get labelReferralCode => 'Código de referência';

  @override
  String get actionTryAgain => 'Tente novamente';

  @override
  String get informInvalid2FACode => 'O código que introduziu não é válido. Verifique e tente novamente.';

  @override
  String get informFailedAuthentication => 'O e-mail ou a palavra-passe podem estar incorretos. Registou-se através de umas das contas das redes sociais? Verifique e tente novamente.';

  @override
  String get informDeactivatedAccount => 'A sua conta encontra-se desativada.';

  @override
  String get informFailedAuthorization => 'A autorização não foi bem-sucedida.';

  @override
  String get informInvalidResidence => 'Morada inválida.';

  @override
  String get informInvalidCredentials => 'Credenciais inválidas.';

  @override
  String get informMissingOtp => 'Falta a palavra-passe de utilização única.';

  @override
  String get informSelfClosed => 'A sua conta foi encerrada.';

  @override
  String get informUnexpectedError => 'Ocorreu um erro inesperado.';

  @override
  String get informUnsupportedCountry => 'O seu país não está disponível.';

  @override
  String get informExpiredAccount => 'A sua conta expirou';

  @override
  String get labelCountryConsentBrazil => 'Venho por este meio confirmar que iniciei o pedido de abertura de conta na Deriv para negociar produtos OTC emitidos e oferecidos exclusivamente fora do Brasil. Estou ciente que a Deriv não é regulada pela CVM e que ao abordar a Deriv, estabeleço uma relação com uma empresa estrangeira.';

  @override
  String get informConnectionError => 'Erro de ligação. Por favor, tente novamente mais tarde.';

  @override
  String get informSwitchAccountError => 'Ocorreu um erro durante a troca de conta. Tente novamente mais tarde.';

  @override
  String get labelDeveloper => 'Programador';

  @override
  String get labelEndpoint => 'Endpoint';

  @override
  String get semanticEndpoint => 'Endpoint';

  @override
  String get warnInvalidEndpoint => 'endpoint inválido';

  @override
  String get labelApplicationID => 'ID da aplicação';

  @override
  String get semanticApplicationID => 'ID da aplicação';

  @override
  String get warnInvalidApplicationID => 'ID da aplicação inválido';

  @override
  String get labelLanguage => 'Idioma';
}
