import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Stacked banner',
  type: StackedBanner,
)
Widget stackedBannerUseCase(BuildContext context) {
  return StackedBanner(
    collapsedItemsKey: GlobalKey(),
    collapseButtonBuilder: (BuildContext context) => Container(
      alignment: Alignment.center,
      height: ThemeProvider.margin32,
      decoration: BoxDecoration(
        color: bannerButtonColor,
        borderRadius: BorderRadius.circular(
          ThemeProvider.borderRadius04,
        ),
      ),
      child: Text(
        context.knobs
            .string(label: 'Collapse Button Label', initialValue: 'Collapse'),
      ),
    ),
    controller: StackedBannerController(),
    onDismissed: () {},
    isExpanded: ({required bool isExpanded}) {},
  );
}
