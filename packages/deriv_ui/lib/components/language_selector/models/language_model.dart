/// LanguageItem model
class LanguageModel {
  /// Constructor for LanguageItem
  LanguageModel({
    required this.name,
    required this.code,
    required this.flag,
    this.countryCode = '',
  });

  /// Name of the language
  final String name;

  /// Code of the language. Example: en, id, zh, etc.
  final String code;

  /// Path to flag of the language. Example: 🇬🇧, 🇮🇩, 🇨🇳, etc.
  final String flag;

  /// Languages like Chinese has subvariant CN & TW, in this
  /// case to identify the exact local we need country code.
  final String countryCode;

  /// This is the extended code to identify Languages that
  /// have sub-variants Example: zh-CN, zh-TW. If there is
  /// any country code, we show an extended version,
  /// otherwise we show just the locale code.
  String get extendedCode =>
      countryCode.isNotEmpty ? '$code-$countryCode' : code;
}
