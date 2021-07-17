import 'package:red_egresados/domain/models/publicJob.dart';

// Work Pool service interface
abstract class MisionTicService {
  Future<List<PublicJob>> fecthData({int limit, Map map});
}
