import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isbue/config/helpers/is_device.dart';
import '../../widgets/custom_button_login.dart';
import '../infrastructure/verify_user.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    isDevice isdevice = isDevice();
    String urlIsbueIcon = 'assets/images/isbue-icon.png';

    // Controladores para los campos de texto
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SizedBox(
          // Controlamos el dispositivo que es para ajustar el tamaño
          width: isdevice.isTablet() ? 600.0 : double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 120),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                      width: isdevice.isTablet() ? 400.0 : double.infinity,
                      urlIsbueIcon),
                  InputLogin(
                    labelText: 'Email',
                    hintText: 'Introduzca el email',
                    controller: emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InputLogin(
                      labelText: 'Contraseña',
                      hintText: 'Introduzca la contraseña',
                      controller: passwordController,
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: CustomButtonLogin(
                        onPressed: () async {
                          bool usuarioValido = await verificarUsuario(
                              emailController.text, passwordController.text);
                          if (usuarioValido) {
                            context.push('/mfa'); // Usa el router para navegar
                          } else {
                            // Muestra un mensaje de error
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Usuario o contraseña incorrectos')),
                            );
                          }
                        },
                        label: 'Entrar',
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputLogin extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller; // Agregar esto
  const InputLogin({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Y finalmente esto
      obscureText: labelText == "Contraseña",
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
