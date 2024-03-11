import 'package:flutter/material.dart';
import 'package:isbue/config/helpers/is_device.dart';
import 'package:isbue/presentation/clients/screen/detail_screen.dart';
import 'package:isbue/presentation/widgets/custom_drawer_icon.dart';
import '../../widgets/custom_appbar_drawer.dart';
import '../../widgets/custom_appbar_enddrawer.dart';
import 'information_screen.dart';

class SingleClientScreen extends StatelessWidget {
  const SingleClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey, // Asigna el GlobalKey aquí
        appBar: AppBar(
          title: const Text(
            '[169] Cliente pepito',
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
        body: const MiPantallaConPestanas());
  }
}

class MiPantallaConPestanas extends StatelessWidget {
  const MiPantallaConPestanas({super.key});

  @override
  Widget build(BuildContext context) {
    isDevice isdevice = isDevice();
    return DefaultTabController(
      length: 2, // Number Tab
      child: Scaffold(
        appBar: isdevice.isTablet()
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "Detalles",
                      ),
                      Tab(text: "Información"),
                    ],
                    isScrollable: false, // Ensures tabs are full width
                    indicatorSize: TabBarIndicatorSize.tab,

                    /// Makes the bottom line fill the tab's full width
                  ),
                ),
              ),
        body:
            isdevice.isTablet() ? const SideScrollScreen() : const LayoutTap(),
      ),
    );
  }
}

class SideScrollScreen extends StatefulWidget {
  const SideScrollScreen({super.key});

  @override
  SideScrollScreenState createState() => SideScrollScreenState();
}

class SideScrollScreenState extends State<SideScrollScreen> {
  // Inicializa el ancho del primer panel
  double _anchoPanelIzquierdo = 500.0;

  @override
  Widget build(BuildContext context) {
    // Asegúrate de que esta asignación se haga solo una vez, por eso la colocamos en initState
    if (_anchoPanelIzquierdo == 500.0) {
      _anchoPanelIzquierdo = MediaQuery.of(context).size.width / 2;
    }
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            SizedBox(width: _anchoPanelIzquierdo, child: const DetailScreen()),
            // Divisor ajustable
            GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  final newWidth = _anchoPanelIzquierdo + details.delta.dx;
                  const minWidth = 300.0;
                  final maxWidth = MediaQuery.of(context).size.width - minWidth;

                  _anchoPanelIzquierdo = newWidth.clamp(minWidth, maxWidth);
                });
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: Container(
                  width: 2,
                  color: const Color.fromARGB(255, 196, 196, 196),
                ),
              ),
            ),
            const Expanded(
              child: InformationScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutTap extends StatelessWidget {
  const LayoutTap({super.key});

  @override
  Widget build(BuildContext context) {
    // Layout for small screen: use TabBarView
    return const TabBarView(
      children: [
        DetailScreen(),
        InformationScreen(),
      ],
    );
  }
}
