import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A button that allows users to continue with passkey
class ContinueWithPasskeyButton extends StatelessWidget {
  /// constructs a [ContinueWithPasskeyButton]
  const ContinueWithPasskeyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<DerivPasskeysBloc, DerivPasskeysState>(
        listener: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysErrorState) {
            if (state is NoCredentialErrorState) {
              showAlertDialog(
                context: context,
                title: context.derivPasskeysLocalizations.noPasskeyFound,
                content: Text(context
                    .derivPasskeysLocalizations.noPasskeyFoundDescription),
                positiveActionLabel: context.derivPasskeysLocalizations.ok,
                onPositiveActionPressed: () {
                  Navigator.of(context).pop();
                },
              );
            } else {
              String title = context.derivPasskeysLocalizations.unexpectedError;
              String content = state.message;
              if (state.errorCode == 'PASSKEYS_SERVICE_ERROR') {
                content = state.message;
              }
              if (state.errorCode == 'PASSKEYS_NOT_FOUND') {
                title = context.derivPasskeysLocalizations.noPasskeyFound;
                content = state.message;
              }
              //PASSKEYS_OFF
              if (state.errorCode == 'PASSKEYS_OFF') {
                title =
                    context.derivPasskeysLocalizations.passkeysOffErrorTitle;
                content = state.message;
              }
              // showDialog<String>(
              //   context: context,
              //   builder: (BuildContext context) => PopupAlertDialog(
              //     title: title,
              //     content: Text(content),
              //     positiveButtonLabel: context.derivPasskeysLocalizations.ok,
              //     onPositiveActionPressed: () {
              //       Navigator.pop(
              //           context, context.derivPasskeysLocalizations.ok);
              //     },
              //   ),
              // );
              showAlertDialog(
                context: context,
                title: title,
                content: Text(content),
                positiveActionLabel: context.derivPasskeysLocalizations.ok,
                onPositiveActionPressed: () {
                  Navigator.of(context).pop();
                },
              );
            }
          }
        },
        builder: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysNotSupportedState) {
            return const SizedBox();
          }

          return InkWell(
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
                          'Passkey',
                          style: context.theme.textStyle(
                            textStyle: TextStyles.body2,
                            color: context.theme.colors.prominent,
                          ),
                        ),
                      ],
                    ),
            ),
            onTap: () async {
              context
                  .read<DerivPasskeysBloc>()
                  .add(DerivPasskeysVerifyCredentialEvent());
            },
          );
        },
      );
}
