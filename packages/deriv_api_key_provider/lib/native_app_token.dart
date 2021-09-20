import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

const String _productionAppTokenSeed = 'deriv_api_production_seed';
const String _developmentAppToken = 'deriv_api_development_token';

/// Gets development app token.
String get developmentAppToken => _developmentAppToken;

/// Gets production app token.
String get productionAppToken => _getAppToken(
      _intListToPointer(_productionAppTokenSeed.codeUnits),
      _productionAppTokenSeed.length,
    ).toDartString();

final DynamicLibrary _nativeAppTokenLibrary = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app_token.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function(Pointer<Int32>, int) _getAppToken =
    _nativeAppTokenLibrary
        .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Int32>, Int32)>>(
          'gat',
        )
        .asFunction();

Pointer<Int32> _intListToPointer(List<int> items) {
  final Pointer<Int32> intPointer =
      malloc.allocate<Int32>(sizeOf<Int32>() * items.length);

  for (int index = 0; index < items.length; index++) {
    intPointer.elementAt(index).value = items[index];
  }

  return intPointer;
}
