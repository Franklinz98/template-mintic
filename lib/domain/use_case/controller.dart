import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/use_case/auth_management.dart';

class Controller extends GetxController {
  // Observables
  var screenIndex = 0.obs;
  // Using Rx<> for custom class reactivity
  var currentUser = Rx<User?>(null);
  // Non reactive members
  late AuthManagement authManager;

  void updateUser(User? userAuth) {
    currentUser.value = userAuth;
  }

  void updateScreenIndex(int index) {
    screenIndex.value = index;
  }

  void updateAuthManager(AuthManagement authManagement) {
    authManager = authManagement;
  }
}
