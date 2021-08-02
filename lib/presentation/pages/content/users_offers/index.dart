import 'package:flutter/material.dart';
import 'widgets/offer_card.dart';

class UsersOffers extends StatefulWidget {
  // UsersOffers empty constructor
  UsersOffers({Key? key}) : super(key: key);

/*
  User HERE the created state for this widget, as explained by the instructor.
 */
}

class _State extends State<UsersOffers> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PostCard(
          title: 'Ludvig Wiese',
          content:
              'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
          picUrl:
              'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
          onChat: () => {},
        );
      },
    );
  }
}
