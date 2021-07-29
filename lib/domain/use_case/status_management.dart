import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_egresados/data/repositories/firestore_database.dart';
import 'package:red_egresados/domain/models/userStatus.dart';

class StatusManager {
  final _database = FirestoreDB();

  Future<void> sendStatus(UserStatus status) async {
    await _database.add(collectionPath: "statuses", data: status.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStatusesStream() {
    return _database.listenCollection(collectionPath: "statuses");
  }

  Future<List<UserStatus>> getStatusesOnce() async {
    final statusesData =
        await _database.readCollection(collectionPath: "statuses");
    return _extractInstances(statusesData);
  }

  List<UserStatus> extractStatuses(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final statusesData = _database.extractDocs(snapshot);
    return _extractInstances(statusesData);
  }

  Future<void> removeStatus(UserStatus status) async {
    await _database.deleteDoc(documentPath: status.dbRef!);
  }

  List<UserStatus> _extractInstances(List<Map<String, dynamic>> data) {
    List<UserStatus> statuses = [];
    data.forEach((statusJson) {
      statuses.add(UserStatus.fromJson(statusJson));
    });
    return statuses;
  }
}
