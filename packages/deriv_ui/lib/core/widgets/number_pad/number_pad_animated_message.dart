part of 'number_pad.dart';

class _NumberPadAnimatedMessage extends StatefulWidget {
  const _NumberPadAnimatedMessage({
    this.child,
    this.animationDuration = const Duration(milliseconds: 400),
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final Duration animationDuration;

  @override
  State<StatefulWidget> createState() => _NumberPadAnimatedMessageState();
}

class _NumberPadAnimatedMessageState extends State<_NumberPadAnimatedMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final Tween<double> _tween = Tween<double>(begin: 0.75, end: 1);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _scaleAnimation = _tween.animate(_scaleAnimation);

    _controller
      ..addListener(() => setState(() {}))
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      );
}
