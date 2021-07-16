import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String picUrl;
  final BuildContext context;
  final VoidCallback onSignOff;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar(
      {Key? key,
      required this.context,
      required this.picUrl,
      required this.onSignOff})
      : super(
            key: key,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Center(
              child: CircleAvatar(
                minRadius: 18.0,
                maxRadius: 18.0,
                backgroundImage: NetworkImage(picUrl),
              ),
            ),
            title: Text(
              'title'.toUpperCase(),
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: onSignOff,
              )
            ]);
}
