import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cryppo/encryption/encryption_decryption.dart';
import 'package:ffi/ffi.dart';

final DynamicLibrary _nativeAppTokenLib = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app_token.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function() _getEncryptedToken = _nativeAppTokenLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('get_encrypted_token')
    .asFunction();

/// Gets app token.
Future<String> getDerivToken(String encryptionKey) async => utf8.decode(
      await decryptWithKeyDerivedFromString(
        serialized: _getEncryptedToken().toDartString(),
        passphrase: encryptionKey,
      ),
    );
