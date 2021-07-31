import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/chat.dart';
import 'package:red_egresados/domain/models/message.dart';
import 'package:red_egresados/domain/models/user.dart';
import 'package:red_egresados/domain/use_case/chat_management.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/presentation/pages/chat/messages/index.dart';
import 'package:red_egresados/presentation/widgets/appbar.dart';

class ChatPage extends StatelessWidget {
  final Chat? chat;
  final ChatUser? localUser, remoteUser;
  late final ChatManager manager;

  ChatPage({this.chat, this.localUser, this.remoteUser}) {
    this.manager = ChatManager();
  }

  // Dependency injection: State management controller
  late final Controller controller = Get.find();

  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    User currentUser = controller.currentUser.value!;

    return Scaffold(
      appBar: CustomAppBar(
        // Fetching state value, with reactivity using Obx
        tile: Text(
          remoteUser?.name ?? chat!.getTargetUser(currentUser.email!).name,
          style: Theme.of(context).textTheme.headline1,
        ),
        picUrl: remoteUser?.pictureUrl ??
            chat!.getTargetUser(currentUser.email!).pictureUrl,
        context: context,
        onAction: () => Get.back(),
        home: false,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          // Fetching state value, with reactivity using Obx
          child: FutureBuilder<Chat>(
            future: _loadChatRecord(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Chat loadedChat = snapshot.data!;
                return ChatView(
                  chatReference: loadedChat.reference,
                  manager: manager,
                  localEmail: currentUser.email!,
                  updateChat: (message) async {
                    loadedChat.lastMessage = message;
                    await manager.updateChat(loadedChat);
                  },
                  onSend: (String message) async {
                    ChatMessage lastMessage = ChatMessage(
                        message: message, sender: currentUser.email!);
                    loadedChat.lastMessage = lastMessage;
                    if (loadedChat.reference != null) {
                      loadedChat.lastMessage = lastMessage;
                      await manager.sendMessage(loadedChat);
                    } else {
                      return await manager.createChat(loadedChat);
                    }
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<Chat> _loadChatRecord() async {
    late Chat currentChat;
    if (chat != null) {
      currentChat = chat!;
    } else {
      Chat? retrievedChat =
          await manager.checkIfChatExist(localUser!.email, remoteUser!.email);
      currentChat = retrievedChat ??
          Chat(
            userA: localUser!,
            userB: remoteUser!,
            lastMessage: ChatMessage(message: '', sender: ''),
          );
    }
    return currentChat;
  }
}
