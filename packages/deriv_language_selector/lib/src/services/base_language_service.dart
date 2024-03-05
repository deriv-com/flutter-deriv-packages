import 'package:deriv_ui/deriv_ui.dart';

abstract class BaseLanguageService {
  Future<List<LanguageModel>> getActiveLanguages();

  Future<void> loadAndSetLanguage(LanguageModel language);

  void reconnectToServerWithNewLanguage(LanguageModel language);

  Future<LanguageModel> getCurrentLanguage();
}
