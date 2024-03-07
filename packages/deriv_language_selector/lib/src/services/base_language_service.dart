import 'package:deriv_ui/deriv_ui.dart';

abstract class BaseLanguageService {
  Future<void> getActiveLanguages({bool isStream = false});

  Future<void> loadAndSetLanguage(LanguageModel language);

  void reconnectToServerWithNewLanguage(LanguageModel language);

  Future<LanguageModel> getCurrentLanguage();
}
