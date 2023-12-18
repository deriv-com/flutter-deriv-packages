import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

/// Firebase Database repository will help to fetch the update information from
/// the firebase database.
class FirebaseDatabaseRepository implements BaseFirebase{
  /// Initializes the Firebase Database repository
  const FirebaseDatabaseRepository();

  /// Fetches the update information from the database.
  @override
  Future<dynamic> fetchUpdateData() async {
    final DatabaseReference dbRef = FirebaseDatabase.instance
        .ref()
        .child('build')
        .child(Platform.operatingSystem);
    return (await dbRef.once()).snapshot.value;
  }
}
