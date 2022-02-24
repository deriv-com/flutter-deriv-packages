import 'package:flutter/material.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_multipliers/core/models/market_item.dart';
import 'package:flutter_multipliers/core/states/dashboard_page_navigation/dashboard_page_navigation_cubit.dart';
import 'package:flutter_multipliers/features/dashboard_page/presentation/pages/dashboard_page.dart';
import 'package:flutter_multipliers/features/trade/states/trading/trade_cubit.dart';

import '../enums.dart';

/// Opens the trade page with for the assets tapped on.
void openMarketItemTradePage(MarketItem selected, BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName(DashboardPage.routeName));
  BlocManager.instance.fetch<DashboardPageNavigationCubit>().changePage(
        page: MainNavigationBarPage.trade,
        argument: selected,
      );

  // TODO(Mohammadt): Refactor trade cubit to react to changing symbol automatically.
  BlocManager.instance.fetch<TradeCubit>().updateSymbol(selected.symbol);
}
