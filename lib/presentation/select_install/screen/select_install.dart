import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isbue/config/helpers/is_device.dart';
import 'package:isbue/presentation/widgets/custom_appbar_icon.dart';
import 'package:isbue/presentation/widgets/custom_label.dart';

import '../../widgets/custom_icon_select_install.dart';

class SelectInstall extends StatelessWidget {
  const SelectInstall({super.key});

  @override
  Widget build(BuildContext context) {
    isDevice isdevice = isDevice();
    return Scaffold(
      appBar: const CustomAppbarIcon(
        automaticallyImply: false,
      ),
      body: Center(
        child: SizedBox(
          // Controlamos el dispositivo que es para ajustar el tamaño
          width: isdevice.isTablet() ? 600.0 : double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CustomLabel(
                    label:
                        'Selecciona la instalación a la que quieres acceder'),
                for (int i = 1; i <= 4; i++) // Genera 4 widgets
                  Container(
                    height: 70,
                    decoration: mainBoxSelect(i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3, // Proporción para el texto
                            child: Text('Instalación $i',
                                textAlign: TextAlign.left),
                          ),
                          SizedBox(
                            width: 45,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(73, 37, 185, 1),
                                  borderRadius: BorderRadius.circular(
                                      12), // Radio del borde del contenedor
                                ),
                                child: buttonSelect(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buttonSelect(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.push('/home');
        },
        icon: Padding(
          padding: const EdgeInsets.only(left: 5.5),
          child: CustomPaint(
            painter:
                TrianglePainter(color: const Color.fromRGBO(217, 217, 217, 1)),
            size: const Size(23, 23),
          ),
        ));
  }

  BoxDecoration mainBoxSelect(int i) {
    return BoxDecoration(
      border: Border(
        left: const BorderSide(color: Colors.black, width: 1),
        right: const BorderSide(color: Colors.black, width: 1),
        top: const BorderSide(color: Colors.black, width: 1),
        bottom: i == 4
            ? const BorderSide(color: Colors.black, width: 1)
            : BorderSide.none,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(i == 1 ? 16 : 0),
        topRight: Radius.circular(i == 1 ? 16 : 0),
        bottomLeft: Radius.circular(i == 4 ? 16 : 0),
        bottomRight: Radius.circular(i == 4 ? 16 : 0),
      ), // Radio del borde del contenedor
    );
  }
}
