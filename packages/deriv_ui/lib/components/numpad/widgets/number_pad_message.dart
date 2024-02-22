part of 'number_pad.dart';

class _NumberPadMessage extends StatelessWidget {
  const _NumberPadMessage({
    this.message,
    this.messageText,
  }) : assert(message != null || messageText != null);

  final RichText? messageText;
  final String? message;

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
        child: messageText != null
            ? messageText!
            : Text(
                message!,
                style: numberPadProvider!.isAllInputsValid()
                    ? context.theme.textStyle(
                        textStyle: TextStyles.caption,
                        color: context.theme.colors.disabled,
                      )
                    : context.theme.textStyle(
                        textStyle: TextStyles.captionBold,
                        color: context.theme.colors.coral,
                      ),
              ),
      ),
    );
  }
}
