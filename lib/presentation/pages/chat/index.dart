import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/presentation/pages/chat/messages/index.dart';
import 'package:red_egresados/presentation/widgets/appbar.dart';

class ChatPage extends StatelessWidget {
  // Dependency injection: State management controller
  final Controller controller = Get.find();

  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        key: Key("pageTitle"),
        // Fetching state value, with reactivity using Obx
        tile: Text(
          "test".toUpperCase(),
          style: Theme.of(context).textTheme.headline1,
        ),
        picUrl: controller.currentUser.value!.photoURL ??
            'https://ui-avatars.com/api/',
        context: context,
        onAction: () => Get.back(),
        home: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            // Fetching state value, with reactivity using Obx
            child: UserChat(),
          ),
        ),
      ),
    );
  }
}
