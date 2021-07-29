import 'package:flutter/material.dart';
import 'package:red_egresados/domain/use_case/controller.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onViewSwitch;
  final Controller controller;

  const SignUpPage(
      {Key? key, required this.onViewSwitch, required this.controller})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          key: Key("signupScroll"),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Creación de usuario",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  key: Key("signUpName"),
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  key: Key("signUpEmail"),
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
                  key: Key("signUpPassword"),
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
                        key: Key("signUpButton"),
                        onPressed: () async => widget.controller.authManager
                            .signUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text),
                        child: Text("Registrar"),
                      ),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: widget.onViewSwitch,
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
