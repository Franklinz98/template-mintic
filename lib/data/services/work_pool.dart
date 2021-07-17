import 'dart:convert';
import 'package:red_egresados/domain/models/publicJob.dart';
import 'package:red_egresados/domain/services/misiontic_interface.dart';
import 'package:http/http.dart' as http;

class WorkPool implements MisionTicService {
  final String baseUrl = 'misiontic-2022-uninorte.herokuapp.com';
  final String apiKey = 'qbfoRDj34F7rX6u5Pp9JxuydaGXdGcGT5M9N1bJvFdVtosAcnCqmq';

  @override
  Future<List<PublicJob>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'limit': limit.toString(), 'key': apiKey};
    var uri = Uri.https(baseUrl, '/jobs', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      final List<PublicJob> jobs = [];
      for (var job in list['jobs']) {
        jobs.add(PublicJob.fromJson(job));
      }
      return jobs;
    } else {
      throw Exception('Error on request');
    }
  }
}
