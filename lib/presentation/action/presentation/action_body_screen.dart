import 'package:flutter/material.dart';

import '../../clients/infrastructure/custom_form.dart';
import '../../widgets/custom_button_login.dart';

// Asume que CustomForm está en el mismo archivo por simplicidad.
// Si no, asegúrate de importar correctamente CustomForm desde su ubicación.

class ActionBodyScreen extends StatefulWidget {
  const ActionBodyScreen({super.key});

  @override
  ActionBodyScreenState createState() => ActionBodyScreenState();
}

class ActionBodyScreenState extends State<ActionBodyScreen> {
  // Define claves para cada formulario
  final GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();

  // Define referencias a los CustomForm
  late CustomForm form5;

  @override
  void initState() {
    super.initState();
    // Inicializa las instancias de CustomForm aquí para usar las claves definidas
    form5 = CustomForm(
      formTitle: 'Cobro',
      fieldLabels: const ['Concepto', 'Importe', 'Comentario'],
      formKey: _formKey5,
    );
  }

  void _submitAllForms() {
    if (_formKey5.currentState!.validate()) {
      form5.controllers.forEach((label, controller) {
        print('$label: ${controller.text}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(231, 231, 231, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            form5,
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButtonLogin(
                onPressed: _submitAllForms,
                label: 'Guardar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
