import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/custom_draggable_sheet.dart';
import 'package:deriv_ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

/// Bottom sheet widget based on `Deriv` design system.
class DerivBottomSheet extends StatefulWidget {
  /// Creates a bottom sheet container for [child].
  const DerivBottomSheet({
    required this.child,
    required this.title,
    Key? key,
    this.showBackButton = false,
    this.hasActionButton = false,
    this.actionButtonLabel,
    this.onActionButtonPressed,
    this.color,
    this.onDispose,
    this.topHandleKey,
  }) : super(key: key);

  /// Body of bottom sheet container.
  final Widget child;

  /// Title of the bottom sheet.
  final String title;

  /// Whether to show back button in the header.
  final bool showBackButton;

  /// Whether to show action button at the bottom of the sheet.
  final bool hasActionButton;

  /// Label of the action button.
  final String? actionButtonLabel;

  /// Callback when the action button is pressed.
  final VoidCallback? onActionButtonPressed;

  /// Color of the bottom sheet.
  final Color? color;

  /// Callback when the sheet is disposed.
  final Function? onDispose;

  /// Key for bottom sheet top handle.
  final Key? topHandleKey;

  @override
  _DerivBottomSheetState createState() => _DerivBottomSheetState();
}

class _DerivBottomSheetState extends State<DerivBottomSheet> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => CustomDraggableSheet(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Material(
            elevation: 8,
            color: widget.color ?? context.theme.colors.secondary,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTopHandle(),
                _buildHeader(
                  context: context,
                  title: widget.title,
                ),
                Flexible(child: widget.child),
                if (widget.hasActionButton)
                  ColoredBox(
                    color: context.theme.colors.primary,
                    child: Divider(
                      indent: 0,
                      height: 0,
                      color: context.theme.colors.active,
                      thickness: 1,
                    ),
                  ),
                if (widget.hasActionButton) _buildActionButton(context)
              ],
            ),
          ),
        ),
        onDispose: widget.onDispose,
      );

  Widget _buildTopHandle() => Container(
        key: widget.topHandleKey,
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin08),
        width: double.infinity,
        child: Center(
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: context.theme.colors.active,
              borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
            ),
          ),
        ),
      );

  Widget _buildHeader({required BuildContext context, required String title}) =>
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin16,
          horizontal: ThemeProvider.margin16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.showBackButton)
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                  )),
            Expanded(
              child: Text(
                title,
                style: context.theme.textStyle(
                  textStyle: TextStyles.subheading,
                  color: context.theme.colors.prominent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (widget.showBackButton)
              const SizedBox(width: ThemeProvider.margin20),
          ],
        ),
      );

  Widget _buildActionButton(BuildContext context) => ColoredBox(
        color: context.theme.colors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: ThemeProvider.margin16,
            horizontal: ThemeProvider.margin20,
          ),
          child: PrimaryButton(
            onPressed: widget.onActionButtonPressed,
            child: Center(
              child: Text(
                widget.actionButtonLabel!,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body2,
                  color: context.theme.colors.prominent,
                ),
              ),
            ),
          ),
        ),
      );
}
