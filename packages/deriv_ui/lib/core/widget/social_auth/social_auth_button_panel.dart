import 'package:deriv_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/enums.dart';

/// Panel of buttons for social authentication.
class SocialAuthButtonPanel extends StatelessWidget {
  /// Initializes [SocialAuthButtonPanel].
  const SocialAuthButtonPanel({this.onPressed, Key? key}) : super(key: key);

  /// onPressed callback for social auth buttons.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSocialAuthButton(SocialAuthType.apple),
          const SizedBox(width: ThemeProvider.margin24),
          _buildSocialAuthButton(SocialAuthType.google),
          const SizedBox(width: ThemeProvider.margin24),
          _buildSocialAuthButton(SocialAuthType.facebook),
        ],
      );

  Widget _buildSocialAuthButton(SocialAuthType socialAuthType) => IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => _onPressed(socialAuthType),
        iconSize: ThemeProvider.iconSize40,
        icon: SvgPicture.asset(
          _getSocialMediaIcon(socialAuthType),
        ),
      );

  String _getSocialMediaIcon(SocialAuthType socialAuthType) =>
      'assets/icons/ic_${socialAuthType.name}.svg';

  Future<void>? _onPressed(SocialAuthType socialAuthType) {
    // trackAdjustEvent(adjustEventVirtualSignupStarted,
    //     callbackParameters: <String, String>{
    //       'signup_provider': socialAuthType.name,
    //     });
    //
    // fetchSocialAuthConnectionToken(
    //   socialAuthType: socialAuthType,
    //   onConnectionTokenFetched: (String oneAllConnectionToken) {
    //     _onConnectionTokenFetched(
    //       oneAllConnectionToken: oneAllConnectionToken,
    //       socialAuthType: socialAuthType,
    //     );
    //   },
    // );
  }

  void _onConnectionTokenFetched({
    required String oneAllConnectionToken,
    required SocialAuthType socialAuthType,
  }) {
    onPressed?.call();

    // BlocManager.instance.fetch<LoginCubit>().initializeSocialLogin(
    //       oneAllConnectionToken: oneAllConnectionToken,
    //       onAccountsFetched: (List<AccountModel> accounts) {
    //         if (accounts.isNotEmpty && hasVRAccount(accounts)) {
    //           final AccountModel? vrAccount = getVRAccount(accounts);
    //
    //           trackAdjustEvent(
    //             adjustEventVirtualSignupDone,
    //             callbackParameters: <String, String>{
    //               'signup_provider': socialAuthType.name,
    //               'binary_user_id': vrAccount!.userId?.toString() ?? ' ',
    //               'loginid': vrAccount.accountId
    //             },
    //           );
    //         }
    //       },
    //     );
  }
}
