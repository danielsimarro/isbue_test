import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    // Define los puntos del triángulo (apuntando hacia la izquierda esta vez)
    path.moveTo(size.width, size.height / 2); // Punto medio derecho
    path.lineTo(0, 0); // Punto superior izquierdo
    path.lineTo(0, size.height); // Punto inferior izquierdo
    path.close(); // Cierra el path para formar el triángulo

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
