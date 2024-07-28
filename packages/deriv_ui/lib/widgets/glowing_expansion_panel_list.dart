import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

import 'glowing_container.dart';

/// An [ExpansionPanelList] for [GlowingExpansionPanel]s with a [Switch] as the
/// trailing child.
class GlowingExpansionPanelList extends StatelessWidget {
  /// Creates an expansion panel for [GlowingExpansionPanel]s with [Switch] as
  /// the trailing child instead of [ExpandIcon]. The [expansionCallback] is
  /// triggered when the header is tapped on.
  const GlowingExpansionPanelList({
    Key? key,
    this.children = const <GlowingExpansionPanel>[],
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
    this.elevation = 0,
    this.switchKey
  }) : super(key: key);

  /// The children of the expansion panel list. They are laid out in a similar
  /// fashion to [ListBody].
  final List<GlowingExpansionPanel> children;

  /// The callback that gets called whenever a [GlowingExpansionPanel] is
  /// tapped on. The arguments passed to the callback are the index of the
  /// pressed panel and whether the panel is currently expanded or not.
  ///
  /// This callback is useful in order to keep track of the expanded/collapsed
  /// panels in a parent widget that may need to react to these changes.
  final ExpansionPanelCallback? expansionCallback;

  /// The duration of the expansion animation.
  final Duration animationDuration;

  /// Defines elevation for the [GlowingExpansionPanel] while it's expanded.
  ///
  /// By default, the value of elevation is 0.
  final double elevation;

  /// Key of the switch widget
  final Key? switchKey;

  bool _isChildExpanded(int index) => children[index].isExpanded;

  @override
  Widget build(BuildContext context) {
    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];

    for (int index = 0; index < children.length; index += 1) {
      final ExpansionPanel child = children[index];
      final Widget headerWidget = child.headerBuilder(
        context,
        _isChildExpanded(index),
      );

      Widget expandIcon = AbsorbPointer(
        child: Switch(
          key: switchKey,
          activeColor: context.theme.colors.coral,
          value: _isChildExpanded(index),
          onChanged: (bool isExpanded) => expansionCallback?.call(
            index,
            isExpanded,
          ),
        ),
      );
      if (!child.canTapOnHeader) {
        final MaterialLocalizations localizations =
            MaterialLocalizations.of(context);
        expandIcon = Semantics(
          label: _isChildExpanded(index)
              ? localizations.expandedIconTapHint
              : localizations.collapsedIconTapHint,
          container: true,
          child: expandIcon,
        );
      }
      Widget header = Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: kMinInteractiveDimension,
                ),
                child: headerWidget,
              ),
            ),
          ),
          expandIcon,
        ],
      );
      if (child.canTapOnHeader) {
        header = MergeSemantics(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => expansionCallback?.call(
              index,
              _isChildExpanded(index),
            ),
            child: header,
          ),
        );
      }
      items.add(
        MaterialSlice(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          color: child.backgroundColor,
          child: GlowingContainer(
            key: children[index].key,
            selected: children[index].shouldGlow,
            margin: const EdgeInsets.only(top: ThemeProvider.margin16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                header,
                AnimatedCrossFade(
                  firstChild: Container(height: 0),
                  secondChild: child.body,
                  firstCurve:
                      const Interval(0, 0.6, curve: Curves.fastOutSlowIn),
                  secondCurve:
                      const Interval(0.4, 1, curve: Curves.fastOutSlowIn),
                  sizeCurve: Curves.fastOutSlowIn,
                  crossFadeState: _isChildExpanded(index)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: animationDuration,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MergeableMaterial(
      hasDividers: true,
      dividerColor: Colors.transparent,
      elevation: ThemeProvider.zeroMargin,
      children: items,
    );
  }
}

/// An [ExpansionPanel] with a [GlowingContainer].
class GlowingExpansionPanel extends ExpansionPanel {
  /// Initializes a new [GlowingExpansionPanel].
  GlowingExpansionPanel({
    required ExpansionPanelHeaderBuilder headerBuilder,
    required Widget body,
    required Color backgroundColor,
    required this.shouldGlow,
    this.key,
    bool isExpanded = false,
  }) : super(
          headerBuilder: headerBuilder,
          body: body,
          isExpanded: isExpanded,
          backgroundColor: backgroundColor,
          canTapOnHeader: true,
        );

  /// Whether or not this [GlowingExpansionPanel] should glow.
  final bool shouldGlow;

  /// Key of the glowing expansion panel
  final Key? key;
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (identical(this, other)) {
      return true;
    }

    return other is _SaltedKey<S, V> &&
        other.salt == salt &&
        other.value == value;
  }

  @override
  int get hashCode => salt.hashCode ^ value.hashCode;

  @override
  String toString() {
    final String saltString = S == String ? "<'$salt'>" : '<$salt>';
    final String valueString = V == String ? "<'$value'>" : '<$value>';
    return '[$saltString $valueString]';
  }
}
