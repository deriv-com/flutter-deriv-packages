import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/utils/handle_errors_utils.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A button that allows users to continue with passkey
class ContinueWithPasskeyButton extends StatelessWidget {
  /// constructs a [ContinueWithPasskeyButton]
  const ContinueWithPasskeyButton({
    required this.onTap,
    super.key,
  });

  /// Function to handle on tap event.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<DerivPasskeysBloc, DerivPasskeysState>(
        listener: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysErrorState) {
            handlePasskeysError(context, state);
          }
        },
        builder: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysNotSupportedState) {
            return const SizedBox();
          }

          return InkWell(
            key: const Key('continueWithPasskeysButtonKey'),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: context.theme.colors.active,
                ),
              ),
              child: state is DerivPasskeysLoadingState
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoadingIndicator(
                          valueColor: context.theme.colors.prominent,
                          strokeWidth: ThemeProvider.margin02,
                          height: ThemeProvider.iconSize16,
                          width: ThemeProvider.iconSize16,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          Assets.passkeySvgIcon,
                          package: 'deriv_passkeys',
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Biometrics',
                          style: context.theme.textStyle(
                            textStyle: TextStyles.body2,
                            color: context.theme.colors.prominent,
                          ),
                        ),
                      ],
                    ),
            ),
            onTap: () async {
              onTap();
              context
                  .read<DerivPasskeysBloc>()
                  .add(DerivPasskeysVerifyCredentialEvent());
            },
          );
        },
      );
}
