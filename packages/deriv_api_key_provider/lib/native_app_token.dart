// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

const String _libraryName = 'libnative_app_token.so';

const String _getAppTokenMethodName = 'getAppToken';
const String _getRSKAMethodName = 'getRSKA';
const String _getRSKIMethodName = 'getRSKI';
const String _getNativeLibraryDirectoryMethodName = 'getNativeLibraryDirectory';

const MethodChannel _methodChannel = MethodChannel('deriv_api_key_provider');

/// Gets app token.
Future<String> get appToken async => (await _getAppToken())().toDartString();

/// Gets RSKA.
Future<String> get appRSKA async => (await _getRSKA())().toDartString();

/// Gets RSKI.
Future<String> get appRSKI async => (await _getRSKI())().toDartString();

Future<String?> _getNativeLibraryDirectory() async =>
    _methodChannel.invokeMethod<String>(_getNativeLibraryDirectoryMethodName);

Future<DynamicLibrary> _getNativeAppTokenLibrary() async => Platform.isAndroid
    ? await _getAndroidDynamicLibrary(_libraryName)
    : DynamicLibrary.process();

Future<Pointer<Utf8> Function()> _getAppToken() async =>
    (await _getNativeAppTokenLibrary())
        .lookup<NativeFunction<Pointer<Utf8> Function()>>(
          _getAppTokenMethodName,
        )
        .asFunction();

Future<Pointer<Utf8> Function()> _getRSKA() async =>
    (await _getNativeAppTokenLibrary())
        .lookup<NativeFunction<Pointer<Utf8> Function()>>(_getRSKAMethodName)
        .asFunction();

Future<Pointer<Utf8> Function()> _getRSKI() async =>
    (await _getNativeAppTokenLibrary())
        .lookup<NativeFunction<Pointer<Utf8> Function()>>(_getRSKIMethodName)
        .asFunction();

Future<DynamicLibrary> _getAndroidDynamicLibrary(String libraryName) async {
  try {
    return DynamicLibrary.open(libraryName);
  } catch (_) {
    try {
      final String? nativeLibraryDirectory = await _getNativeLibraryDirectory();

      return DynamicLibrary.open('$nativeLibraryDirectory/$libraryName');
    } catch (_) {
      try {
        final PackageInfo packageInfo = await PackageInfo.fromPlatform();
        final String packageName = packageInfo.packageName;

        return DynamicLibrary.open('/data/data/$packageName/lib/$libraryName');
      } catch (_) {
        rethrow;
      }
    }
  }
}
