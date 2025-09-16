import 'deriv_passkeys_localizations.dart';

/// The translations for Portuguese (`pt`).
class DerivPasskeysLocalizationsPt extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Concluído com sucesso!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'A sua conta está agora protegida com dados biométricos. Pode fazer a gestão dos seus dados biométricos através das definições da sua conta $platformName.';
  }

  @override
  String get continueButtonText => 'Continuar';

  @override
  String get unexpectedError => 'Ocorreu um erro inesperado!';

  @override
  String get unexpectedErrorDescription => 'Por favor, tente novamente mais tarde.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'A sua chave para inícios de sessão mais seguros';

  @override
  String get enhanceSecurity => 'Utilize impressões digitais, reconhecimento facial ou outros dados biométricos para iniciar sessão de forma fácil e segura.';

  @override
  String get here => 'aqui';

  @override
  String get effortlessLogin => 'Início de sessão simplificado com dados biométricos';

  @override
  String get whatArePasskeys => 'O que são dados biométricos?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Alternativa segura às palavras-passe.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Desbloqueie a sua conta através de dados biométricos, reconhecimento facial ou introdução de PIN.';

  @override
  String get whyPasskeys => 'Por que deve utilizar dados biométricos?';

  @override
  String get whyPasskeysDescription1 => 'Protege contra o acesso não autorizado.';

  @override
  String get whyPasskeysDescription2 => 'Protege contra tentativas de phishing.';

  @override
  String get howToCreatePasskey => 'Como posso criar dados biométricos?';

  @override
  String get howToCreatePasskeyDescription1 => 'Aceda às \"Definições de conta\" na Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Selecione \"Dados biométricos\" para criar os seus dados biométricos.';

  @override
  String get p2pHowToCreatePasskey => 'Como posso criar dados biométricos?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Aceda à secção \"Perfil\" na sua aplicação Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Selecione \"Dados biométricos\" para criar os seus dados biométricos.';

  @override
  String get whereArePasskeysSaved => 'Onde são guardados os dados biométricos?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Gestor de palavras-passe do Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'O que acontece se o e-mail da minha conta Deriv for alterado?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Não tem problema! Os seus dados biométricos ainda funcionam.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Pode iniciar sessão na Deriv com os seus dados biométricos.';

  @override
  String get tips => 'Dicas';

  @override
  String get beforeUsingPasskeys => 'Antes de utilizar os dados biométricos';

  @override
  String get enableScreenLock => 'Ative o bloqueio de ecrã no seu dispositivo.';

  @override
  String get signInGoogleOrIcloud => 'Inicie sessão na sua conta Google ou iCloud.';

  @override
  String get enableBluetooth => 'Ativar Bluetooth.';

  @override
  String get noPasskeyFound => 'Não foi encontrado nenhum dado biométrico!';

  @override
  String get noPasskeyFoundDescription => 'Por favor, para utilizar esta funcionalidade crie dados biométricos.';

  @override
  String get maybeLater => 'Talvez mais tarde';

  @override
  String get effortlessLoginWithPasskeys => 'Início de sessão simplificado com dados biométricos';

  @override
  String get learnMoreAboutPasskeys => 'Saiba mais sobre os dados biométricos';

  @override
  String get noNeedToRememberPassword => 'Não memorizar a palavra-passe';

  @override
  String get useYourBiometrics => 'Segurança reforçada com dados biométricos ou bloqueio do ecrã';

  @override
  String get syncAcrossDevices => 'Sincronizar entre dispositivos';

  @override
  String get createPasskey => 'Ativar dados biométricos';

  @override
  String get unsupportedPlatform => 'Plataforma não suportada';

  @override
  String get storedOn => 'Armazenado em';

  @override
  String get lastUsed => 'Última utilização';

  @override
  String get rename => 'Alterar o nome';

  @override
  String get revoke => 'Revogar';

  @override
  String get continueTradingButtonText => 'Negociar agora';

  @override
  String get addMorePasskeysButtonText => 'Adicionar dados biométricos';

  @override
  String get unableToSetupPasskey => 'Não foi possível configurar os dados biométricos';

  @override
  String get unableToSetupPasskeyDescription => 'Ocorreu um problema ao configurar os seus dados biométricos. O processo pode ter sido interrompido ou a sessão expirou. Por favor, tente novamente.';

  @override
  String get passkeysOffErrorTitle => 'O serviço de dados biométricos não está disponível';

  @override
  String get never => 'Nunca';

  @override
  String get unable_to_process_your_request => 'Não foi possível completar o processamento do seu pedido';

  @override
  String get unable_to_process_your_request_description => 'Surgiu um problema temporário no processamento do seu pedido. Por favor, tente novamente mais tarde.';
}
