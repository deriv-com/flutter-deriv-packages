/// Holds required information of a password policy.
class DerivPasswordPolicyModel {
  /// Initializes [DerivPasswordPolicyModel].
  DerivPasswordPolicyModel({
    required this.description,
    required this.regex,
    this.isOptional = false,
  });

  /// Describes restrictions of this policy.
  final String description;

  /// Holds `Regex` data of the policy.
  final RegExp regex;

  /// Indicates whether this policy is optional or not.
  final bool isOptional;

  /// Checks [pass] to see if it matches with this policy.
  bool isMatchWith(String pass) => regex.hasMatch(pass);
}
