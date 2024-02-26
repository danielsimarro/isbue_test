import 'dart:convert';
import 'package:flutter/services.dart';

Future<bool> verificarUsuario(String email, String password) async {
  // Cargar el archivo JSON
  final String response = await rootBundle.loadString('assets/data/users.json');
  final data = await json.decode(response);

  // Buscar el usuario
  for (var usuario in data) {
    if (usuario['email'] == email && usuario['password'] == password) {
      return true; // Usuario encontrado
    }
  }
  return false; // Usuario no encontrado
}
