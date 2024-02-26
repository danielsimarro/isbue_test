import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/helpers/is_device.dart';

class CustomAppbarDrawer extends StatelessWidget {
  const CustomAppbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    isDevice isdevice = isDevice();
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: isdevice.isTablet() ? 15 : 30,
                left: 20,
                bottom: isdevice.isTablet() ? 15 : 20),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Instalación 1',
                    style: Theme.of(context).textTheme.headlineSmall),
                const Text(
                  'Manolito Agenda',
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1, // Color de la línea
          ),
          const ListViewOptions(
            label: 'Clientes',
            route: '/clientes',
          ),
          const ListViewOptions(
            label: 'Ruta',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Clientes cercanos',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Artículos',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Mis incidencias',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Incidencias sin agente',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Tiendas virtuales',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Resumen pedidos',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Resumen albaranes',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Resumen cobros',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Resumen visitas',
            route: '/',
          ),
          const ListViewOptions(
            label: 'TPV',
            route: '/',
          ),
          const ListViewOptions(
            label: 'Notas',
            route: '/',
          ),

          // Agrega más elementos aquí
        ],
      ),
    );
  }
}

class ListViewOptions extends StatefulWidget {
  final String label;
  final String route;

  const ListViewOptions({
    super.key,
    required this.label,
    required this.route,
  });

  @override
  State<ListViewOptions> createState() => _ListViewOptionsState();
}

class _ListViewOptionsState extends State<ListViewOptions> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color.fromRGBO(73, 37, 185, 1)
                  : Colors.white, // Cambia el color de fondo
            ),
            child: ListTile(
              leading: Icon(Icons.star,
                  color: _isHovered
                      ? Colors.white
                      : const Color.fromRGBO(73, 37, 185, 1)),
              title: Text(
                widget.label,
                style:
                    TextStyle(color: _isHovered ? Colors.white : Colors.black),
              ),
              onTap: () {
                context.push(widget.route);
              },
            ),
          ),
          Divider(
              height: _isHovered ? 2 : 0, color: Colors.grey), // Línea inferior
        ],
      ),
    );
  }
}
