import 'package:get/get.dart';

class Controller extends GetxController {
  // Observables
  var currentUser = false.obs;
  var screenIndex = 0.obs;

  void updateUser(bool userAuth) {
    currentUser.value = userAuth;
  }

  void updateScreenIndex(int index) {
    screenIndex.value = index;
  }
}
