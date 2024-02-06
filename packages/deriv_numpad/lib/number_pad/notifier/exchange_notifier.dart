import 'package:deriv_numpad/number_pad/model/currency_detail.dart';
import 'package:deriv_numpad/number_pad/model/exchange_rate_model.dart';
import 'package:flutter/material.dart';

/// This class is used to provide [ExchangeController] to the widget tree.
class ExchangeNotifier extends InheritedNotifier<ExchangeController> {
  /// This class is used to provide [ExchangeController] to the widget tree.
  const ExchangeNotifier({
    required Widget child,
    ExchangeController? notifier,
  }) : super(child: child, notifier: notifier);

  /// Retrieve [ExchangeController] from the widget tree.
  static ExchangeController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ExchangeNotifier>()?.notifier;
}

/// This class contains the all the logic of exchange.
class ExchangeController extends ChangeNotifier {
  /// It controls exchange rate conversion, switching between currencies and all the logic related to currency.
  ExchangeController({
    required Stream<ExchangeRateModel> rateSource,
    required CurrencyDetail primaryCurrency,
    required this.currencyFieldController,
    required ExchangeRateModel initialExchangeRate,
  }) : _rateSource = rateSource {
    _exchangeRate = initialExchangeRate;
    _primaryCurrency = primaryCurrency;
    _secondaryCurrency = CurrencyDetail(
      _getExchangedOutput(_primaryCurrency.amount),
      _exchangeRate.targetCurrency,
    );
    _listenForExchangeRateChange();
  }

  /// controller for active textfield.
  TextEditingController currencyFieldController;
  late bool _isSwapped = false;
  late ExchangeRateModel _exchangeRate;
  late CurrencyDetail _primaryCurrency;
  late CurrencyDetail _secondaryCurrency;
  final Stream<ExchangeRateModel> _rateSource;

  /// Currently active currency in textField
  CurrencyDetail get primaryCurrency => _primaryCurrency;

  /// Exchanged currency
  CurrencyDetail get secondaryCurrency => _secondaryCurrency;

  Future<void> _listenForExchangeRateChange() async {
    _rateSource.listen((ExchangeRateModel rate) {
      _exchangeRate = rate;
      if (currencyFieldController.text.isEmpty) {
        _secondaryCurrency = CurrencyDetail(0, secondaryCurrency.currencyType);
      } else {
        _secondaryCurrency = CurrencyDetail(
            _getExchangedOutput(_primaryCurrency.amount),
            secondaryCurrency.currencyType);
      }
      notifyListeners();
    });
  }

  /// This is called when an amount is changed in textField and immediately converts amount in secondary currency.
  void onChangeCurrency(String newValue) {
    if (currencyFieldController.text.isNotEmpty) {
      _secondaryCurrency = _getUpdatedSecondaryCurrency();
      _primaryCurrency = _getUpdatedPrimaryCurrency();
      notifyListeners();
    } else {
      _secondaryCurrency = CurrencyDetail(0, _secondaryCurrency.currencyType);
    }
  }

  /// This will interchange the currency, amount from textField to switcher and vice-versa.
  void swap() {
    _isSwapped = !_isSwapped;

    final double localPrimary =
        double.tryParse(currencyFieldController.text) ?? 0.0;

    final String localPrimaryCurrency = _primaryCurrency.currencyType;

    _primaryCurrency = CurrencyDetail(
      _secondaryCurrency.amount,
      _secondaryCurrency.currencyType,
    );
    _secondaryCurrency = CurrencyDetail(localPrimary, localPrimaryCurrency);
    currencyFieldController
      ..text = _primaryCurrency.displayAmount
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: currencyFieldController.text.length),
      );
    notifyListeners();
  }

  CurrencyDetail _getUpdatedSecondaryCurrency() {
    final double value = double.parse(
        _getExchangedOutput(double.parse(currencyFieldController.text))
            .toStringAsFixed(8));
    return CurrencyDetail(value, _secondaryCurrency.currencyType);
  }

  CurrencyDetail _getUpdatedPrimaryCurrency() => CurrencyDetail(
      double.parse(currencyFieldController.text),
      _primaryCurrency.currencyType);

  double _getExchangedOutput(double amount) => _isSwapped
      ? _exchangeRate.getInverseOfExchangeRate() * amount
      : _exchangeRate.exchangeRate * amount;

  /// This will return the final output currency.
  ///
  ///  The output amount is the same as the base of exchange rate(as this is
  ///  what user send by default in primaryCurrency when coming to numpad.)
  double finalAmount() {
    if (_exchangeRate.baseCurrency == primaryCurrency.currencyType) {
      return primaryCurrency.amount;
    } else {
      return secondaryCurrency.amount;
    }
  }
}

/// Inversion extension.
extension ExchangeRateInverse on ExchangeRateModel {
  /// This will get the inverse of the actual exchange rate.
  double getInverseOfExchangeRate() => 1 / exchangeRate;
}
