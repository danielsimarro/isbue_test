import 'dart:convert';
import 'package:flutter/services.dart';

Future<bool> verificarMfa(String codeInut) async {
  // Cargar el archivo JSON
  final String response = await rootBundle.loadString('assets/data/mfa.json');
  final codes = await json.decode(response);

  for (var code in codes) {
    if (code['number'] == codeInut) {
      return true;
    }
  }
  return false;
}
