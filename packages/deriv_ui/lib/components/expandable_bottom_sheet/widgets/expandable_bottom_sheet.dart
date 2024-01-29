library deriv_expandable_bottom_sheet;

import 'dart:async';
import 'dart:math';

import '../core/device_info.dart';
import 'custom_tooltip.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part '../core/expandable_bottom_sheet_controller.dart';
part 'expandable_bottom_sheet_hint_button.dart';
part 'expandable_bottom_sheet_lower_content.dart';
part '../states/expandable_bottom_sheet_provider.dart';
part 'expandable_bottom_sheet_title.dart';
part 'expandable_bottom_sheet_title_bar.dart';
part 'expandable_bottom_sheet_toggler.dart';
part 'expandable_bottom_sheet_upper_content.dart';

/// Expandable bottom sheet widget
class ExpandableBottomSheet extends StatefulWidget {
  /// This widget helps showing an expandable bottom sheet with [title], [upperContent] and [lowerContent] parts.
  ///
  /// All properties are optional.
  /// You can set [openMaximized] to true, if you want to open bottom sheet in full size.
  /// By default height in minimize state is calculated by [upperContent],
  /// but if you set [maxHeight] and [lowerContent], that value will be overridden.
  const ExpandableBottomSheet({
    required this.labelContractDetails,
    required this.upperContent,
    this.title,
    this.controller,
    this.hint,
    this.leftAction,
    this.rightAction,
    this.onOpen,
    this.onClosed,
    this.lowerContent,
    this.fullScreenMode = false,
    this.showToggler = true,
    this.maxHeight,
    this.openMaximized = false,
    this.dismissible = true,
    this.changeStateDuration =
        const Duration(milliseconds: _defaultChangeStateDuration),
    this.onClose,
    this.onToggle,
    this.onDismiss,
    Key? key,
  }) : super(key: key);

  /// Label for the contract details
  final String labelContractDetails;

  /// Expandable BottomSheet Controller
  ///
  /// A controller can be passed to the bottom sheet to get control of its functionalities (for example: closing or opening bottom sheet).
  final ExpandableBottomSheetController? controller;

  /// Upper content widget
  ///
  /// This part will be shown in close and open state
  final Widget upperContent;

  /// Lower content widget
  ///
  /// This part will be shown in open state
  final Widget? lowerContent;

  /// Expandable bottom sheet title
  ///
  /// Title part will be invisible if [title] not set
  final String? title;

  /// Expandable bottom sheet hint
  ///
  /// Hint button will be invisible if [hint] or [title] not set
  /// If [hint] has been set, [right Action] won't be accessible anymore.
  final String? hint;

  /// Action placed on left side of the title
  final Widget? leftAction;

  /// Action placed on right side of the title
  ///
  /// If [hint] has been set, [right Action] won't be accessible anymore.
  final Widget? rightAction;

  /// Sets toggler visibility
  ///
  /// If value sets to `false`, `dragging` and `toggle` actions will be disabled.
  /// Default value is `true`
  final bool showToggler;

  /// Sets maximum height for expandable bottom sheet
  ///
  /// Expandable bottom sheet will be full screen if [maxHeight] not set
  final double? maxHeight;

  /// Opens expandable bottom sheet in maximized state
  ///
  /// Default value is `false`
  final bool openMaximized;

  /// Defines whether the bottom sheet should get closed when user swipes it down.
  ///
  /// Default value is `true`.
  final bool dismissible;

  /// Defines whether the bottom sheet would be in full-screen mode when its open.
  ///
  /// Default value is `false`.
  final bool fullScreenMode;

  /// Change state animation duration
  ///
  /// Default value is `350 milliseconds`
  final Duration changeStateDuration;

  /// [onOpen] callback
  /// This callback will be called when expandable bottom sheet is open
  final VoidCallback? onOpen;

  /// [onClose] callback
  /// This callback will be called when expandable bottom sheet is close
  final VoidCallback? onClose;

  /// [onClosed] callback
  /// This callback will be called when expandable bottom sheet already closed.
  final VoidCallback? onClosed;

  /// [onToggle] callback
  /// This callback will be called when toggle expandable bottom sheet
  final VoidCallback? onToggle;

  /// [onDismiss] callback
  /// This callback will be called on expandable bottom sheet dismiss
  final VoidCallback? onDismiss;

  /// Default value for animation duration of bottom sheet in milliseconds.
  static const int _defaultChangeStateDuration = 350;

  @override
  _ExpandableBottomSheetState createState() => _ExpandableBottomSheetState();
}

class _ExpandableBottomSheetState extends State<ExpandableBottomSheet>
    with TickerProviderStateMixin {
  static const double _velocityThreshold = 100;

  late double _upperContentHeight;
  PointerDownEvent? _dragStartDetails;
  ExpandableBottomSheetController? _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: ExpandableBottomSheet._defaultChangeStateDuration),
      value: 0,
    );

    if (widget.controller == null) {
      _controller = ExpandableBottomSheetController(
          animationController: _animationController);
    } else {
      _controller = widget.controller
        ?..animationController = _animationController;
    }

    _controller?.init();
    _controller?.isClosedStream?.listen((bool isClosed) {
      if (isClosed) {
        widget.onClosed?.call();
      }
    });

    if (widget.lowerContent != null && widget.openMaximized) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => Future<void>.delayed(Duration.zero, open),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_controller != null && _controller!.isOpen) {
      open(withCallback: false);
    } else {
      close(withCallback: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double expandableBottomSheetTogglerHeight =
        widget.showToggler ? 10 : 0;

    return ExpandableBottomSheetProvider(
      controller: _controller,
      upperContent: widget.upperContent,
      lowerContent: widget.lowerContent,
      title: widget.title,
      fullScreenMode: widget.fullScreenMode,
      openBottomSheet: open,
      hint: widget.hint,
      leftAction: Padding(
        padding: EdgeInsets.only(top: expandableBottomSheetTogglerHeight),
        child: widget.leftAction,
      ),
      rightAction: Padding(
        padding: EdgeInsets.only(top: expandableBottomSheetTogglerHeight),
        child: widget.rightAction,
      ),
      showToggler: widget.showToggler,
      changeStateDuration: widget.changeStateDuration,
      onVerticalDragEnd: widget.showToggler ? _onVerticalDragEnd : null,
      onVerticalDragUpdate: widget.showToggler ? _onVerticalDragUpdate : null,
      onTogglerTap: widget.showToggler ? _onTogglerTap : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ThemeProvider.borderRadius16),
            topRight: Radius.circular(ThemeProvider.borderRadius16),
          ),
          color: context.theme.colors.secondary,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: Column(
                children: <Widget>[
                  _ExpandableBottomSheetTitleBar(
                    labelContractDetails: widget.labelContractDetails,
                  ),
                  _ExpandableBottomSheetUpperContent(
                    onHeightCalculated: (double height) =>
                        _upperContentHeight = height,
                    onHeightChanged: () => _controller!.height =
                        _controller!.isOpen ? _getAvailableHeight() : 0,
                  ),
                ],
              ),
            ),
            widget.lowerContent == null
                ? const SizedBox.shrink()
                : Listener(
                    onPointerDown: (PointerDownEvent details) =>
                        _dragStartDetails = details,
                    onPointerMove: _onLowerContentPointerMove,
                    onPointerUp: (PointerUpEvent details) =>
                        _onVerticalDragEnd(DragEndDetails()),
                    child: const _ExpandableBottomSheetLowerContent(),
                  ),
          ],
        ),
      ),
    );
  }

  void _onLowerContentPointerMove(PointerMoveEvent details) {
    if (_dragStartDetails == null ||
        !_controller!.isLowerContentGestureEnabled) {
      return;
    }

    if (_hasPassedScrollThreshold(details)) {
      _onVerticalDragUpdate(
        DragUpdateDetails(
          delta: details.delta,
          globalPosition: details.position,
        ),
      );
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails data) {
    if (data.delta.dy != 0.0) {
      if (_controller!.height - data.delta.dy > 0 &&
          _controller!.height - data.delta.dy < _getAvailableHeight()) {
        _controller!.height -= data.delta.dy;
        _animationController.value =
            (_controller!.height - _controller!.lowerBound) /
                (_getAvailableHeight() - _controller!.lowerBound);
      }
    }
  }

  void _onVerticalDragEnd(DragEndDetails data) {
    if (widget.lowerContent == null) {
      if (widget.dismissible) {
        close(dismiss: !_controller!.isOpen);
      }
    } else {
      if (data.velocity.pixelsPerSecond.dy.abs() > _velocityThreshold) {
        data.primaryVelocity!.isNegative ? open() : close();
      } else {
        _controller!.height >= (_getAvailableHeight() / 2) ? open() : close();
      }
    }
  }

  void _onTogglerTap() {
    widget.onToggle?.call();

    _controller!.isOpen ? close() : open();
  }

  void open({bool withCallback = true}) {
    if (withCallback) {
      widget.onOpen?.call();

      _closeHintBubble();
    }

    _animationController.forward();
    _controller!.height = _getAvailableHeight();
  }

  void close({
    bool withCallback = true,
    bool dismiss = false,
  }) {
    if (withCallback) {
      dismiss ? widget.onDismiss?.call() : widget.onClose?.call();

      _closeHintBubble();
    }

    _controller?.close();

    if (dismiss) {
      Navigator.pop(context);
    }
  }

  void _closeHintBubble() {
    if (_controller!.isHintOpen) {
      _controller!.isHintOpen = false;
    }
  }

  bool _hasPassedScrollThreshold(PointerMoveEvent details) =>
      (details.position.dy - (_dragStartDetails?.position.dy ?? 0)).abs() > 30;

  double _getAppBarHeight() => AppBar().preferredSize.height;

  double _getDeviceAvailableHeight() =>
      MediaQuery.of(context).size.height -
      (DeviceInfo.devicePadding?.top ?? 0) -
      (DeviceInfo.devicePadding?.bottom ?? 0);

  double _getAvailableHeight() {
    final double availableHeight =
        _getDeviceAvailableHeight() - _getAppBarHeight();

    return (widget.maxHeight == null
            ? availableHeight
            : min(widget.maxHeight!, availableHeight)) -
        _upperContentHeight;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
