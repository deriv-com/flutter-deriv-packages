import 'package:equatable/equatable.dart';

class DerivResidenceModel extends Equatable {
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

  @override
  List<Object?> get props => [isDisabled, name, code];
}
