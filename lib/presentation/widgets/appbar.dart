import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final String picUrl;
  final BuildContext context;
  final VoidCallback onSignOff;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar(
      {Key? key,
      required this.context,
      required this.tile,
      required this.picUrl,
      required this.onSignOff})
      : super(
            key: key,
            centerTitle: true,
            leading: Center(
              child: CircleAvatar(
                minRadius: 18.0,
                maxRadius: 18.0,
                backgroundImage: NetworkImage(picUrl),
                backgroundColor: Colors.grey[200],
              ),
            ),
            title: tile,
            actions: [
              IconButton(
                key: Key("signOutAction"),
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: onSignOff,
              )
            ]);
}
