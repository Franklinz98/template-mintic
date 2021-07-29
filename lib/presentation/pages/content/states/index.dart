import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/models/userStatus.dart';
import 'package:red_egresados/domain/use_case/status_management.dart';
import 'package:red_egresados/presentation/pages/content/states/widgets/new_state.dart';
import 'widgets/state_card.dart';

class UsersStates extends StatefulWidget {
  // UsersStates empty constructor
  UsersStates({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersStates> {
  late final StatusManager manager;
  late Stream<QuerySnapshot<Map<String, dynamic>>> statusesStream;

  @override
  void initState() {
    super.initState();
    manager = StatusManager();
    statusesStream = manager.getStatusesStream();
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
                Get.dialog(PublishDialog(
                  manager: manager,
                ));
              },
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: statusesStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final items = manager.extractStatuses(snapshot.data!);
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    UserStatus status = items[index];
                    return StateCard(
                      title: status.name,
                      content: status.message,
                      picUrl: status.picUrl,
                      onChat: () {
                        manager.removeStatus(status);
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
