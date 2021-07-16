import 'package:flutter/material.dart';
import 'package:red_egresados/presentation/theme/colors.dart';
import 'package:red_egresados/presentation/widgets/card.dart';

class PostCard extends StatelessWidget {
  final String title, content, picUrl;
  final VoidCallback onChat;

  // PostCard constructor
  PostCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onChat})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: title,
      content: content,
      // topLeftWidget widget as an Avatar
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(picUrl),
          ),
        ),
      ),
      // topRightWidget widget as an IconButton
      topRightWidget: IconButton(
        icon: Icon(
          Icons.chat_outlined,
          color: AppColors.mountainMeadow,
        ),
        onPressed: onChat,
      ),
    );
  }
}
