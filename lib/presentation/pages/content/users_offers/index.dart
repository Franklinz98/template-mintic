import './widgets/offer_card.dart';
import 'package:flutter/material.dart';

class UsersOffers extends StatelessWidget {

  // UsersOffers empty constructor
  UsersOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // PostCard usage example
        PostCard(
          title: 'Ludvig Wiese',
          content:
              'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
          picUrl:
              'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
          onChat: () => {},
        ),
      ],
    );
  }
}
