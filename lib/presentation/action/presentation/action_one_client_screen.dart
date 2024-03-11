import 'package:flutter/material.dart';
import 'package:isbue/presentation/widgets/custom_drawer_icon.dart';
import '../../widgets/custom_appbar_drawer.dart';
import '../../widgets/custom_appbar_enddrawer.dart';
import 'action_body_screen.dart';

class ActionOneSingleClientScreen extends StatelessWidget {
  const ActionOneSingleClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey, // Asigna el GlobalKey aquí
        appBar: AppBar(
          title: const Text(
            'Acción 1 - [169] Cliente pepito',
            style: TextStyle(
                color: Color.fromRGBO(73, 37, 185, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          leading: IconButton(
            icon: const CustomDrawerIcon(),
            onPressed: () =>
                scaffoldKey.currentState?.openDrawer(), // Abre el drawer
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () =>
                  scaffoldKey.currentState?.openEndDrawer(), // Abre el drawer
            ),
            IconButton(
              icon: SizedBox(
                height: 60,
                child: Image.asset('assets/images/Isbue_Isotipo-V13.png',
                    fit: BoxFit.cover),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        drawer: const CustomAppbarDrawer(),
        endDrawer: const CustomAppbarEndDrawer(),
        body: const ActionBodyScreen());
  }
}
