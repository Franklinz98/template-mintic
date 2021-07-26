import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_egresados/domain/repositories/database.dart';

class FirestoreDB extends FirebaseDB {
  // We get the Firestore instance
  final _firestore = FirebaseFirestore.instance;

  // With the documents collection ref we add a new document,
  // the reference will be set automatically
  @override
  Future<void> add(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    await _firestore.collection(collectionPath).add(data);
  }

  // With the document reference we can add/replace it with
  // the data provided
  @override
  Future<void> addWithReference(
      {required String documentPath,
      required Map<String, dynamic> data}) async {
    await _firestore.doc(documentPath).set(data);
  }

  // We use the document reference to delete it
  @override
  Future<void> deleteDoc({required String documentPath}) async {
    await _firestore.doc(documentPath).delete();
  }

  // We read the document specified by the document reference
  @override
  Future<Map<String, dynamic>?> readDoc({required String documentPath}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.doc(documentPath).get();
    return snapshot.data();
  }

  // We get all the documents inside the collection
  // specified by te collection reference
  @override
  Future<List<Map<String, dynamic>>> readCollection(
      {required String collectionPath}) async {
    // Since we are going to fetch users interaction data,
    // we can establish a fetch window, 24 hours in this case.

    // IMPORTANT! This query is case specific.

    // H * m * s * ms
    final lifeSpan = 24 * 60 * 60 * 1000;
    final minimumTimestamp = Timestamp.fromMillisecondsSinceEpoch(
        Timestamp.now().millisecondsSinceEpoch - lifeSpan);

    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection(collectionPath)
        .where('timestamp', isGreaterThanOrEqualTo: minimumTimestamp)
        .orderBy('timestamp', descending: true)
        .limit(15)
        .get();
    List<Map<String, dynamic>> docs = [];
    // Since we fetch all the documents within the collection,
    // we also need to save the references of each of the documents,
    // so that, if necessary, we can apply actions on them in firestore later.
    snapshot.docs.forEach((document) {
      docs.add({
        "ref": document.reference.path,
        "data": document.data(),
      });
    });
    return docs;
  }

  // We update the specified fields in the document
  // specified by the document reference
  @override
  Future<void> updateDoc(
      {required String documentPath,
      required Map<String, dynamic> data}) async {
    await _firestore.doc(documentPath).update(data);
  }
}
