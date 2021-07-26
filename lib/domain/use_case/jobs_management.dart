import 'package:red_egresados/data/repositories/firestore_database.dart';
import 'package:red_egresados/domain/models/userJob.dart';

class JobsManager {
  final _database = FirestoreDB();

  Future<void> sendStatus(UserJob job) async {
    await _database.add(collectionPath: "communityOffers", data: job.toJson());
  }

  Future<List<UserJob>> getStatuses() async {
    List<UserJob> statuses = [];
    final statusesData =
        await _database.readCollection(collectionPath: "communityOffers");
    statusesData.forEach((statusJson) {
      statuses.add(UserJob.fromJson(statusJson));
    });
    return statuses;
  }

  Future<void> removeStatus(UserJob status) async {
    await _database.deleteDoc(documentPath: status.dbRef!);
  }
}
