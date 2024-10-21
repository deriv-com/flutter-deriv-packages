# Deriv Cipher

A package to encrypt and decrypt data using AES encryption.

## Usage

To use this package, add `deriv_cipher` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  deriv_cipher: ^0.0.1
```

### Import the package

```dart
import 'package:deriv_cipher/deriv_cipher.dart';
```
    
### Encrypt data

```dart

final cipher = Cipher();
final encryptedData = cipher.encrypt('data', key<List<List<int>>>);
```

### Decrypt data

```dart

final cipher = Cipher();
final decryptedData = cipher.decrypt('encryptedData', key<List<List<int>>>);
```

