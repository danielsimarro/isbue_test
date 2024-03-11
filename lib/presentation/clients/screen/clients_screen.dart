import 'package:flutter/material.dart';
import 'package:isbue/presentation/widgets/custom_drawer_icon.dart';
import '../../widgets/custom_appbar_drawer.dart';
import '../infrastructure/custom_table.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey, // Asigna el GlobalKey aquí
        appBar: AppBar(
          title: const Text(
            'Clientes',
            style: TextStyle(
                color: Color.fromRGBO(73, 37, 185, 1),
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const CustomDrawerIcon(),
            onPressed: () =>
                scaffoldKey.currentState?.openDrawer(), // Abre el drawer
          ),
          actions: <Widget>[
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
        body: SingleChildScrollView(
            child: MyCustomTable(
          listTable: List.generate(
            40,
            (row) => List.generate(4, (col) => 'Celda $row, $col'),
          ),
        )));
  }
}
