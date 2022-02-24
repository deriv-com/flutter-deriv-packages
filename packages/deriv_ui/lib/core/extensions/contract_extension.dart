import 'package:flutter/material.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';

import 'package:flutter_multipliers/core/extensions/extensions.dart';

/// An extension on [ContractType] for getting contract type title.
extension ContractExtension on ContractType {
  /// Returns [ContractType] the title.
  String getTitle(BuildContext context) {
    switch (this) {
      case ContractType.call:
      case ContractType.put:
        return '${context.localization.labelRise}/${context.localization.labelFall}';
      case ContractType.multUp:
      case ContractType.multDown:
        return '${context.localization.labelUp}/${context.localization.labelDown}';
      case ContractType.callSpread:
      case ContractType.putSpread:
        return '${context.localization.labelCallSpread}/${context.localization.labelPutSpread}';

      default:
        return '-';
    }
  }
}
