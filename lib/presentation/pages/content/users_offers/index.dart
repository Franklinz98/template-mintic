import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/userJob.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/domain/use_case/jobs_management.dart';
import 'package:red_egresados/presentation/pages/content/users_offers/widgets/new_offer.dart';
import 'widgets/offer_card.dart';

class UsersOffers extends StatefulWidget {
  // UsersOffers empty constructor
  UsersOffers({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersOffers> {
  late Controller controller;
  late final JobsManager manager;
  late Stream<QuerySnapshot<Map<String, dynamic>>> offersStream;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    manager = JobsManager();
    offersStream = manager.getJobsStream();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Center(
            child: ElevatedButton(
              child: Text("Agregar"),
              onPressed: () {
                Get.dialog(
                  PublishOffer(
                    controller: controller,
                    manager: manager,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: offersStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final items = manager.extractOffers(snapshot.data!);
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    UserJob offer = items[index];
                    return UserOfferCard(
                      title: offer.name,
                      content: offer.message,
                      picUrl: offer.picUrl,
                      onChat: () => {},
                      onTap: () {
                        // If the offer email is the same as the current user,
                        // we know that the user is the owner of that offer.
                        if (offer.email ==
                            controller.currentUser.value!.email) {
                          Get.dialog(
                            PublishOffer(
                              controller: controller,
                              manager: manager,
                              userJob: offer,
                            ),
                          );
                        } else {
                          Get.snackbar(
                            "No Autorizado",
                            "No puedes editar esta oferta debido a que fue enviada por otro usuario.",
                          );
                        }
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong: ${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
