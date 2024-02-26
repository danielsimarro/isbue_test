import 'package:flutter/material.dart';
import 'package:isbue/presentation/widgets/custom_drawer_icon.dart';
import '../../widgets/custom_appbar_drawer.dart';
import '../../widgets/custom_button_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final searchController = TextEditingController();

    return Scaffold(
      key: scaffoldKey, // Asigna el GlobalKey aquí
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del cuadro de búsqueda
                  borderRadius:
                      BorderRadius.circular(15.0), // Bordes redondeados
                  border: Border.all(
                      color: Colors.grey), // Borde del cuadro de búsqueda
                ),
                child: InputLogin(
                  hintText: 'Buscar ...',
                  controller: searchController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text('Últimas noticias',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              Container(
                // Cuadro para las últimas noticias
                width: double.infinity, // Ocupa todo el ancho
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del cuadro de noticias
                  borderRadius:
                      BorderRadius.circular(15.0), // Bordes redondeados
                  border: Border.all(
                      color: Colors.grey), // Borde del cuadro de noticias
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Espacio entre párrafos
                      Text(
                        'La potencia sin control no sirve.\nEsto decía Pirelli hace 30 años en una exitosa campaña de publicidad: La potencia sin control no sirve de nada.\n\nLlevaba razón, mucha razón. Con Isbue tienes el control que tu empresa necesita.\n\nAprovecha Isbue, Controla tu empresa.',
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Asegura que los hijos se distribuyan al inicio y al final de la fila.
                  children: [
                    Text(
                      'Hoy',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(), // Crea un espacio flexible entre el texto y el botón.
                    CustomButtonLogin(
                      label: 'Ver todo',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const ListCustom(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Asegura que los hijos se distribuyan al inicio y al final de la fila.
                  children: [
                    Text(
                      'Otro ejemplo',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(), // Crea un espacio flexible entre el texto y el botón.
                    CustomButtonLogin(
                      label: 'Ver todo',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const ListCustom()
            ],
          ),
        ),
      ),
    );
  }
}

class InputLogin extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const InputLogin({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hintText,
      ),
    );
  }
}

class ListCustom extends StatelessWidget {
  const ListCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children:
                List.generate(4, (index) => _buildListItem(index, context)),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(int index, BuildContext context) {
    return Container(
      decoration: mainBoxSelect(
          index), // Asume que esta función devuelve una BoxDecoration
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Alinea los widgets al inicio de la columna cruzada
          children: [
            Expanded(
              // Usa Expanded para que el título y el subtítulo ocupen todo el espacio disponible, menos el trailing
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinea el texto al inicio
                children: [
                  Text('[169] Cliente pepito $index',
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(
                      height: 4), // Espacio entre el título y el subtítulo
                  Text('Descripción incidencia $index Lorem ipsum asdfasfd ...',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text('01/01/2024',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall), // Trailing alineado con el título
          ],
        ),
      ),
    );
  }

  BoxDecoration mainBoxSelect(int i) {
    return BoxDecoration(
      color: i % 2 == 0 ? Colors.white : Colors.transparent,
      border: Border(
        left: const BorderSide(color: Colors.black, width: 1),
        right: const BorderSide(color: Colors.black, width: 1),
        top: const BorderSide(color: Colors.black, width: 1),
        bottom: i == 3
            ? const BorderSide(color: Colors.black, width: 1)
            : BorderSide.none,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(i == 0 ? 16 : 0),
        topRight: Radius.circular(i == 0 ? 16 : 0),
        bottomLeft: Radius.circular(i == 3 ? 16 : 0),
        bottomRight: Radius.circular(i == 3 ? 16 : 0),
      ), // Radio del borde del contenedor
    );
  }
}
