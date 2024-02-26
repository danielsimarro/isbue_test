import 'package:flutter/material.dart';

class CustomDrawerIcon extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double spacing;

  const CustomDrawerIcon({
    Key? key,
    this.width = 27.0,
    this.height = 3.0,
    this.color = Colors.black,
    this.spacing = 6.0, // Espacio entre las líneas
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 2 * height +
          2 * spacing, // Ajusta la altura basada en el número de líneas y el espaciado
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinea las líneas a la izquierda
        children: <Widget>[
          Container(
            width: width / 2, // La primera línea tiene la mitad de la longitud
            height: height,
            color: color,
          ),
          Container(
            width: width,
            height: height,
            color: color,
          ),
          Container(
            width: width,
            height: height,
            color: color,
          ),
        ],
      ),
    );
  }
}
