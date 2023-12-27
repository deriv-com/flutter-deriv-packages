import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/features/signup/models/deriv_password_policy_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// A widget for checking alignment of entered password with list of policies.
///
/// It accepts [TextEditingController] for password instead of [String],
/// So it can also update itself on text changes.
class PasswordPolicyCheckerWidget extends StatelessWidget {
  /// Initializes [PasswordPolicyCheckerWidget].
  const PasswordPolicyCheckerWidget({
    required this.passwordController,
    required this.policies,
    Key? key,
  }) : super(key: key);

  /// Controller of the password.
  final TextEditingController passwordController;

  /// List of policies to be applied for the password.
  final List<DerivPasswordPolicyModel> policies;

  /// Filters [policies] and returns the required ones.
  List<DerivPasswordPolicyModel> get requiredPolicies => policies
      .where((DerivPasswordPolicyModel policy) => !policy.isOptional)
      .toList();

  /// Filters [policies] and returns the optionals ones.
  List<DerivPasswordPolicyModel> get optionalPolicies => policies
      .where((DerivPasswordPolicyModel policy) => policy.isOptional)
      .toList();

  /// Current state of password.
  String get password => passwordController.text;

  /// Returns all deriv password policies.
  static List<DerivPasswordPolicyModel> getDerivPasswordPolicies(
          BuildContext context) =>
      <DerivPasswordPolicyModel>[
        DerivPasswordPolicyModel(
          description: context.localization.informPasswordPolicyLength,
          regex: validPasswordLengthRegex,
        ),
        DerivPasswordPolicyModel(
          description: context.localization.informPasswordPolicyLowerAndUpper,
          regex: validPasswordWithUppercaseRegex,
        ),
        DerivPasswordPolicyModel(
          description: context.localization.informPasswordPolicyNumber,
          regex: validPasswordWithNumberRegex,
        ),
        DerivPasswordPolicyModel(
          description: context.localization.warnPasswordContainsSymbol,
          regex: validPasswordWithSymbols,
          isOptional: true,
        ),
      ];

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: passwordController,
      builder: (BuildContext context, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                context.localization.informPasswordPolicy,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body1,
                  color: context.theme.colors.general,
                ),
              ),
              const SizedBox(height: ThemeProvider.margin04),
              _buildPolicyList(requiredPolicies),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: ThemeProvider.margin08),
                child: Divider(),
              ),
              _buildPolicyList(optionalPolicies)
            ],
          ));

  Widget _buildPolicyList(List<DerivPasswordPolicyModel> policies) =>
      ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) =>
            _buildPolicyItem(policies[index]),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: ThemeProvider.margin04),
        itemCount: policies.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      );

  Widget _buildPolicyItem(DerivPasswordPolicyModel policy) => Builder(
        builder: (BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPolicyIcon(context: context, policy: policy),
            Expanded(
                child: Text(
              policy.description,
              style: _buildPolicyTextStyle(context, policy),
            ))
          ],
        ),
      );

  TextStyle _buildPolicyTextStyle(
          BuildContext context, DerivPasswordPolicyModel policy) =>
      context.theme.textStyle(
        textStyle: TextStyles.body1,
        color: policy.isMatchWith(password)
            ? context.theme.colors.hover
            : context.theme.colors.general,
      );

  Widget _buildPolicyIcon({
    required BuildContext context,
    required DerivPasswordPolicyModel policy,
  }) {
    if (policy.isOptional) {
      return const SizedBox();
    }

    final IconData iconData =
        policy.isMatchWith(password) ? Icons.check : Icons.circle;

    final Color color = policy.isMatchWith(password)
        ? context.theme.colors.general
        : context.theme.colors.coral;

    return Padding(
      padding: const EdgeInsets.only(
          right: ThemeProvider.margin12, top: ThemeProvider.margin04),
      child: Icon(iconData, size: ThemeProvider.iconSize8, color: color),
    );
  }
}
