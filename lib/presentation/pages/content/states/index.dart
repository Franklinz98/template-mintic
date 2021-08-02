import 'package:flutter/material.dart';
import 'widgets/state_card.dart';

class UsersStates extends StatefulWidget {
  // UsersStates empty constructor
  UsersStates({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersStates> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return StateCard(
          title: 'Iony Houst',
          content: 'Lorem ipsum dolor sit amet.',
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          onChat: () => {},
        );
      },
    );
  }
}
