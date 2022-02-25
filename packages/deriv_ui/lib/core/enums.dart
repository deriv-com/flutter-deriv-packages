/// Chart types
enum ChartType {
  /// Area chart
  area,

  /// Candle chart
  candle,
}

/// Chart intervals
enum ChartInterval {
  /// 1 tick interval
  oneTick,

  /// 1 minute interval
  oneMinute,

  /// 2 minutes interval
  twoMinutes,

  /// 3 minutes interval
  treeMinutes,

  /// 5 minutes interval
  fiveMinutes,

  /// 10 minutes interval
  tenMinutes,

  /// 15 minutes interval
  fifteenMinutes,

  /// 30 minutes interval
  thirtyMinutes,

  /// 1 hour interval
  oneHour,

  /// 2 hours interval
  twoHours,

  /// 4 hours interval
  fourHours,

  /// 8 hours interval
  eightHours,

  /// 1 day interval
  oneDay,
}

/// Trade contract types
enum TradeContractType {
  /// Up contract type.
  up,

  /// Down contract type.
  down,
}

/// Trade types
enum TradeType {
  /// MULTUP contract
  up,

  /// MULTDOWN contract
  down,

  /// Rise contract
  rise,

  /// Fall contract
  fall,

  /// Higher contract
  higher,

  /// Lower contract
  lower,

  /// Touch contract
  touch,

  /// No touch contract
  noTouch,

  /// Call spread contract
  callSpread,

  /// Put spread contract
  putSpread
}

/// Indicates the number of inputs in the NumberPad widget, between one or two inputs.
enum NumberPadWidgetType {
  /// Has one input with a title at the top of the view.
  singleInput,

  /// Has two inputs with a title at the top of each input.
  doubleInput,
}

/// Indicates which input field should be focused when [NumberPadWidgetType] is double input.
enum NumberPadInputFocus {
  /// Focuses on the first input field.
  firstInputField,

  /// Focuses on the second input field.
  secondInputField,
}

/// Indicates how NumberPad widget is closed
enum NumberPadCloseType {
  /// When the user clicked on the OK button to close numberPad widget
  pressOK,

  /// when the user clicked anywhere outside the widget to dismiss the NumberPad widget
  clickOutsideView,
}

/// Sort direction
enum SortDirection {
  /// Ascending sort direction
  asc,

  /// Descending sort direction
  desc,
}

/// Order by types
enum OrderBy {
  /// Order by date
  date,

  /// Order by stake
  stake,

  /// Order by profit
  profit,

  /// Order by multiplier
  multiplier,
}

/// Position types
enum PositionType {
  /// Open position type
  open,

  /// Closed position type
  closed,
}

/// Trading error types
enum TradeErrorType {
  /// Invalid take profit.
  invalidTakeProfit,

  /// Stop loss greater than stake
  invalidStopLoss,

  /// Stake amount greater than balance.
  invalidStakeValue,

  /// Insufficient balance.
  insufficientBalance,

  /// Market closed.
  marketClosed,

  /// Need authentication.
  needAuthentication,

  /// Client unwelcome.
  clientUnwelcome,

  /// ContractsForSymbol error.
  contractsForSymbolError,

  /// Invalid Token.
  invalidToken,

  /// Disabled client.
  disabledClient,

  /// Commission error.
  commissionError,

  /// Invalid contract proposal.
  invalidContractProposal,

  /// Rate limit.
  rateLimit,

  /// Unknown error
  unknownError
}

/// Risk management types
enum RiskManagementType {
  /// Label for risk management bottom sheet.
  labelRiskManagement,

  /// Stop loss and Take profit risk management type.
  stopLossAndTakeProfit,

  /// Deal cancellation risk management type.
  dealCancellation,
}

/// Indicates what kind of markets should list in the market selector dialog.
enum MarketSelectorDialogType {
  /// All markets available.
  allMarkets,

  /// Only synthetic indices.
  syntheticIndices,

  /// Only open markets.
  openMarkets,
}

/// Tabs present in the notification page.
enum NotificationTabType {
  /// System notification tab.
  system,

  /// News notification tab.
  news,
}

/// Connectivity status.
enum DisconnectSource {
  /// Wifi or mobile network is disconnected.
  internet,

  /// Websocket is disconnected.
  websocket,
}

/// Account setting in Account settings page`.
enum AccountSetting {
  /// Financial assessment setting.
  financialAssessment,

  /// Proof of identity setting.
  proofOfIdentity,

  /// Proof of address setting.
  proofOfAddress,

  /// Self exclusion setting.
  selfExclusion,

  /// Account limits setting.
  accountLimits,
}

/// Indicates loading behaviour of the banners.
enum BannerLoadingType {
  /// The banner which is going to be loaded is for demo accounts.
  demoLoading,

  /// The banner which is going to be loaded is for real accounts.
  realLoading
}

/// Product types
enum ProductType {
  /// Options product type.
  options,

  /// Multipliers product type.
  multipliers,

  /// Call/Put spreads product type.
  callPutSpreads
}

/// Main navigation bar items.
enum MainNavigationBarPage {
  /// Home page.
  homePage,

  /// Markets page.
  markets,

  /// Trade page.
  trade,

  /// Positions page.
  positions,

  /// Cashier page.
  cashier,
}

/// Filters to control the list of market items in the [MarketsPage].
enum MarketsFilter {
  /// Favorites markets filter
  favorites,

  /// Multipliers markets filter
  multipliers,
}
