import 'package:flutter/material.dart';

/// A loading indicator widget that can be of type circular or linear
class LoadingIndicator extends StatelessWidget {
  /// Creates a circular progress indicator that takes place at the centre of the screen if
  /// [isCircular] is true otherwise it creates a linear progress indicator at
  /// the top of the screen. There are two kinds of progress indicators:
  ///
  ///  * Determinate progress indicators that have a specific value at
  ///    each point in time, and the value should increase monotonically from 0.0
  ///    to 1.0, at which time the indicator is complete. To create a determinate
  ///    progress indicator, pass a non-null [value] between 0.0 and 1.0.
  ///  * Indeterminate progress indicators that do not have a specific
  ///    value at each point in time and instead indicate that progress is being
  ///    made without indicating how much progress remains. To create an
  ///    indeterminate progress indicator, pass a null [value].
  ///
  /// [valueColor] is the color of the progress indicator, both circular
  /// and linear whereas [backgroundColor] is the color of the background where
  /// the loader is spinning.
  ///
  /// [isCircular] is optional and have a default value of true
  /// [backgroundColor] is optional and have a default value of `Colors.transparent`
  ///
  const LoadingIndicator({
    required this.brandCoralColor,
    this.backgroundColor = Colors.transparent,
    this.valueColor,
    this.isCircular = true,
    this.value,
    this.strokeWidth = 4,
    this.height,
    this.width,

    Key? key,
  }) : super(key: key);

  /// Color of the loader background
  ///
  /// This defaults to Colors.transparent
  final Color? backgroundColor;

  /// Color of the progress indicator both circular and linear
  final Color? valueColor;

  /// To determine if the loader should be circular or linear
  ///
  /// This defaults to true
  final bool isCircular;

  /// A value of the progress at each point of time
  final double? value;

  /// Thikness of the circular loading indicator
  ///
  /// This defaults to 4 pixels
  final double strokeWidth;

  /// Height of the progress indicators
  final double? height;

  /// Width of the progress indicator
  final double? width;
  
  /// Width of the progress indicator
  final Color brandCoralColor;

  @override
  Widget build(BuildContext context) => isCircular
      ? ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? double.infinity,
            maxWidth: width ?? double.infinity,
          ),
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              valueColor == null ? brandCoralColor : valueColor!,
            ),
            backgroundColor: backgroundColor ?? Colors.transparent,
            value: value,
          ),
        )
      : LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            valueColor == null ? brandCoralColor : valueColor!,
          ),
          backgroundColor: backgroundColor ?? Colors.transparent,
          value: value,
        );
}
