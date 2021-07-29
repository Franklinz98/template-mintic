import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final bool home;
  final String picUrl;
  final BuildContext context;
  final VoidCallback onAction;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar(
      {Key? key,
      required this.context,
      required this.tile,
      required this.picUrl,
      required this.onAction,
      this.home = true})
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
                  home ? Icons.logout : Icons.close,
                ),
                onPressed: onAction,
              )
            ]);
}
