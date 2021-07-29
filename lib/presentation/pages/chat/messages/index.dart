import 'package:flutter/material.dart';
import 'package:red_egresados/data/services/work_pool.dart';
import 'package:red_egresados/domain/models/publicJob.dart';
import 'package:red_egresados/domain/services/misiontic_interface.dart';
import 'package:red_egresados/presentation/pages/chat/messages/widgets/message.dart';
import 'package:red_egresados/presentation/theme/colors.dart';

class UserChat extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserChat> {
  late Future<List<PublicJob>> futureJobs;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return MessageBubble(
                remote: index % 2 == 0,
                message: "Lorem ipsum dolor sit amet.",
                onHold: () => {},
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: messageController,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Container(
                width: 48.0,
                height: 48.0,
                child: RawMaterialButton(
                  fillColor: AppColors.mountainMeadow,
                  shape: CircleBorder(),
                  elevation: 0.0,
                  child: Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
