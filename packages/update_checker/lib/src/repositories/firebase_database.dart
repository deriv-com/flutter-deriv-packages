import 'dart:io';

import 'package:firebase_database/firebase_database.dart';

/// Firebase Database repository will help to fetch the update information from
/// the firebase database.
class FirebaseDatabaseRepository {
  /// Initializes the Firebase Database repository
  const FirebaseDatabaseRepository();

  /// Fetches the update information from the database.
  Future<dynamic> fetchUpdateData() async {
    final DatabaseReference dbRef = FirebaseDatabase.instance
        .ref()
        .child('build')
        .child(Platform.operatingSystem);
    return (await dbRef.once()).snapshot.value;
  }
}
