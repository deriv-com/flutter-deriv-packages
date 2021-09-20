import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

/// Gets development app token.
String get developmentAppToken => _getDevelopmentAppToken().toDartString();

/// Gets production app token.
String get productionAppToken => _getProductionAppToken().toDartString();

final DynamicLibrary _nativeAppTokenLibrary = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app_token.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function() _getDevelopmentAppToken = _nativeAppTokenLibrary
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('gdat')
    .asFunction();

final Pointer<Utf8> Function() _getProductionAppToken = _nativeAppTokenLibrary
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('gpat')
    .asFunction();
