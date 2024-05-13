import 'dart:io';

import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:flutter/widgets.dart';

///
String platformName(BuildContext context) {
  if (Platform.isIOS) {
    return 'IOS';
  }
  if (Platform.isAndroid) {
    return 'Android';
  }
  return context.derivPasskeysLocalizations.unsupportedPlatform;
}
