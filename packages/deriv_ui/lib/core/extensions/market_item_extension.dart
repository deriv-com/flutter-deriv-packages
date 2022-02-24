import 'package:deriv_chart/deriv_chart.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

import 'package:flutter_multipliers/core/models/market_item.dart';

/// Extensions on [MarketItem] class.
extension MarketItemExtension on MarketItem {
  /// Get the asset icon path for the [tag].
  String get getTagAssetPath => 'assets/icons/ic_$tag.svg';
}

/// Extensions on [ActiveSymbols] class.
extension ActiveSymbolExtension on ActiveSymbol {
  /// Converts an [ActiveSymbols] object to a [MarketItem] object.
  Asset get toAsset => Asset(
        name: symbol ?? '',
        market: market ?? '',
        subMarket: submarket ?? '',
        displayName: displayName,
        marketDisplayName: marketDisplayName,
        subMarketDisplayName: submarketDisplayName,
        isOpen: exchangeIsOpen ?? true,
      );
}
