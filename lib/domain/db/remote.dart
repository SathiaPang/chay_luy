import 'package:cloud_firestore/cloud_firestore.dart';

sealed class FirestoreDatabase {
  static final _db = FirebaseFirestore.instance;
  static final userTable = _db.collection("user_collection");
}
