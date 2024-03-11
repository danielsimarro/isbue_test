import 'package:flutter/material.dart';

import '../../widgets/custom_button_login.dart';
import '../infrastructure/custom_form.dart';

// Asume que CustomForm está en el mismo archivo por simplicidad.
// Si no, asegúrate de importar correctamente CustomForm desde su ubicación.

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  // Define claves para cada formulario
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  // Define referencias a los CustomForm
  late CustomForm form1;
  late CustomForm form2;
  late CustomForm form3;

  @override
  void initState() {
    super.initState();
    // Inicializa las instancias de CustomForm aquí para usar las claves definidas
    form1 = CustomForm(
      formTitle: 'Datos básicos',
      fieldLabels: const ['Código', 'Referencia', 'Observaciones', 'Email'],
      formKey: _formKey1,
    );
    form2 = CustomForm(
      formTitle: 'Otros datos',
      fieldLabels: const ['Dato 1', 'Dato 2', 'Dato 3', 'Dato 4'],
      formKey: _formKey2,
    );
    form3 = CustomForm(
      formTitle: 'Otros datos 2',
      fieldLabels: const ['Dato 5', 'Dato 6', 'Dato 7', 'Dato 8'],
      formKey: _formKey3,
    );
  }

  void _submitAllForms() {
    if (_formKey1.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate()) {
      form1.controllers.forEach((label, controller) {
        print('$label: ${controller.text}');
        form1.controllers.forEach((label, controller) {});
        form2.controllers.forEach((label, controller) {
          print('$label: ${controller.text}');
        });
      });
      form3.controllers.forEach((label, controller) {
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
            form1,
            const SizedBox(height: 20),
            form2,
            const SizedBox(height: 20),
            form3,
            Padding(
              padding: const EdgeInsets.all(10),
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
