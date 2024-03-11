import 'package:flutter/material.dart';
import 'package:isbue/presentation/clients/infrastructure/custom_table.dart';

import '../../widgets/custom_button_login.dart';
import '../infrastructure/custom_form.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // Define claves para cada formulario
  final GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();

  // Define referencias a los CustomForm
  late CustomForm form4;

  @override
  void initState() {
    super.initState();
    // Inicializa las instancias de CustomForm aquí para usar las claves definidas
    form4 = CustomForm(
      formTitle: 'Otros datos',
      fieldLabels: const ['Dato 1', 'Dato 2', 'Dato 3', 'Dato 4'],
      formKey: _formKey4,
    );
  }

  void _submitAllForms() {
    if (_formKey4.currentState!.validate()) {
      form4.controllers.forEach((label, controller) {
        print('$label: ${controller.text}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: const Color.fromRGBO(231, 231, 231, 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCustomTable(
              listTable: List.generate(
                6,
                (row) => List.generate(4, (col) => 'Celda $row, $col'),
              ),
            ),
            const SizedBox(height: 20),
            form4,
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
