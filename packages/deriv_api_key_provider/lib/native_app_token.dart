import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('deriv_api_key_provider');

/// Gets app token.
Future<String> get appToken async => (await _getAppToken)().toDartString();

Future<String?> _getNativeLibraryDirectory() async =>
    _channel.invokeMethod<String>('getNativeLibraryDirectory');

Future<DynamicLibrary> get _nativeAppTokenLibrary async => Platform.isAndroid
    ? await _getAndroidDynamicLibrary('libnative_app_token.so')
    : DynamicLibrary.process();

Future<Pointer<Utf8> Function()> get _getAppToken async =>
    (await _nativeAppTokenLibrary)
        .lookup<NativeFunction<Pointer<Utf8> Function()>>('gat')
        .asFunction();

Future<DynamicLibrary> _getAndroidDynamicLibrary(String libraryName) async {
  try {
    return DynamicLibrary.open(libraryName);
  } on Exception catch (_) {
    try {
      return DynamicLibrary.open(
        '${(await _getNativeLibraryDirectory())!}/$libraryName',
      );
    } on Exception catch (_) {
      final Uint8List appIdAsBytes =
          File('/proc/self/cmdline').readAsBytesSync();
      final int endOfAppId = math.max(appIdAsBytes.indexOf(0), 0);
      final String appId =
          String.fromCharCodes(appIdAsBytes.sublist(0, endOfAppId));

      return DynamicLibrary.open('/data/data/$appId/lib/$libraryName');
    }
  }
}
