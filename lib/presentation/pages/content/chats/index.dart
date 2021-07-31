import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/chat.dart';
import 'package:red_egresados/domain/models/publicJob.dart';
import 'package:red_egresados/domain/models/user.dart';
import 'package:red_egresados/domain/use_case/chat_management.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/presentation/pages/chat/index.dart';
import 'package:red_egresados/presentation/pages/content/chats/widgets/chat_card.dart';

class UserMessages extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserMessages> {
  late Controller controller;
  late final ChatManager manager;
  late Stream<QuerySnapshot<Map<String, dynamic>>> chatsStream;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    manager = ChatManager();
    chatsStream = manager.getChatList(controller.currentUser.value!.email!);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: chatsStream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          final items = manager.extractChats(snapshot.data!);
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Chat chat = items[index];
              ChatUser user =
                  chat.getTargetUser(controller.currentUser.value!.email!);
              return ChatCard(
                pictureUrl: user.pictureUrl,
                name: user.name,
                message: chat.lastMessage.message,
                time: chat.lastMessage.timestamp!,
                onTap: () {
                  Get.to(
                    () => ChatPage(chat: chat),
                  );
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
    );
  }
}
