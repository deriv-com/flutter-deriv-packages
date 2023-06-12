class DerivResidenceModel {
  DerivResidenceModel({
    required this.isDisabled,
    required this.name,
    required this.code,
  });

  /// Disabled.
  final bool isDisabled;

  /// Country full name.
  final String name;

  /// 2-letter country code.
  final String code;
}
