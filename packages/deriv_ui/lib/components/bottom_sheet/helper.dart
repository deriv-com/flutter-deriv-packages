import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Display a bottom sheet based on Deriv design system.
Future<T?> showDerivModalBottomSheet<T>(
  BuildContext context,
  WidgetBuilder builder, {
  bool useRootNavigator = false,
  bool showDragHandle = true,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (BuildContext context) => builder(context),
      backgroundColor: context.theme.colors.secondary,
      showDragHandle: showDragHandle,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: useRootNavigator,
    );

/// Helper method to obtain bottom sheet color, this method is usefull
/// since, we don't need to import [package:deriv_theme/deriv_theme.dart] during the invocation
Color getDerivBottomSheetBackgroundColor(BuildContext context) =>
    context.theme.colors.secondary;

/// Provides necessary design widgets as [List] so it can be embadded
/// within [Column] with more ease
List<Widget> buildDerivBottomSheetHandleWithTitle(
        BuildContext context, String title,
        {Function? onTapHandle}) =>
    <Widget>[
      GestureDetector(
        onTap: () {
          if (onTapHandle != null) {
            onTapHandle();
            return;
          }

          Navigator.pop(context);
        },
        child: SizedBox(
          height: ThemeProvider.margin24,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: ThemeProvider.margin32,
              ),
              height: ThemeProvider.margin04,
              width: ThemeProvider.margin40,
              decoration: BoxDecoration(
                color: context.theme.colors.active,
                borderRadius:
                    BorderRadius.circular(ThemeProvider.borderRadius04),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin14),
        child: Text(
          title,
          style: context.theme.textStyle(
            textStyle: TextStyles.subheading,
            color: context.theme.colors.prominent,
          ),
        ),
      )
    ];

/// This provides rounded border of [showModalBottomSheet] shape property to match with design
ShapeBorder get derivBottomSheetBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(ThemeProvider.borderRadius16),
    ));
