import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/userJob.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/domain/use_case/jobs_management.dart';

class PublishOffer extends StatefulWidget {
  final JobsManager manager;

  PublishOffer({required this.manager});

  @override
  createState() => _State();
}

class _State extends State<PublishOffer> {
  late Controller controller;
  late bool _buttonDisabled;
  late TextEditingController offerController;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    _buttonDisabled = false;
    offerController = TextEditingController();
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
              "Publicar Oferta",
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: offerController,
                keyboardType: TextInputType.multiline,
                // dynamic text lines
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Oferta',
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
                              UserJob offer = UserJob(
                                picUrl: user.photoURL!,
                                name: user.displayName!,
                                email: user.email!,
                                message: offerController.text,
                              );
                              widget.manager.sendOffer(offer).then(
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
    offerController.dispose();
    super.dispose();
  }
}
