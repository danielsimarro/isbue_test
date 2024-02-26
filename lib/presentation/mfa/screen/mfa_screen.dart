import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:isbue/presentation/widgets/custom_appbar_icon.dart';
import 'package:isbue/presentation/widgets/custom_button_login.dart';
import 'package:isbue/presentation/widgets/custom_label.dart';

import '../../../config/helpers/is_device.dart';

class MfaScreen extends StatefulWidget {
  const MfaScreen({super.key});

  @override
  State<MfaScreen> createState() => _MfaScreenState();
}

class _MfaScreenState extends State<MfaScreen> {
  // Lista de controladores para manejar los valores de los inputs
  final List<TextEditingController> _controllers =
      List.generate(6, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    isDevice isdevice = isDevice();
    return Scaffold(
      appBar: const CustomAppbarIcon(
        automaticallyImply: false,
      ),
      body: Center(
        child: SizedBox(
          // Controlamos el dispositivo que es para ajustar el tamaño
          width: isdevice.isTablet() ? 600.0 : double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomLabel(
                    label:
                        'Introduce los 6 dígitos de tu aplicación de autenticación en dos pasos'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < _controllers.length; i++)
                        Container(
                          // Ajustamos los TextField
                          width: 54,
                          height: 65,
                          margin: const EdgeInsets.only(
                              right: 12), // Espacio entre cada TextField
                          child: TextField(
                            controller: _controllers[i],
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            textAlign: TextAlign
                                .center, // Centra el texto dentro del TextField
                            style: const TextStyle(
                              fontSize: 22, // Aumenta el tamaño del texto
                            ),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: CustomButtonLogin(
                      onPressed: () {
                        context.push('/selectinstall');
                      },
                      label: 'Validar',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
