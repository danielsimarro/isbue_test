import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Color.fromRGBO(73, 37, 185, 1);

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
          ),
          headlineSmall: TextStyle(
              color: Color.fromRGBO(73, 37, 185, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          displaySmall:
              TextStyle(color: Color.fromRGBO(73, 37, 185, 1), fontSize: 16.0)),
      // Asegura que el Drawer no herede el seed color configurando el color del canvasColor
      canvasColor: Colors.white, // Esto hará que el fondo del Drawer sea blanco
    );
  }
}
