import 'deriv_passkeys_localizations.dart';

/// The translations for Portuguese (`pt`).
class DerivPasskeysLocalizationsPt extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Concluído com sucesso!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'A sua conta está agora protegida com uma chave de acesso. Pode fazer a gestão da sua chave de acesso através das definições da sua conta $platformName.';
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
  String get experienceSaferLogins => 'Experimente inícios de sessão mais seguros';

  @override
  String get enhanceSecurity => 'Segurança reforçada à distância de um clique.';

  @override
  String get here => 'aqui';

  @override
  String get effortlessLogin => 'Início de sessão simplificado com as chaves de acesso';

  @override
  String get whatArePasskeys => 'O que são chaves de acesso?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Alternativa segura às palavras-passe.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Desbloqueie a sua conta com a mesma facilidade que desbloqueia o seu telemóvel - seja através de biometria, reconhecimento facial ou introdução de PIN.';

  @override
  String get whyPasskeys => 'Porque é que se utilizam chaves de acesso?';

  @override
  String get whyPasskeysDescription1 => 'Camada de segurança adicional.';

  @override
  String get whyPasskeysDescription2 => 'Protege contra o acesso não autorizado e phishing.';

  @override
  String get howToCreatePasskey => 'Como criar uma chave de acesso?';

  @override
  String get howToCreatePasskeyDescription1 => 'Aceda às \"Definições de conta\" na Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Pode criar uma passkey por dispositivo.';

  @override
  String get p2pHowToCreatePasskey => 'Como pode criar uma passkey?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Aceda à secção \"Perfil\" na sua aplicação Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Selecione \"Passkeys\" para criar a sua chave de acesso.';

  @override
  String get whereArePasskeysSaved => 'Onde são guardadas as chaves de acesso?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Gestor de palavras-passe do Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'O que acontece se o e-mail da minha conta Deriv for alterado?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Não tem problema! A sua passkey ainda funciona.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Inicie sessão na Deriv com a sua passkey.';

  @override
  String get tips => 'Dicas';

  @override
  String get beforeUsingPasskeys => 'Antes de utilizar as chaves de acesso';

  @override
  String get enableScreenLock => 'Ative o bloqueio de ecrã no seu dispositivo.';

  @override
  String get signInGoogleOrIcloud => 'Inicie sessão na sua conta Google ou iCloud.';

  @override
  String get enableBluetooth => 'Ativar Bluetooth.';

  @override
  String get noPasskeyFound => 'Não foi encontrada nenhuma chave de acesso!';

  @override
  String get noPasskeyFoundDescription => 'Por favor, crie uma chave de acesso para utilizar esta funcionalidade.';

  @override
  String get maybeLater => 'Talvez mais tarde';

  @override
  String get effortlessLoginWithPasskeys => 'Início de sessão simplificado com as chaves de acesso';

  @override
  String get learnMoreAboutPasskeys => 'Saiba mais sobre as chaves de acesso';

  @override
  String get noNeedToRememberPassword => 'Não memorizar a palavra-passe';

  @override
  String get useYourBiometrics => 'Segurança reforçada com dados biométricos ou bloqueio do ecrã';

  @override
  String get syncAcrossDevices => 'Sincronizar entre dispositivos';

  @override
  String get createPasskey => 'Criar passkey';

  @override
  String get unsupportedPlatform => 'Plataforma não suportada';

  @override
  String get storedOn => 'Armazenado em';

  @override
  String get lastUsed => 'Última utilização';

  @override
  String get rename => 'Renomear';

  @override
  String get revoke => 'Revogar';

  @override
  String get continueTradingButtonText => 'Continuar a negociar';

  @override
  String get addMorePasskeysButtonText => 'Adicionar mais passkeys';

  @override
  String get unableToSetupPasskey => 'Não é possível configurar a passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Houve um problema ao configurar a sua passkey. O processo pode ter sido interrompido ou a sessão expirou. Por favor, tente novamente.';

  @override
  String get passkeysOffErrorTitle => 'O serviço de Passkeys não está disponível';

  @override
  String get never => 'Nunca';

  @override
  String get unable_to_process_your_request => 'Não foi possível completar o processamento do seu pedido';

  @override
  String get unable_to_process_your_request_description => 'Surgiu um problema temporário no processamento do seu pedido. Por favor, tente novamente mais tarde.';
}
