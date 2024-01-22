import 'package:deriv_passkeys/presentation/constants/assets.dart';
import 'package:deriv_passkeys/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A button that allows users to continue with passkey
class ContinueWithPasskeyButton extends StatefulWidget {
  /// constructs a [ContinueWithPasskeyButton]
  const ContinueWithPasskeyButton({super.key});

  @override
  State<ContinueWithPasskeyButton> createState() =>
      _ContinueWithPasskeyButtonState();
}

class _ContinueWithPasskeyButtonState extends State<ContinueWithPasskeyButton> {
  @override
  void initState() {
    super.initState();
    context.read<DerivPasskeysBloc>().add(const DerivPasskeysInit());
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DerivPasskeysBloc, DerivPasskeysState>(
        builder: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysNotSupported) {
            return const SizedBox();
          }
          if (state is DerivPasskeysError) {
            // TODO(bassam-deriv): Handle error
          }
          return SecondaryButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  Assets.passkeySvgIcon,
                  package: 'deriv_passkeys',
                ),
                const SizedBox(width: 8),
                Text(
                  'Continue with Passkey',
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.prominent,
                  ),
                ),
              ],
            ),
            onPressed: () async {
              context
                  .read<DerivPasskeysBloc>()
                  .add(DerivPasskeysGetCredential());
            },
          );
        },
      );
}
