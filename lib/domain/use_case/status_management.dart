import 'package:red_egresados/data/repositories/firestore_database.dart';
import 'package:red_egresados/domain/models/userStatus.dart';

class StatusManager {
  final _database = FirestoreDB();

  Future<void> sendStatus(UserStatus status) async {
    await _database.add(collectionPath: "statuses", data: status.toJson());
  }

  Future<List<UserStatus>> getStatuses() async {
    List<UserStatus> statuses = [];
    final statusesData =
        await _database.readCollection(collectionPath: "statuses");
    statusesData.forEach((statusJson) {
      statuses.add(UserStatus.fromJson(statusJson));
    });
    return statuses;
  }

  Future<void> removeStatus(UserStatus status) async {
    await _database.deleteDoc(documentPath: status.dbRef!);
  }
}
