import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/userJob.dart';
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
  late final JobsManager manager;
  late Future<List<UserJob>> futureOffers;

  @override
  void initState() {
    super.initState();
    manager = JobsManager();
    futureOffers = manager.getStatuses();
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
                    manager: manager,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<UserJob>>(
            future: futureOffers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    UserJob offer = items[index];
                    return UserOfferCard(
                      title: offer.name,
                      content: offer.message,
                      picUrl: offer.picUrl,
                      onChat: () => {},
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
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
