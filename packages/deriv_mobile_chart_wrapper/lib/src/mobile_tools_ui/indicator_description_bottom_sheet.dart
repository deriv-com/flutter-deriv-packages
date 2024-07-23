import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class IndicatorDescriptionBottomSheet extends StatelessWidget {
  const IndicatorDescriptionBottomSheet({
    super.key,
    required this.indicatorTitle,
    required this.indicatorDescription,
  });

  final String indicatorTitle;
  final String indicatorDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeProvider.margin16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            context: context,
            indicatorTitle: indicatorTitle,
          ),
          Expanded(child: Text(indicatorDescription)),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeProvider.margin16,
            ),
            child: PrimaryButton(
                child: Center(
                  child: Text(
                    'Add indicator',
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body2,
                      color: context.theme.colors.prominent,
                    ),
                  ),
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(
          {required BuildContext context, required String indicatorTitle}) =>
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_outlined),
            Expanded(
              child: Text(
                indicatorTitle,
                style: context.theme.textStyle(
                  textStyle: TextStyles.subheading,
                  color: context.theme.colors.prominent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: ThemeProvider.margin20),
          ],
        ),
      );
}
