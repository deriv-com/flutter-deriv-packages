import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A [Container] with borders that change color from green to `base06` when
/// [selected] is set to `true`.
///
/// When not selected, the borders don't change color, they keep their dark
/// blue(`base06`) color.
class GlowingContainer extends StatelessWidget {
  /// Initializes a new [GlowingContainer].
  const GlowingContainer({
    required this.child,
    this.selected = false,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = ThemeProvider.borderRadius08,
    Key? key,
  }) : super(key: key);

  /// The child that is shown inside the widget.
  final Widget child;

  /// Indicates if the widget is in selected states to draw a greenish color
  /// border around its container.
  final bool selected;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsetsGeometry padding;

  /// Container margin.
  final EdgeInsetsGeometry margin;

  /// Widget border radius
  ///
  /// default is 8;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => selected
      ? TweenAnimationBuilder<Color?>(
          curve: Curves.elasticIn,
          tween: ColorTween(
            begin: context.theme.colors.blue,
            end: context.theme.colors.active,
          ),
          duration: const Duration(milliseconds: 2000),
          builder: (BuildContext _, Color? color, Widget? child) =>
              _buildContainer(color!),
        )
      : _buildContainer(context.theme.colors.active);

  Widget _buildContainer(Color color) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: color),
        ),
        margin: margin,
        child: child,
        padding: padding,
      );
}
