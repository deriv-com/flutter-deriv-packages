part of 'number_pad.dart';

class _NumberPadMessage extends StatelessWidget {
  const _NumberPadMessage(
      {required this.message,
       this.validTextStyle,
       this.inValidTextStyle,
      this.padding});

  final String message;
  final EdgeInsetsGeometry? padding;
  final TextStyle? validTextStyle;
  final TextStyle? inValidTextStyle;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numberPadProvider =
        _NumberPadProvider.of(context);

    return _NumberPadAnimatedMessage(
      animationDuration: const Duration(milliseconds: 800),
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 200),
        padding: padding,
        child: Text(
          message,
          style: numberPadProvider!.isAllInputsValid()
              ? validTextStyle
              : inValidTextStyle,
        ),
      ),
    );
  }
}
