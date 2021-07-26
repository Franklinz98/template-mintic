import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_egresados/domain/repositories/database.dart';

class FirestoreDB extends FirebaseDB {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> add(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    await firestore.collection(collectionPath).add(data);
  }

  @override
  Future<void> addWithReference(
      {required String documentPath,
      required Map<String, dynamic> data}) async {
    await firestore.doc(documentPath).set(data);
  }

  @override
  Future<void> deleteDoc({required String documentPath}) async {
    await firestore.doc(documentPath).delete();
  }

  @override
  Future<Map<String, dynamic>?> readDoc({required String documentPath}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.doc(documentPath).get();
    return snapshot.data();
  }

  @override
  Future<List<Map<String, dynamic>>> readCollection(
      {required String collectionPath}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection(collectionPath).get();
    List<Map<String, dynamic>> docs = [];
    snapshot.docs.forEach((document) {
      docs.add(document.data());
    });
    return docs;
  }

  @override
  Future<void> updateDoc(
      {required String documentPath,
      required Map<String, dynamic> data}) async {
    await firestore.doc(documentPath).update(data);
  }
}
