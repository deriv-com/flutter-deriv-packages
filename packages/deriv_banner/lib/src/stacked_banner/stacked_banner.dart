import 'package:deriv_banner/src/stacked_banner/default_collapse_button.dart';
import 'package:flutter/material.dart';

/// Add item to stacked banner callback.
typedef OnAddRemoveBannerItem = Function(Widget);

/// Trade banner controller.
class StackedBannerController {
  /// Adds an item to the stacked banner.
  void addItem(Widget item) => _onAddItem?.call(item);
  OnAddRemoveBannerItem? _onAddItem;

  /// Removes an item to the stacked banner.
  void removeItem(Widget item) => _onRemoveItem?.call(item);
  OnAddRemoveBannerItem? _onRemoveItem;

  /// Collapse banner.
  void removeAllBanners() => _onRemoveAllBanners?.call();
  VoidCallback? _onRemoveAllBanners;

  /// Expands banner.
  void expandBanner() => _onExpandBanner?.call();
  VoidCallback? _onExpandBanner;

  /// Collapse banner.
  void collapseBanner() => _onCollapseBanner?.call();
  VoidCallback? _onCollapseBanner;
}

/// A widget that handles items that is passed to it, and can show them in two
/// collapsed (stacked on top of each other) and expaned mode.
///
/// This widget can be added to [Overlay] and once it's added it can be
/// controllered by the [StackedBannerController] instance that is passed to it.
/// To add items or expand/collapse. e.g:
///
///   Overlay.of(context)!.insert(
///         OverlayEntry(
///           builder: (_) => StackedBanner(
///               controller: bannerController,
///            ),
///           ),
///        );
///
/// and for adding banner items to it:
///   bannerController.addItem(newItem);
///
class StackedBanner extends StatefulWidget {
  /// Initializes the class.
  const StackedBanner({
    required this.controller,
    this.topPadding = 0,
    this.isExpanded,
    this.maxCollapsedItems = 3,
    this.collapseButtonBuilder,
    this.bannerHeight = 64,
    this.bannerVerticalPadding = 8,
    this.bannerHorizontalPadding = 4,
    this.onDismissed,
    this.animationDuration = const Duration(milliseconds: 250),
    this.maxBannersCount = 5,
  })  : assert(maxBannersCount > 0),
        assert(maxBannersCount >= maxCollapsedItems);

  /// The top padding for the stacked banner.
  final double topPadding;

  /// The callback triggered when the list of banner items is either expanded or collapsed.
  final Function(bool)? isExpanded;

  /// Will be called when banners are dismissed.
  final VoidCallback? onDismissed;

  /// Stacked banner controller.
  final StackedBannerController controller;

  /// Max number of items to show when the banner is in collapsed mode.
  final int maxCollapsedItems;

  /// Maximum number of banners.
  ///
  /// Default is 5. means that if there are 5 banners, and a new banner is added
  /// the oldest one will be removed.
  final int maxBannersCount;

  /// The builder method to get the widget of the item that is shown at the end
  /// of stacked banner list and clicking on it collapses the list.
  final WidgetBuilder? collapseButtonBuilder;

  /// Banner item's height.
  ///
  /// it's more optimized to all banner items have a specific and the same
  /// height comparing to having different heights and [StackedBanner] widget
  /// having to calculate it for each item.
  final double bannerHeight;

  /// Banner vertical padding.
  final double bannerVerticalPadding;

  /// Banner horizontal padding.
  final double bannerHorizontalPadding;

  /// The duration for sliding/collapsing/expanding animtions of banner itesm.
  final Duration animationDuration;

  @override
  _StackedBannerState createState() => _StackedBannerState();
}

class _StackedBannerState extends State<StackedBanner>
    with TickerProviderStateMixin {
  int _stackIndex = 0;

  late final AnimationController _slidingController;
  late final AnimationController _listExpansionController;
  late final AnimationController _dismissAnimationController;

  late final Animation<double> _lastCardTopOffsetValue;

  final List<Widget> _bannerItems = <Widget>[];

  final GlobalKey _collapsedItemsKey = GlobalKey();

  Size? _collapsedSize;

  /// Minimum number of visible banner items when the banner is expanded.
  ///
  /// When there are less items than this, the banner should be collapsed.
  static const int _minExpandedItems = 2;

  // This method should get called everytime the banners list is updated.
  void _onBannerListUpdated() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_bannerItems.length < _minExpandedItems) {
        _collapseList();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _assignControllerValues();

    _setupAnimationControllers();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _collapsedSize =
          (_collapsedItemsKey.currentContext!.findRenderObject() as RenderBox)
              .size;
    });
  }

  void _setupAnimationControllers() {
    _slidingController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() => setState(() {}));

    _listExpansionController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() => setState(() {}));

    _dismissAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() => setState(() {}));

    _lastCardTopOffsetValue = Tween<double>(
      begin: -100,
      end: widget.topPadding,
    ).animate(
      CurvedAnimation(parent: _slidingController, curve: Curves.easeIn),
    );
  }

  void _assignControllerValues() {
    widget.controller._onAddItem = (Widget item) async {
      _bannerItems.add(item);

      if (_dismissAnimationController.status == AnimationStatus.dismissed) {
        // When stacked banner is not dismissed yet. normal newItemAnimation
        await newItemAnimation();
      } else {
        await _dismissAnimationController.reverse(from: 1);
      }
      _onBannerListUpdated();
    };

    widget.controller._onRemoveItem = (Widget item) {
      setState(() => _bannerItems.remove(item));
      _onBannerListUpdated();
    };

    widget.controller._onRemoveAllBanners = () {
      setState(() => _bannerItems.clear());
      _onBannerListUpdated();
    };

    widget.controller._onExpandBanner = _expandStack;

    widget.controller._onCollapseBanner = _collapseList;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IndexedStack(
          index: _stackIndex,
          children: <Widget>[
            GestureDetector(
              onTap: _expandStack,
              onVerticalDragUpdate: _updateBannerDismissHeight,
              onVerticalDragEnd: _dismissOrFlingBack,
              child: Container(
                key: _collapsedItemsKey,
                child: _buildStackedView(MediaQuery.of(context).size),
              ),
            ),
            _buildExpandedView(),
          ],
        ),
      );

  Widget _buildStackedView(Size screenSize) => Stack(
        children: <Widget>[
          ...List<Widget>.generate(
            _bannerItems.length,
            (int index) => _buildStackItem(
              _bannerItems[index],
              index,
              screenSize,
            ),
          ),
        ],
      );

  Widget _buildExpandedView() => ListView.separated(
        padding: EdgeInsets.only(top: widget.topPadding),
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: _collapseList,
                child: widget.collapseButtonBuilder?.call(context) ??
                    const DefaultCollapseButton(),
              ),
            );
          }

          return _bannerItems[index - 1];
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: _bannerItems.length + 1,
      );

  Widget _buildStackItem(Widget child, int index, Size screenSize) {
    final double horizontalOffset = _getHorizontalOffset(index);

    return AnimatedPositioned(
      child: child,
      duration: widget.animationDuration,
      top: _getTopOffset(index) -
          (_dismissAnimationController.value * screenSize.height),
      left: horizontalOffset,
      right: horizontalOffset,
    );
  }

  void _updateBannerDismissHeight(DragUpdateDetails details) {
    final double movePercent = details.delta.dy / _collapsedSize!.height;
    _dismissAnimationController.value =
        _dismissAnimationController.value - movePercent;
  }

  Future<void> _dismissOrFlingBack(DragEndDetails details) async {
    if (_dismissAnimationController.value > 0.05) {
      await _dismissAnimationController.forward(
        from: _dismissAnimationController.value,
      );

      widget.onDismissed?.call();
    } else {
      await _dismissAnimationController.reverse(
        from: _dismissAnimationController.value,
      );
    }
  }

  Future<void> _expandStack() async {
    _removeExtraBanners();

    if (_bannerItems.length < _minExpandedItems) {
      return;
    }

    await _listExpansionController.forward();
    await Future<void>.delayed(widget.animationDuration);

    setState(() => _stackIndex = 1);

    widget.isExpanded?.call(true);
  }

  void _removeExtraBanners() {
    if (_bannerItems.length > widget.maxBannersCount) {
      _bannerItems.removeRange(0, _bannerItems.length - widget.maxBannersCount);
    }
  }

  Future<void> _collapseList() async {
    _stackIndex = 0;

    await _listExpansionController.reverse();
    widget.isExpanded?.call(false);
  }

  double _getTopOffset(int index) {
    if (_listExpansionController.isAnimating ||
        _listExpansionController.isCompleted) {
      return widget.topPadding +
          (_topBannerIndex - index) *
              (widget.bannerHeight + widget.bannerVerticalPadding);
    }

    final bool itemsExceedsMaxCollapsed =
        _bannerItems.length > widget.maxCollapsedItems &&
            index < _bannerItems.length - widget.maxCollapsedItems;

    final int virtualIndex = itemsExceedsMaxCollapsed
        ? _bannerItems.length - widget.maxCollapsedItems
        : index;

    if (virtualIndex == _topBannerIndex && _slidingController.isAnimating) {
      return _lastCardTopOffsetValue.value;
    } else {
      if (virtualIndex == _bannerItems.length - 1) {
        return widget.topPadding;
      } else {
        return widget.topPadding +
            (_topBannerIndex - virtualIndex) * widget.bannerVerticalPadding;
      }
    }
  }

  double _getHorizontalOffset(int index) {
    if (_listExpansionController.isAnimating ||
        _listExpansionController.isCompleted ||
        index == _topBannerIndex) {
      return 0;
    } else {
      return (_bannerItems.length - index) * widget.bannerHorizontalPadding;
    }
  }

  Future<void> newItemAnimation() async {
    if (_slidingController.isCompleted) {
      _slidingController.reset();
    }

    await _slidingController.forward();
  }

  int get _topBannerIndex => _bannerItems.length - 1;

  @override
  void dispose() {
    _slidingController.dispose();
    _listExpansionController.dispose();
    _dismissAnimationController.dispose();

    super.dispose();
  }
}
