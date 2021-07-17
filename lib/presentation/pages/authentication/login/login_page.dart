import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:red_egresados/domain/use_case/auth_management.dart';
import 'package:red_egresados/presentation/pages/content/index.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const LoginPage({Key? key, required this.onViewSwitch}) : super(key: key);

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
                          onPressed: () async {
                            var result = await AuthManagement.signIn(
                                email: emailController.text,
                                password: passwordController.text);
                            if (result) {
                              Get.off(() => ContentPage());
                            }
                          },
                          child: Text("Login")),
                    ),
                  )
                ],
              ),
              TextButton(
                  key: Key("toSignUpButton"),
                  onPressed: widget.onViewSwitch,
                  child: Text("Registrarse")),
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
