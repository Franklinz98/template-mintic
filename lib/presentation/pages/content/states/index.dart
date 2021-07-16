import './widgets/state_card.dart';
import 'package:flutter/material.dart';

class UsersStates extends StatelessWidget {

  // UsersStates empty constructor
  UsersStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // StateCard usage example
        StateCard(
            title: 'Iony Houst',
            content: 'Lorem ipsum dolor sit amet.',
            picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
            onChat: () => {}),
      ],
    );
  }
}
