import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:deriv_ui/widgets/app_setting_gesture_detector.dart';
import 'package:deriv_ui/widgets/custom_image.dart';
import 'package:deriv_ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

/// A widget to display messages in a form of warnings, information, or any
/// type of details at the centre of the page.
class FullscreenMessage extends StatelessWidget {
  /// It consists of an [iconData] followed by a [title].
  ///
  /// In addition, it has a [description] to pass extra details and an [actionLabel]
  /// which acts as label for an action button and determines its visibility;
  /// not passing an [actionLabel] will result in not showing a button,
  /// otherwise, the button will take place and clicking it triggers
  /// [onPressed] callback.
  ///
  /// All arguments are optional and can be ignored.
  const FullscreenMessage({
    this.onTapNavigation,
    this.title,
    this.titleWidget,
    this.iconSemanticLabel,
    this.iconData,
    this.description,
    this.actionLabel,
    this.shouldShowLoadingIndicator = false,
    this.isAppSettingGestureDetectorEnabled = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  /// The icon details that contains the path of the icon from assets, and its
  /// width and height.
  final CustomIconData? iconData;

  /// The value indicates the purpose of the picture, and will be read out by screen readers.
  final String? iconSemanticLabel;

  /// Title or the main content of the Fullscreen widget.
  final String? title;

  /// A custom widget shown as the title.
  final Widget? titleWidget;

  /// Description or extra contents of any length.
  final String? description;

  /// Label of a button that can be displayed if needed.
  final String? actionLabel;

  /// Determines if a loading indicator should appear in place of button.
  /// The default value is `false`.
  final bool shouldShowLoadingIndicator;

  /// Enables app setting gesture detector.
  /// The default value is `false`.
  final bool isAppSettingGestureDetectorEnabled;

  /// The navigation Function after the clicks
  final Function? onTapNavigation;

  /// [onPressed] callback
  ///
  /// This callback will be called when an action button is visible on the screen
  /// and was tapped.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (iconData?.icon != null && iconData!.icon.isNotEmpty)
              AppSettingGestureDetector(
                child: CustomImage(
                    iconData: iconData!, semanticLabel: iconSemanticLabel),
                enable: isAppSettingGestureDetectorEnabled,
                onTapNavigation: () {
                  if (onTapNavigation != null) {
                    onTapNavigation!();
                  }
                },
              ),
            const SizedBox(height: ThemeProvider.margin16),
            if ((title != null && title!.isNotEmpty) || titleWidget != null)
              Padding(
                padding: const EdgeInsets.only(bottom: ThemeProvider.margin16),
                child: titleWidget == null
                    ? Text(
                        title!,
                        style: context.theme.textStyle(
                          textStyle: TextStyles.title,
                          color: context.theme.colors.prominent,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : titleWidget!,
              ),
            if (description != null && description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: ThemeProvider.margin40,
                ),
                child: Text(
                  description!,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.disabled,
                  ),
                ),
              ),
            if (shouldShowLoadingIndicator)
              const Padding(
                padding: EdgeInsets.all(ThemeProvider.margin08),
                child: SizedBox(
                  child: LoadingIndicator(),
                  height: ThemeProvider.margin32,
                  width: ThemeProvider.margin32,
                ),
              ),
            if (_isActionButtonVisible())
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    context.theme.colors.coral,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(ThemeProvider.margin08),
                  child: Text(
                    actionLabel!.toUpperCase(),
                    style:
                        context.theme.textStyle(textStyle: TextStyles.button),
                  ),
                ),
                onPressed: onPressed,
              )
          ],
        ),
      );

  bool _isActionButtonVisible() =>
      actionLabel != null &&
      actionLabel!.isNotEmpty &&
      !shouldShowLoadingIndicator;
}
