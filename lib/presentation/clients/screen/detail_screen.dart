import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MySimpleForm();
  }
}

class MySimpleForm extends StatefulWidget {
  @override
  _MySimpleFormState createState() => _MySimpleFormState();
}

class _MySimpleFormState extends State<MySimpleForm> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildRow(String label) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.amber,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(label),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo del cuadro de búsqueda
                borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
                border: Border.all(
                    color: Colors.grey), // Borde del cuadro de búsqueda
              ),
              child: TextFormField(
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildRow('Label 1'),
          _buildRow('Label 2'),
          _buildRow('Label 3'),
          _buildRow('Label 4'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
