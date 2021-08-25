import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

final DynamicLibrary _nativeAppTokenLib = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app_token.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function() _getAppToken = _nativeAppTokenLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('get_app_token')
    .asFunction();

/// Gets app token.
String get getAppToken => _getAppToken().toDartString();
