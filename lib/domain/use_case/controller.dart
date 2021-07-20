import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Observables
  // Using Rx<> for custom class reactivity
  var currentUser = Rx<User?>(null);
  var screenIndex = 0.obs;

  void updateUser(User? userAuth) {
    currentUser.value = userAuth;
  }

  void updateScreenIndex(int index) {
    screenIndex.value = index;
  }
}
