import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/data/services/work_pool.dart';
import 'package:red_egresados/domain/models/publicJob.dart';
import 'package:red_egresados/domain/services/misiontic_interface.dart';
import 'package:red_egresados/presentation/pages/chat/index.dart';
import 'package:red_egresados/presentation/pages/content/chats/widgets/chat_card.dart';

class UserMessages extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserMessages> {
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
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ChatCard(
          pictureUrl:
              "https://hips.hearstapps.com/digitalspyuk.cdnds.net/16/03/1453464693-movies-avatar-still-02.jpg",
          name: "John Doe",
          message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          onTap: () {
            Get.to(() => ChatPage());
          },
        );
      },
    );
  }
}
