import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:red_egresados/domain/use_case/auth_management.dart';
import 'package:red_egresados/presentation/pages/content/index.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const SignUpPage({Key? key, required this.onViewSwitch}) : super(key: key);

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
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
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
                      onPressed: () async {
                        var result = await AuthManagement.signUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text);
                        if (result) {
                          Get.off(() => ContentPage());
                        }
                      },
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
            Spacer(),
          ],
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
