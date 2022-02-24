import 'package:flutter_deriv_api/api/common/trading/trading_times.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_send.dart';

/// A class which is responsible for making `trading_times` API call.
abstract class TradingTimesAPICaller {
  /// Gets the trading times for the [request].
  Future<TradingTimes> getTradingTimes(TradingTimesRequest request);
}

/// A class which we can make our `trading_times` API call to it. This class
/// will cache the response of `trading_times` for a day, and for further calls
/// will return the cached information and won't make a new API call.
///
/// This class has specifically been created to help us finding the open times
/// of trending markets list. Since without, we would have to make multiple
/// `trading_times` API call for each closed symbol.
class CachedTradingTimesAPICaller implements TradingTimesAPICaller {
  /// Returns the singleton instance of [CachedTradingTimesAPICaller].
  factory CachedTradingTimesAPICaller() => _instance;

  CachedTradingTimesAPICaller._internal();

  static final CachedTradingTimesAPICaller _instance =
      CachedTradingTimesAPICaller._internal();

  final Map<String, TradingTimes> _cachedTradingTimes =
      <String, TradingTimes>{};

  /// Gets the trading times for the [request].
  ///
  /// It will cache the response to be used for future calls.
  @override
  Future<TradingTimes> getTradingTimes(TradingTimesRequest request) async {
    if (_cachedTradingTimes[request.tradingTimes!] == null) {
      _cachedTradingTimes[request.tradingTimes!] =
          await TradingTimes.fetchTradingTimes(request);
    }

    return _cachedTradingTimes[request.tradingTimes!]!;
  }
}
