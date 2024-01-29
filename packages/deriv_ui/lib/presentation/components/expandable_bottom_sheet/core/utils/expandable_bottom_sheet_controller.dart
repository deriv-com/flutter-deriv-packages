part of '../../presentation/widgets/expandable_bottom_sheet.dart';

/// Expandable bottom sheet controller
class ExpandableBottomSheetController {
  /// Expandable bottomSheet controller initializer.
  ExpandableBottomSheetController({this.animationController});

  /// Expandable bottomSheet animation controller.
  AnimationController? animationController;

  /// Used for enabling/disabling touch events for lower part of [ExpandableBottomSheet].
  bool isLowerContentGestureEnabled = true;

  final StreamController<bool> _hintStateStreamController =
      StreamController<bool>();
  final StreamController<double> _heightStreamController =
      StreamController<double>.broadcast();
  final StreamController<bool> _isClosedStreamController =
      StreamController<bool>.broadcast();

  bool _isHintOpen = false;
  double _height = 0;
  bool _wasOpen = false;
  double _lowerBound = 0;

  /// Expandable bottom sheet hint visibility
  bool get isHintOpen => _isHintOpen;

  set isHintOpen(bool value) =>
      _hintStateStreamController.sink.add(_isHintOpen = value);

  /// Expandable bottom sheet height
  double get height => _height;

  set height(double value) => _heightStreamController.sink.add(_height = value);

  /// Closes bottom sheet
  void close() {
    animationController?.animateBack(0);
    _heightStreamController.sink.add(_height = _lowerBound);
    isLowerContentGestureEnabled = true;
  }

  /// Shows expandable bottom sheet is open or close
  bool get isOpen => _height > _lowerBound;

  /// Gets hint state stream
  Stream<bool> get hintStateStream => _hintStateStreamController.stream;

  /// Gets height stream
  Stream<double> get heightStream => _heightStreamController.stream;

  /// Gets isClosed stream
  Stream<bool>? get isClosedStream => _isClosedStreamController.stream;

  /// Gets lower bound of bottom sheet. (bottom sheet offset)
  double get lowerBound => _lowerBound;

  /// Initialize tasks for [ExpandableBottomSheetController] properties. should get called after [animationController] get initialized.
  void init() {
    animationController?.addListener(() {
      final bool isOpen = animationController!.value > 0;

      if (!isOpen && _wasOpen) {
        _isClosedStreamController.sink.add(true);
        _wasOpen = false;
      }

      if (isOpen && !_wasOpen) {
        _isClosedStreamController.sink.add(false);
        _wasOpen = true;
      }
    });
  }

  /// Changes lowerBound value of [ExpandableBottomSheet].
  void changeLowerBound(double toValue) {
    _lowerBound = toValue;

    if (!isOpen) {
      height = _lowerBound;
    }
  }

  /// Disposes stream controller
  void dispose() {
    _hintStateStreamController.close();
    _isClosedStreamController.close();
    _heightStreamController.close();
  }
}
