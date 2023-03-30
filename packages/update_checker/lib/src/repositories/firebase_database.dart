import 'dart:io';

import 'package:firebase_database/firebase_database.dart';

/// Firebase Database repository will help to fetch the update information from
/// the firebase database.
class FirebaseDatabaseRepository {
  /// Initializes the Firebase Database repository
  const FirebaseDatabaseRepository({this.updateCheckerFirebaseField = 'build'});

  /// The filed which update checker should pick from the Firebase database.
  final String updateCheckerFirebaseField;

  /// Fetches the update information from the database.
  Future<dynamic> fetchUpdateData() async {
    final DatabaseReference dbRef = FirebaseDatabase.instance
        .reference()
        .child(updateCheckerFirebaseField)
        .child(Platform.operatingSystem);
    return (await dbRef.once()).value;
  }
}
