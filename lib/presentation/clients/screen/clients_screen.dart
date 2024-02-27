import 'package:flutter/material.dart';
import 'package:isbue/presentation/widgets/custom_drawer_icon.dart';
import '../../widgets/custom_appbar_drawer.dart';

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
        body: SingleChildScrollView(child: MyCustomTable()));
  }
}

class MyCustomTable extends StatelessWidget {
  final List<List<String>> data = List.generate(
    40,
    (row) => List.generate(4, (col) => 'Celda $row, $col'),
  );

  MyCustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border:
            TableBorder.all(color: const Color.fromARGB(255, 214, 214, 214)),
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(73, 37, 185, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: List.generate(
                4,
                (index) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Título $index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
          ),
          ...data.map((row) => TableRow(
                children: row
                    .map((cell) => Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(cell,
                              style: const TextStyle(color: Colors.black)),
                        ))
                    .toList(),
              )),
        ],
      ),
    );
  }
}
