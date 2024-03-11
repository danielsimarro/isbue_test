import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/helpers/is_device.dart';

class CustomAppbarEndDrawer extends StatelessWidget {
  const CustomAppbarEndDrawer({super.key});

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
                Text('Acciones',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1, // Line color
          ),
          const ListViewOptions(
            label: 'Accion 1',
            route: '/actionOneSingleClientScreen',
            menuIcon: Icons.supervisor_account_outlined,
          ),
          const ListViewOptions(
            label: 'Accion 2',
            route: '/',
            menuIcon: Icons.route_outlined,
          ),
          const ListViewOptions(
            label: 'Accion 3',
            route: '/singleclient',
            menuIcon: Icons.supervised_user_circle_rounded,
          ),
          const ListViewOptions(
            label: 'Accion 4',
            route: '/articulos',
            menuIcon: Icons.article_outlined,
          )
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
