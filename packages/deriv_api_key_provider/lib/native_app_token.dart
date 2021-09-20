import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

/// Gets production app token.
String get appToken => _getAppToken().toDartString();

final DynamicLibrary _nativeAppTokenLibrary = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app_token.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function() _getAppToken = _nativeAppTokenLibrary
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('gat')
    .asFunction();
