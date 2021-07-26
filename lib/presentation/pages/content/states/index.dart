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
  late Future<List<UserStatus>> futureStatuses;

  @override
  void initState() {
    super.initState();
    manager = StatusManager();
    futureStatuses = manager.getStatuses();
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
          child: FutureBuilder<List<UserStatus>>(
            future: futureStatuses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    UserStatus status = items[index];
                    return StateCard(
                      title: status.name,
                      content: status.message,
                      picUrl: status.picUrl,
                      onChat: () {
                        manager.removeStatus(status).then((value) {
                          // After delete status we refresh the list
                          setState(() {
                            futureStatuses = manager.getStatuses();
                          });
                        });
                      },
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
