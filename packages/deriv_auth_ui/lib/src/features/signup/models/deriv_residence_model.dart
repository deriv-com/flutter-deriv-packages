import 'package:equatable/equatable.dart';

/// Residence model.
class DerivResidenceModel extends Equatable {
  /// Constructor for residence model.
  const DerivResidenceModel({
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

  @override
  List<Object?> get props => <Object?>[isDisabled, name, code];
}
