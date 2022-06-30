import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase_queries {
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      FirebaseFirestore firestore, String L1_collection) async {
    var Q = firestore.collection("users");
    return Q.get();
  }
}
