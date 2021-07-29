import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_egresados/data/repositories/firestore_database.dart';
import 'package:red_egresados/domain/models/userJob.dart';

class JobsManager {
  final _database = FirestoreDB();

  Future<void> sendOffer(UserJob job) async {
    await _database.add(collectionPath: "communityOffers", data: job.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getJobsStream() {
    return _database.listenCollection(collectionPath: "communityOffers");
  }

  Future<List<UserJob>> getJobsOnce() async {
    final offersData =
        await _database.readCollection(collectionPath: "communityOffers");
    return _extractInstances(offersData);
  }

  List<UserJob> extractOffers(QuerySnapshot<Map<String, dynamic>> snapshot) {
    final offersData = _database.extractDocs(snapshot);
    return _extractInstances(offersData);
  }

  Future<void> removeOffer(UserJob offer) async {
    await _database.deleteDoc(documentPath: offer.dbRef!);
  }

  List<UserJob> _extractInstances(List<Map<String, dynamic>> data) {
    List<UserJob> offers = [];
    data.forEach((statusJson) {
      offers.add(UserJob.fromJson(statusJson));
    });
    return offers;
  }
}
