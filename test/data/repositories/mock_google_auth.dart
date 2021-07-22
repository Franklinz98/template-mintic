import 'package:mockito/mockito.dart';
import 'package:red_egresados/data/repositories/google_auth.dart';

class MockGoogleAuth extends Mock implements GoogleAuth {
  @override
  Future<bool> signInWithGoogle() async {
    return true;
  }
}
