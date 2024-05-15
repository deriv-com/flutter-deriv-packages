import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

/// Success pass change page layout.
class DerivSuccessPassChangeLayout extends StatelessWidget {
  /// Initializes success pass change page.
  const DerivSuccessPassChangeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(
            context.localization.labelResetPassword,
            style: TextStyles.title,
          ),
        ),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: ThemeProvider.margin16,
                  width: ThemeProvider.margin16,
                  child: LoadingIndicator(
                    valueColor: Colors.white,
                    strokeWidth: 2.5,
                  ),
                ),
                const SizedBox(
                  height: ThemeProvider.margin16,
                ),
                Text(
                  context.localization.informYourPassHasBeenReset,
                  style: TextStyles.title,
                ),
                const SizedBox(
                  height: ThemeProvider.margin08,
                ),
                Text(
                  context.localization.informRedirectLogin,
                  textAlign: TextAlign.center,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.general,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
