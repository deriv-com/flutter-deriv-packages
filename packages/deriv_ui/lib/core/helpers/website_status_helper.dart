import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:flutter_deriv_api/api/common/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/common/website_status/website_status.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/helpers/number_helper.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:flutter_multipliers/core/extensions/extensions.dart';
import 'package:flutter_multipliers/core/states/website_status/website_status_cubit.dart';

/// Gets website status.
WebsiteStatus? get websiteStatus {
  final WebsiteStatusState state =
      BlocManager.instance.fetch<WebsiteStatusCubit>().state;

  if (state is WebsiteStatusLoadedState) {
    return state.websiteStatus;
  }

  return null;
}

/// Creates NumberFormat based on current account currency.
NumberFormat getAccountCurrencyFormat({
  required String? currency,
  bool showSymbol = true,
}) =>
    getValueFormatter(
      decimalDigits: _getFractionalDigits(
        currencyConfigs: websiteStatus?.currencyConfig,
        currency: currency,
      ),
      currency: currency,
      showSymbol: showSymbol,
    );

/// Creates NumberFormat.
NumberFormat getValueFormatter({
  required int decimalDigits,
  String locale = 'en_US',
  String? currency = 'USD',
  bool showSymbol = true,
}) {
  final NumberFormat formatter = NumberFormat.currency(
    decimalDigits: decimalDigits,
    locale: locale,
    name: currency,
    symbol: (showSymbol && currency != null)
        ? NumberFormat().simpleCurrencySymbol(currency)
        : '',
  );

  return formatter;
}

/// Returns formatted value based on [currency] and [decimalDigits].
///
/// [showSymbol]: if true, displays currency symbol.
/// [showCurrency] if true, displays currency name.
String? getFormattedValue({
  double? value,
  int? decimalDigits,
  String? currency,
  bool showSymbol = true,
  bool showCurrency = false,
}) =>
    value == null
        ? null
        : '${getValueFormatter(
            decimalDigits: decimalDigits ?? getDecimalDigits('$value'),
            currency: currency,
            showSymbol: showSymbol,
          ).format(value)} ${showCurrency ? currency : ''}';

/// Returns the formatted value based on [currency].
/// number of decimal digits fetched automatically from [WebsiteStatus] based on currency.
///
/// [value] and [currency] are required.
///
/// [showCurrency] if true, displays the the mapped currency name.
/// default is true.
///
/// [showSign] if true, displays the sign of the value.
/// default is false.
String? getFormattedCurrencyValue({
  required double? value,
  required String currency,
  bool showCurrency = true,
  bool showSign = false,
}) {
  if (value == null) {
    return null;
  }

  final NumberFormat numberFormat = getValueFormatter(
    decimalDigits: _getFractionalDigits(
      currencyConfigs: websiteStatus?.currencyConfig,
      currency: currency,
    ),
    currency: currency,
    showSymbol: false,
  );

  return '${value <= 0 || !showSign ? '' : '+'}${numberFormat.format(value)} ${showCurrency ? numberFormat.mappedCurrencyName : ''}';
}

/// Gets fraction digits by [WebsiteStatus].
int getFractionalDigits(String? currency) => _getFractionalDigits(
      currencyConfigs: websiteStatus?.currencyConfig,
      currency: currency,
    );

/// Map currency names for some currency exceptions in [value] parameter.
String getStringWithMappedCurrencyName(String value) =>
    value.contains(RegExp('ust', caseSensitive: false))
        ? value.replaceAll(RegExp(r'ust', caseSensitive: false), 'USDT')
        : value;

int _getFractionalDigits({
  required List<WebsiteStatusCurrencyConfigModel?>? currencyConfigs,
  required String? currency,
}) {
  final WebsiteStatusCurrencyConfigModel? currencyConfig = currencyConfigs
      ?.firstWhereOrNull((WebsiteStatusCurrencyConfigModel? config) =>
          config?.code == currency);

  return currencyConfig?.fractionalDigits ?? 2;
}

/// Returns [WebsiteStatusCurrencyConfigModel] for the [currency] provided.
WebsiteStatusCurrencyConfigModel? getCurrencyConfig(String currency) =>
    websiteStatus?.currencyConfig?.firstWhereOrNull(
        (WebsiteStatusCurrencyConfigModel? element) =>
            element!.code == currency);
