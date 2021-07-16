import 'package:flutter/material.dart';

import 'login/login_page.dart';
import 'signup/signup_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Authentication> {
  Widget? _content;

  // NavBar action
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 1:
          _content = LoginPage(
            onViewSwitch: () => _onItemTapped(2),
          );
          break;
        case 2:
          _content = SignUpPage(
            onViewSwitch: () => _onItemTapped(1),
          );
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _content = LoginPage(onViewSwitch: () => _onItemTapped(2));
  }

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _content,
          ),
        ),
      ),
    );
  }
}
