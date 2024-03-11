import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String formTitle;
  final List<String> fieldLabels;
  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> controllers = {};

  CustomForm({
    super.key,
    required this.formTitle,
    required this.fieldLabels,
    required this.formKey, // Asegúrate de pasar esto al constructor
  }) {
    // Inicializar los controladores para cada etiqueta de campo
    for (var label in fieldLabels) {
      controllers[label] = TextEditingController();
    }
  }

  @override
  CustomFormState createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  Widget _buildRow(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(label),
          ),
          Expanded(
            flex: 7,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo del cuadro de búsqueda
                borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
                border: Border.all(
                    color: Colors.grey), // Borde del cuadro de búsqueda
              ),
              child: TextFormField(
                controller: widget.controllers[
                    label], // Asegúrate de usar el controlador correspondiente
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Form(
        key: widget.formKey, // Usa la key pasada al widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                widget.formTitle,
                style: const TextStyle(
                    color: Color.fromRGBO(1, 40, 81, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            ...widget.fieldLabels.map(_buildRow),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in widget.controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
