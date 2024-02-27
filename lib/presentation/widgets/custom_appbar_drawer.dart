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
            height: 1, // Line color
          ),
          const ListViewOptions(
            label: 'Clientes',
            route: '/clientes',
            menuIcon: Icons.supervisor_account_outlined,
          ),
          const ListViewOptions(
            label: 'Ruta',
            route: '/',
            menuIcon: Icons.route_outlined,
          ),
          const ListViewOptions(
            label: 'Clientes cercanos',
            route: '/singleclient',
            menuIcon: Icons.supervised_user_circle_rounded,
          ),
          const ListViewOptions(
            label: 'Artículos',
            route: '/',
            menuIcon: Icons.article_outlined,
          ),
          const ListViewOptions(
            label: 'Mis incidencias',
            route: '/',
            menuIcon: Icons.event_outlined,
          ),
          const ListViewOptions(
            label: 'Incidencias sin agente',
            route: '/',
            menuIcon: Icons.support_agent_outlined,
          ),
          const ListViewOptions(
            label: 'Tiendas virtuales',
            route: '/',
            menuIcon: Icons.shop_2_outlined,
          ),
          const ListViewOptions(
            label: 'Resumen pedidos',
            route: '/',
            menuIcon: Icons.shopping_cart_outlined,
          ),
          const ListViewOptions(
              label: 'Resumen albaranes',
              route: '/',
              menuIcon: Icons.receipt_long_rounded),
          const ListViewOptions(
              label: 'Resumen cobros',
              route: '/',
              menuIcon: Icons.request_page_outlined),
          const ListViewOptions(
              label: 'Resumen visitas',
              route: '/',
              menuIcon: Icons.preview_outlined),
          const ListViewOptions(
              label: 'TPV', route: '/', menuIcon: Icons.tv_outlined),
          const ListViewOptions(
              label: 'Notas', route: '/', menuIcon: Icons.event_note_outlined),

          // Agrega más elementos aquí
        ],
      ),
    );
  }
}

class ListViewOptions extends StatefulWidget {
  final String label;
  final String route;
  final IconData menuIcon;

  const ListViewOptions(
      {super.key, required this.label, required this.route, IconData? menuIcon})
      : menuIcon = menuIcon ?? Icons.star;

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
          Divider(height: _isHovered ? 2 : 0, color: Colors.grey),
          Container(
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color.fromRGBO(73, 37, 185, 1)
                  : Colors.white, // Cambia el color de fondo
            ),
            child: ListTile(
              leading: Icon(widget.menuIcon,
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
              height: _isHovered ? 2 : 0, color: Colors.grey), // Bottom Line
        ],
      ),
    );
  }
}
