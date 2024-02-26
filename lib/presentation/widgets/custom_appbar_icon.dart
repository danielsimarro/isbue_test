import 'package:flutter/material.dart';

class CustomAppbarIcon extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImply;
  const CustomAppbarIcon({super.key, required this.automaticallyImply});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: SizedBox(
            height: 60,
            child: Image.asset('assets/images/Isbue_Isotipo-V13.png',
                fit: BoxFit.cover),
          ),
          onPressed: () {
            // Acción para volver a la pantalla anterior
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); // Proporciona el tamaño preferido para el AppBar
}
