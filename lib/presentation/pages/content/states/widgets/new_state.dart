import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/userStatus.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/domain/use_case/status_management.dart';

class PublishDialog extends StatefulWidget {
  final StatusManager manager;

  PublishDialog({required this.manager});

  @override
  createState() => _State();
}

class _State extends State<PublishDialog> {
  late Controller controller;
  late bool _buttonDisabled;
  late TextEditingController stateController;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    _buttonDisabled = false;
    stateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Publicar Estado",
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: stateController,
                keyboardType: TextInputType.multiline,
                // dynamic text lines
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estado',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text("Publicar"),
                    onPressed: _buttonDisabled
                        ? null
                        : () {
                            setState(() {
                              _buttonDisabled = true;
                              User user = controller.currentUser.value!;
                              UserStatus status = UserStatus(
                                picUrl: user.photoURL!,
                                name: user.displayName!,
                                email: user.email!,
                                message: stateController.text,
                              );
                              widget.manager.sendStatus(status).then(
                                    (value) => Get.back(),
                                  );
                            });
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    stateController.dispose();
    super.dispose();
  }
}
