import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:red_egresados/domain/use_case/auth_management.dart';
import 'package:red_egresados/domain/use_case/controller.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onViewSwitch;
  final Controller controller;

  const LoginPage(
      {Key? key, required this.onViewSwitch, required this.controller})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          key: Key("loginScroll"),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Iniciar sesión",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  key: Key("signInEmail"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo electrónico',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  key: Key("signInPassword"),
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clave',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ElevatedButton(
                          key: Key("signInButton"),
                          onPressed: () => widget.controller.authManager.signIn(
                              email: emailController.text,
                              password: passwordController.text),
                          child: Text("Login")),
                    ),
                  )
                ],
              ),
              TextButton(
                  key: Key("toSignUpButton"),
                  onPressed: widget.onViewSwitch,
                  child: Text("Registrarse")),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () =>
                    widget.controller.authManager.signInWithGoogle(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
