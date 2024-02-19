import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Circular',
  type: LoadingIndicator,
)
Widget loadingIndicatorUseCase(BuildContext context) {
  return const LoadingIndicator();
}

@UseCase(
  name: 'Linear',
  type: LoadingIndicator,
)
Widget linearLoadingIndicatorUseCase(BuildContext context) {
  return const LoadingIndicator(
    isCircular: false,
  );
}
