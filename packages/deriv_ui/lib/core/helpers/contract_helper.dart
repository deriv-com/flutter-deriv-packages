import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_deriv_api/api/account/models/profit_transaction_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/open_contract.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

import 'package:flutter_multipliers/core/assets.dart';
import 'package:flutter_multipliers/core/extensions/extensions.dart';
import 'package:flutter_multipliers/features/positions/models/closed_contract_model.dart';

/// Gets contract type icon by [contractType]
String getContractTypeIcon(ContractType contractType) =>
    contractType == ContractType.multUp ? arrowUpIcon : arrowDownIcon;

/// Gets formatted profit or loss value
String getProfitLossString({
  required double value,
  required int fixedPoint,
  required String currency,
  bool showSign = true,
}) =>
    '${value <= 0 || !showSign ? '' : '+'}${value.toStringAsFixed(fixedPoint)} $currency';

/// Checks if DC is available for [contract].
bool hasCancellation(OpenContract? contract) => contract?.cancellation != null;

/// Checks if it is possible to cancel the [contract].
///
/// [time] is for compare `contract date expiry` and `current time`.
bool isCancelable({
  required OpenContract contract,
  required DateTime time,
}) =>
    hasCancellation(contract) &&
    contract.profit!.isNegative &&
    contract.cancellation!.dateExpiry!.toUtc().isAfter(time.toUtc());

/// Checks if [contract] is closable.
///
/// [time] is for compare `contract date expiry` and `current time`.
bool isClosable({
  required OpenContract contract,
  required DateTime time,
}) =>
    !hasCancellation(contract) ||
    (hasCancellation(contract) &&
        !isCancelable(contract: contract, time: time));

/// Calculate the stake of the [contract]
double getContractStake(OpenContract contract) =>
    contract.buyPrice! - (contract.cancellation?.askPrice ?? 0);

/// Gets contract type by [contractType]
String getContractTypeTitle({
  required BuildContext context,
  required ContractType contractType,
}) =>
    contractType == ContractType.multUp
        ? context.localization.labelUp
        : context.localization.labelDown;

/// Gets contract multiplier label by [contractType] and [multiplier]
String getContractMultiplierLabel({
  required BuildContext context,
  required ContractType contractType,
  required double multiplier,
}) =>
    '${getContractTypeTitle(context: context, contractType: contractType)} x${multiplier.toStringAsFixed(0)}';

/// Gets contract expiry status.
bool isContractExpired({
  required OpenContract contract,
  required DateTime currentTime,
}) {
  final DateTime sellTime = DateTime.fromMillisecondsSinceEpoch(
    min(
      contract.sellTime?.millisecondsSinceEpoch ??
          currentTime.millisecondsSinceEpoch,
      contract.exitTickTime?.millisecondsSinceEpoch ??
          currentTime.millisecondsSinceEpoch,
    ),
    isUtc: true,
  );

  final DateTime expiryTime = contract.cancellation!.dateExpiry!.toUtc();

  return expiryTime.isBefore(sellTime);
}

/// Gets profit from [ClosedContractModel]
double getClosedContractProfit(ClosedContractModel profit) =>
    profit.sellPrice! - profit.buyPrice!;

/// Calculates the profit of [contract].
double getContractProfit(OpenContract contract) =>
    contract.bidPrice! - contract.buyPrice!;

/// Calculates the raw profit of [contract].
double getContractRawProfit(OpenContract contract) =>
    contract.bidPrice! - getContractStake(contract);

/// Parses transaction and convert it to closed contract
ClosedContractModel? parsTransaction({
  required ProfitTransactionModel transaction,
  required List<ContractType>? contractTypes,
}) {
  final List<String> shortCodeParts = transaction.shortCode!.split('_');
  final ContractType transactionContractType = getEnumFromString(
    values: ContractType.values,
    name: shortCodeParts.first,
    enumCase: EnumCase.upperCase,
  )!;

  if (contractTypes != null &&
      !contractTypes.contains(transactionContractType)) {
    return null;
  }

  final double buyPrice = transaction.buyPrice!;
  final DateTime buyTime =
      getDateTimeFromString(shortCodeParts[shortCodeParts.length - 4])!.toUtc();
  final int contractId = transaction.contractId!;
  final ContractType contractType = transactionContractType;
  final int dealCancellationDuration = int.parse(
    shortCodeParts[shortCodeParts.length - 2].replaceAll('m', ''),
  );
  final int multiplier = int.parse(shortCodeParts[shortCodeParts.length - 5]);
  final double profit = transaction.sellPrice! - transaction.buyPrice!;
  final double sellPrice = transaction.sellPrice!;
  final DateTime sellTime = transaction.purchaseTime!.toUtc();
  final String underlying = shortCodeParts.length == 8
      ? shortCodeParts[1].replaceAll('FRX', 'frx')
      : '${shortCodeParts[1]}_${shortCodeParts[2]}';

  return ClosedContractModel(
    buyPrice: buyPrice,
    buyTime: buyTime,
    contractId: contractId,
    contractType: contractType,
    dealCancellationDuration: dealCancellationDuration,
    multiplier: multiplier,
    profit: profit,
    sellPrice: sellPrice,
    sellTime: sellTime,
    underlying: underlying,
  );
}

/// Returns true if the [contract] has cancellation and haven't expired yet.
bool hasCancellationInformation({
  required OpenContract contract,
  required DateTime time,
}) =>
    hasCancellation(contract) &&
    !isContractExpired(contract: contract, currentTime: time);
