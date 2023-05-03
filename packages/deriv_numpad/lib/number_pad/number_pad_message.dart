part of 'number_pad.dart';

class _NumberPadMessage extends StatelessWidget {
  const _NumberPadMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numberPadProvider =
        _NumberPadProvider.of(context);

    return _NumberPadAnimatedMessage(
      animationDuration: const Duration(milliseconds: 800),
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.only(
          bottom: ThemeProvider.margin08,
          left: ThemeProvider.margin16,
          right: ThemeProvider.margin16,
        ),
        child: Text(
          message,
          style: numberPadProvider!.isAllInputsValid()
              ? context.theme.textStyle(
                  textStyle: TextStyles.caption,
                  color: context.theme.base04Color,
                )
              : context.theme.textStyle(
                  textStyle: TextStyles.captionBold,
                  color: context.theme.brandCoralColor,
                ),
        ),
      ),
    );
  }
}
