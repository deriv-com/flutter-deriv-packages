import 'deriv_passkeys_localizations.dart';

/// The translations for English (`en`).
class DerivPasskeysLocalizationsEn extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get passkey_created_success_title => 'Success!';

  @override
  String passkey_created_success_message(String platformName) {
    return 'Your account is now secured with a passkey. Manage your passkey through your $platformName account settings.';
  }
}
