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
