import 'package:flutter/material.dart';
import 'package:deriv_theme/deriv_theme.dart';

/// Information banner used to display information to the user.
class InfoBanner extends StatelessWidget {
  /// Initializes [InfoBanner].
  const InfoBanner({
    required this.message,
    this.onClose,
    Key? key,
  }) : super(key: key);

  /// Message to be displayed.
  final String message;

  /// This callback will be called when the user click on the close banner icon.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
          vertical: ThemeProvider.margin08,
        ),
        decoration: BoxDecoration(
          color: context.theme.colors.information.withOpacity(0.24),
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.info_outline,
              color: context.theme.colors.information,
              size: ThemeProvider.iconSize24,
            ),
            const SizedBox(width: ThemeProvider.margin08),
            Expanded(
              child: Text(
                message,
                style: TextStyles.overline,
              ),
            ),
            if (onClose != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: ThemeProvider.margin08,
                ),
                child: GestureDetector(
                  onTap: onClose,
                  child: Icon(
                    Icons.close,
                    color: context.theme.colors.prominent,
                    size: ThemeProvider.iconSize16,
                  ),
                ),
              ),
          ],
        ),
      );
}
