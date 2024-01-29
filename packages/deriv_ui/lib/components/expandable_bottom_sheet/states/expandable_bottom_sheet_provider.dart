part of '../widgets/expandable_bottom_sheet.dart';

/// Provider of [ExpandableBottomSheet].
class ExpandableBottomSheetProvider extends InheritedWidget {
  /// Default constructor of [ExpandableBottomSheetProvider].
  const ExpandableBottomSheetProvider({
    required Widget child,
    required this.controller,
    required this.leftAction,
    required this.rightAction,
    required this.showToggler,
    required this.fullScreenMode,
    this.upperContent, 
    this.lowerContent,
    this.title,
    this.hint,
    this.changeStateDuration,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onTogglerTap,
    this.openBottomSheet,
  }) : super(child: child);

  /// Expandable BottomSheet Controller
  ///
  /// A controller can be passed to the bottom sheet to get control of its functionalities (for example: closing or opening bottom sheet).
  final ExpandableBottomSheetController? controller;

  /// Upper content widget
  ///
  /// This part will be shown in close and open state
  final Widget? upperContent;

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

  /// Defines whether the bottom sheet would be in full-screen mode when its open.
  ///
  /// Default value is `false`.
  final bool? fullScreenMode;

  /// Change state animation duration
  ///
  /// Default value is `350 milliseconds`
  final Duration? changeStateDuration;

  /// [onVerticalDragUpdate] callback
  /// This callback will be called when drag gesture updates.
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// [onVerticalDragEnd] callback
  /// This callback will be called when drag gesture end.
  final GestureDragEndCallback? onVerticalDragEnd;

  /// [onTogglerTap] callback
  /// This callback will be called when toggle expandable bottom sheet
  final VoidCallback? onTogglerTap;

  /// [openBottomSheet] callback
  /// This callback can be invoke to open bottom sheet.
  final VoidCallback? openBottomSheet;

  /// Gets nearest instance of [ExpandableBottomSheetProvider] in widget tree.
  static ExpandableBottomSheetProvider? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ExpandableBottomSheetProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
