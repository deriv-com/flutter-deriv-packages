import 'dart:async';

import 'package:deriv_ui/core/widgets/custom_checkbox.dart';
import 'package:deriv_ui/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

/// A popup alert dialog widget that pops up at the centre of a page and overlays
/// over its contents.
class PopupAlertDialog extends StatefulWidget {
  /// Creates a popup alert dialog that takes place at the centre of the screen
  ///
  /// The [title] of the dialog is displayed at the top of the dialog. If this
  /// value is null, the title will be ignored.
  /// The [content] of the dialog is displayed below the title of the dialog. If
  /// the title is null, [content] will be at the top of the dialog. If this
  /// value is null, the content will be ignored.
  /// [positiveButtonLabel] is the label of the action button at the most right
  /// of the dialog. [onPositiveActionPressed] is called when this button is
  /// clicked.
  ///
  /// [negativeButtonLabel] is the label of the second action button.
  /// [onNegativeActionPressed] is called when this button is clicked.
  ///
  /// All arguments are optional.
  ///
  const PopupAlertDialog({
    this.titleTextStyle,
    this.navigationButtonLabelTextStyle,
    this.title,
    this.content,
    this.showLoadingIndicator = false,
    this.positiveButtonLabel,
    this.negativeButtonLabel,
    this.onPositiveActionPressed,
    this.onNegativeActionPressed,
    this.isCheckboxVisible = false,
    this.checkboxMessage,
    this.checkBoxValue,
    this.onCheckboxValueChanged,
    this.bottomMargin,
    this.rightMargin,
    this.positiveButtonLabelTextStyle,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  /// The title of the popup alert dialog.
  final String? title;

  /// The content of the popup alert dialog.
  final Widget? content;

  /// The label of the popup alert dialog positive action button.
  final String? positiveButtonLabel;

  /// The label of the popup alert dialog negative action button.
  final String? negativeButtonLabel;

  /// Shows loading indicator if the dialog needs to perform an async action.
  final bool showLoadingIndicator;

  /// [onPositiveActionPressed] callback
  ///
  /// This callback will be called when the positive action button is visible
  /// on the screen and was tapped.
  final VoidCallback? onPositiveActionPressed;

  /// [onNegativeActionPressed] callback
  ///
  /// This callback will be called when the negative action button is visible
  /// on the screen and was tapped.
  final VoidCallback? onNegativeActionPressed;

  /// Represents if dialog has a checkbox in the content.
  final bool isCheckboxVisible;

  /// Initial value of checkbox.
  final bool? checkBoxValue;

  /// Checkbox message.
  final String? checkboxMessage;

  /// Checkbox callback whenever it's value changed.
  final Function(bool?)? onCheckboxValueChanged;

  /// TextStyle for title
  final TextStyle? titleTextStyle;

  /// TextStyle for Navigation button text label
  final TextStyle? navigationButtonLabelTextStyle;

  /// TextStyle for Positive button text label
  final TextStyle? positiveButtonLabelTextStyle;

  /// Background color of parent container
  final Color? backgroundColor;

  /// Loading Indicator bottom margin
  final double? bottomMargin;

  /// Loading Indicator right margin
  final double? rightMargin;

  @override
  _PopupAlertDialogState createState() => _PopupAlertDialogState();
}

class _PopupAlertDialogState extends State<PopupAlertDialog> {
  static const int _durationOfRetrySpinnerInSeconds = 15;

  Timer? _loadingTimer;
  late bool _shouldShowLoadingIndicator;
  late bool? _checkboxValue;

  @override
  void initState() {
    super.initState();

    _shouldShowLoadingIndicator = false;
    _checkboxValue = widget.checkBoxValue;
  }

  @override
  void dispose() {
    _stopConnectivityTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: widget.backgroundColor,
        title: widget.title == null
            ? null
            : Text(
                widget.title!,
                style: widget.titleTextStyle,
              ),
        content: widget.content == null
            ? null
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.content ?? const SizedBox.shrink(),
                  if (widget.isCheckboxVisible)
                    CustomCheckbox(
                      message: widget.checkboxMessage ?? '',
                      value: _checkboxValue,
                      onValueChanged: (bool? newValue) {
                        setState(() => _checkboxValue = newValue);
                        widget.onCheckboxValueChanged?.call(newValue);
                      },
                    )
                ],
              ),
        actions: <Widget>[
          if (widget.negativeButtonLabel != null)
            TextButton(
              child: Text(
                widget.negativeButtonLabel!.toUpperCase(),
                style: widget.navigationButtonLabelTextStyle,
              ),
              onPressed: widget.onNegativeActionPressed,
            ),
          Container(
            margin: EdgeInsets.only(
              bottom: widget.bottomMargin ?? 0,
              right: widget.rightMargin ?? 0,
            ),
            child: Visibility(
              visible: _shouldShowLoadingIndicator,
              child: const LoadingIndicator(
                brandCoralColor: Colors.transparent,
              ),
            ),
          ),
          if (widget.positiveButtonLabel != null)
            Visibility(
              visible: !_shouldShowLoadingIndicator,
              child: TextButton(
                child: Text(
                  widget.positiveButtonLabel!.toUpperCase(),
                  style: widget.positiveButtonLabelTextStyle,
                ),
                onPressed: () {
                  if (widget.showLoadingIndicator) {
                    _startConnectivityTimer();
                  }

                  widget.onPositiveActionPressed?.call();
                },
              ),
            ),
        ],
      );

  void _startConnectivityTimer() {
    setState(() => _shouldShowLoadingIndicator = true);

    if (_loadingTimer == null || !_loadingTimer!.isActive) {
      _loadingTimer = Timer.periodic(
          const Duration(seconds: _durationOfRetrySpinnerInSeconds),
          (Timer timer) async {
        _stopConnectivityTimer();

        setState(() => _shouldShowLoadingIndicator = false);
      });
    }
  }

  void _stopConnectivityTimer() => _loadingTimer?.cancel();
}
