import 'package:flutter_multipliers/core/enums.dart';

/// Decode enums from json string.
K enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: ${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (MapEntry<K, V> item) => item.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: ${enumValues.values.join(', ')}',
        );
      }

      return MapEntry<K, V>(unknownValue, enumValues.values.first);
    },
  ).key;
}

/// Map trade type enum to string.
const Map<TradeType, String> tradeTypeEnumValues = <TradeType, String>{
  TradeType.rise: 'rise',
  TradeType.fall: 'fall',
  TradeType.down: 'multdown',
  TradeType.up: 'multup',
  TradeType.higher: 'higher',
  TradeType.lower: 'lower',
  TradeType.touch: 'touch',
  TradeType.noTouch: 'no touch',
  TradeType.callSpread: 'callspread',
  TradeType.putSpread: 'putspread'
};
