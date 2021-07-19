import 'package:flutter/material.dart';
import 'package:red_egresados/data/services/work_pool.dart';
import 'package:red_egresados/domain/models/publicJob.dart';
import 'package:red_egresados/domain/services/misiontic_interface.dart';
import 'widgets/offer_card.dart';

class PublicOffers extends StatefulWidget {
  // PublicOffes empty constructor
  PublicOffers({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PublicOffers> {
  late MisionTicService service;
  late Future<List<PublicJob>> futureJobs;

  @override
  void initState() {
    super.initState();
    service = WorkPoolService();
    futureJobs = service.fecthData() as Future<List<PublicJob>>;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PublicJob>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              PublicJob job = items[index];
              return OfferCard(
                title: job.title,
                content: job.description,
                arch: job.category,
                level: job.experience,
                payment: job.payment,
                onCopy: () => {},
                onApply: () => {},
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
