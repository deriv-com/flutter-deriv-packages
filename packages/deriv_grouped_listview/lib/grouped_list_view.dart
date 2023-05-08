import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'grouped_list_view_order.dart';

part 'grouped_list_view_controller.dart';

/// A function that's called when the user has dragged the refresh indicator
/// far enough to demonstrate that they want the app to refresh. The returned
/// [Future] must complete when the refresh operation is finished.
typedef RefreshHandler = Future<void> Function();

/// Grouped list view widget
class GroupedListView<E, G extends Comparable<Object>> extends StatefulWidget {
  /// Grouped list view
  ///
  /// If you set [groupBy] and [groupBuilder] properties, the list items will be grouped by the provided grouping information.
  /// [hasStickyHeader] will keep your header in top of the list
  /// Also pull to refresh is applicable by setting [hasRefreshIndicator] to `true`
  /// and providing [onRefresh] handler.
  const GroupedListView({
    required this.itemBuilder,
    this.items,
    this.groupBy,
    this.groupBuilder,
    this.separator,
    this.controller,
    this.sort = true,
    this.sortPredicate,
    this.order = GroupedListViewOrder.ascending,
    this.hasStickyHeader = false,
    this.showLoadMoreIndicator = false,
    this.loadMoreIndicator,
    this.hasRefreshIndicator = false,
    this.refreshIndicatorDisplacement = 40,
    this.onRefresh,
    this.emptyList,
    this.scrollDirection = Axis.vertical,
    this.primary,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    Key? key,
  }) : super(key: key);

  /// Item builder generates widget for each item in [items] list
  final Widget Function(E item) itemBuilder;

  /// Items to produce the list with [itemBuilder]
  final List<E?>? items;

  /// Function which maps an item to its grouped value
  final G Function(E? item)? groupBy;

  /// Function which gets the group by value and returns a widget
  final Widget Function(G group)? groupBuilder;

  /// Separator widget for each item in the list
  final Widget? separator;

  /// An object that can be used to control the scroll position
  final ScrollController? controller;

  /// To determine if the items should be sorted or not
  ///
  /// This defaults to `true`
  final bool sort;

  /// The function that list.sort uses in order to compare elements in the list.
  ///
  /// If not provided, it compares items alphabetically.
  final int Function(E firstItem, E secondItem)? sortPredicate;

  /// Changes grouped list order
  ///
  /// This defaults to [GroupedListViewOrder.ascending]
  final GroupedListViewOrder order;

  /// Shows a progress bar at the end of list
  ///
  /// This defaults to `false`
  final bool showLoadMoreIndicator;

  /// Sets a widget for load more indicator
  ///
  /// Default load more indicator will be shown if it does not set
  final Widget? loadMoreIndicator;

  /// Enables sticky header
  ///
  /// Sticky header is disabled by default
  final bool hasStickyHeader;

  /// Enables refresh indicator
  ///
  /// Refreshing indicator is disabled by default
  final bool hasRefreshIndicator;

  /// Sets refresh indicator displacement
  ///
  /// This defaults to `40`
  final double refreshIndicatorDisplacement;

  /// On refresh handler
  final RefreshHandler? onRefresh;

  /// Empty list widget
  ///
  /// This page will be shown when [items] is empty
  final Widget? emptyList;

  /// Sets the axis along which the scroll view scrolls
  ///
  /// This defaults to [Axis.vertical]
  final Axis scrollDirection;

  /// Whether this is the primary scroll view associated with the parent
  final bool? primary;

  /// Sets how the scroll view should respond to user input
  final ScrollPhysics? physics;

  /// The amount of space by which to inset the children
  final EdgeInsetsGeometry? padding;

  /// Whether the extent of the scroll view in the [scrollDirection] should be determined by the contents being viewed
  ///
  /// This defaults to `false`
  final bool shrinkWrap;

  /// Whether to wrap each child in an [AutomaticKeepAlive]
  ///
  /// [AutomaticKeepAlive] allows subtrees to request to be kept alive in lazy lists.
  /// This defaults to `true`
  final bool addAutomaticKeepAlives;

  /// Whether to wrap each child in a [RepaintBoundary]
  ///
  /// This defaults to `true`
  final bool addRepaintBoundaries;

  /// Whether to wrap each child in an [IndexedSemantics]
  ///
  /// This defaults to `true`
  final bool addSemanticIndexes;

  /// See [SliverChildBuilderDelegate.addSemanticIndexes] for more information
  final double? cacheExtent;

  @override
  _GroupedListViewState<E, G> createState() => _GroupedListViewState<E, G>();
}

class _GroupedListViewState<E, G extends Comparable<Object>>
    extends State<GroupedListView<E, G>> {
  BuildContext? _groupContext;
  BuildContext? _itemContext;
  BuildContext? _separatorContext;

  double? _groupHeight;
  double? _itemHeight;
  double? _separatorHeight;

  ScrollController? _scrollController;

  final _GroupedListViewController _groupedListViewController =
      _GroupedListViewController();

  @override
  void initState() {
    super.initState();

    _scrollController = widget.controller ?? ScrollController();

    if (_hasStickyHeader()) {
      _scrollController?.addListener(_scrollControllerListener);
    }

    SchedulerBinding.instance
        .addPostFrameCallback((_) => _initializeItemHeights());
  }

  @override
  Widget build(BuildContext context) {
    _sortList(widget.items);

    return _hasRefreshIndicator()
        ? RefreshIndicator(
            displacement: widget.refreshIndicatorDisplacement,
            onRefresh: widget.onRefresh!,
            child: _buildMainContent(),
          )
        : _buildMainContent();
  }

  Widget _buildMainContent() => _hasItem()
      ? Stack(
          children: <Widget>[
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                if (_hasStickyHeader()) {
                  overscroll.disallowIndicator();
                }

                return false;
              },
              child: _buildListView(),
            ),
            if (_hasStickyHeader())
              StreamBuilder<int>(
                initialData: 0,
                stream: _groupedListViewController.stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) =>
                    snapshot.hasData
                        ? widget.groupBuilder!(_getGroupNames()[snapshot.data!])
                        : const SizedBox.shrink(),
              ),
          ],
        )
      : _buildEmptyPage();

  Widget _buildListView() => ListView.builder(
        scrollDirection: widget.scrollDirection,
        controller: _scrollController,
        primary: widget.primary,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
        padding: widget.padding,
        itemCount: _getItemCount(),
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addSemanticIndexes: widget.addSemanticIndexes,
        cacheExtent: widget.cacheExtent,
        itemBuilder: (BuildContext context, int index) {
          final int actualIndex = getItemIndex(index);

          if (actualIndex == widget.items!.length) {
            return _buildLoadMoreIndicator();
          }

          if (_hasGroup() && index.isEven) {
            final G currentGroup = widget.groupBy!(widget.items![actualIndex]);
            final G? previousGroup = (actualIndex - 1).isNegative
                ? null
                : widget.groupBy!(widget.items![actualIndex - 1]);

            return Builder(builder: (BuildContext context) {
              if (previousGroup == currentGroup) {
                return const SizedBox.shrink();
              }

              _groupContext ??= context;

              return widget.groupBuilder!(currentGroup);
            });
          }

          return Column(
            children: <Widget>[
              Builder(builder: (BuildContext context) {
                _itemContext ??= context;

                return widget.itemBuilder(widget.items![actualIndex] as E);
              }),
              if (widget.separator != null)
                Builder(builder: (BuildContext context) {
                  _separatorContext ??= context;

                  return widget.separator!;
                }),
            ],
          );
        },
      );

  Widget _buildEmptyPage() => Stack(
        children: <Widget>[
          ListView(
            physics: const AlwaysScrollableScrollPhysics(),
          ),
          Center(
            child: widget.emptyList ?? const SizedBox.shrink(),
          )
        ],
      );

  Widget _buildLoadMoreIndicator() => Center(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(16),
          child: widget.loadMoreIndicator ?? const CircularProgressIndicator(),
        ),
      );

  void _sortList(List<E?>? list) {
    if (!widget.sort || !_hasGroup() || list == null) {
      return;
    }

    final int isAscending =
        widget.order == GroupedListViewOrder.ascending ? 1 : -1;

    list.sort((E? firstItem, E? secondItem) => widget.sortPredicate == null
        ? defaultCompareFunction(firstItem as E, secondItem as E) * isAscending
        : widget.sortPredicate!(firstItem as E, secondItem as E) * isAscending);
  }

  int defaultCompareFunction(E firstItem, E secondItem) =>
      (widget.groupBy!(firstItem)).compareTo(widget.groupBy!(secondItem));

  List<G> _getGroupNames() => groupBy<E?, G>(widget.items!, widget.groupBy!)
      .entries
      .map<G>((dynamic entry) => entry.key)
      .toList();

  void _initializeItemHeights() {
    _groupHeight ??= _groupContext?.size?.height ?? 0;
    _itemHeight ??= _itemContext?.size?.height ?? 0;
    _separatorHeight ??= _separatorContext?.size?.height ?? 0;
  }

  List<double> _getGroupHeights() {
    double sum = 0;

    final List<double> groupHeights =
        groupBy<E?, G>(widget.items!, widget.groupBy!)
            .entries
            .map<double>((dynamic entry) => entry.value.length.toDouble())
            .toList();

    return groupHeights
        .map<double>((double itemCount) => sum +=
            itemCount * (_itemHeight! + _separatorHeight!) + _groupHeight!)
        .toList();
  }

  // First, we should get each item group height by calling _getGroupHeights() method,
  // Then by checking list view controller offset we can indicate the current list group
  // and set currentGroupIndex for showing corresponding sticky header.
  void _scrollControllerListener() {
    final List<double> groupHeights = _getGroupHeights();
    final double controllerOffset = _scrollController!.offset + _groupHeight!;

    if (controllerOffset < groupHeights.first) {
      _changeCurrentGroupIndex(0);
    } else {
      for (int i = 1; i < groupHeights.length; i++) {
        if (controllerOffset >= groupHeights[i - 1] &&
            controllerOffset < groupHeights[i]) {
          _changeCurrentGroupIndex(i);

          break;
        }
      }
    }
  }

  void _changeCurrentGroupIndex(int i) {
    if (_groupedListViewController.currentGroupIndex == i) {
      return;
    }

    _groupedListViewController.currentGroupIndex = i;
  }

  bool _hasItem() => widget.items != null && widget.items!.isNotEmpty;

  bool _hasGroup() =>
      _hasItem() && widget.groupBy != null && widget.groupBuilder != null;

  int _getItemCount() =>
      (widget.items?.length ?? 0) * (_hasGroup() ? 2 : 1) +
      (widget.showLoadMoreIndicator ? 1 : 0);

  int getItemIndex(int index) => index ~/ (_hasGroup() ? 2 : 1);

  bool _hasStickyHeader() => _hasGroup() && widget.hasStickyHeader;

  bool _hasRefreshIndicator() =>
      widget.hasRefreshIndicator && widget.onRefresh != null;

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollControllerListener);

    if (widget.controller == null) {
      _scrollController?.dispose();
    }

    _groupedListViewController.dispose();

    super.dispose();
  }
}
