import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CustomButtonLogin(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(73, 37, 185, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontSize: 18 // Color del texto
                ),
      ),
    );
  }
}
