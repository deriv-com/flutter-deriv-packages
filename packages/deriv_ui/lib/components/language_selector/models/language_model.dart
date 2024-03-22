/// LanguageItem model
class LanguageModel {
  /// Constructor for LanguageItem
  LanguageModel({required this.name, required this.code, required this.flag});

  /// Name of the language
  final String name;

  /// Code of the language. Example: en, id, zh, etc.
  final String code;

  /// Path to flag of the language. Example: 🇬🇧, 🇮🇩, 🇨🇳, etc.
  final String flag;
}
