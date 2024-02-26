import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  const CustomLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          label,
        ),
      ),
    );
  }
}
