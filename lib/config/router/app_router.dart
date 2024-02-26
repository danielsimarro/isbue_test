import 'package:go_router/go_router.dart';
import 'package:isbue/presentation/login/screen/login_screen.dart';
import 'package:isbue/presentation/home/screen/home_screen.dart';
import 'package:isbue/presentation/mfa/screen/mfa_screen.dart';
import 'package:isbue/presentation/select_install/screen/select_install.dart';

import '../../presentation/clients/screen/clients_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/mfa',
    builder: (context, state) => const MfaScreen(),
  ),
  GoRoute(
    path: '/selectinstall',
    builder: (context, state) => const SelectInstall(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/clientes',
    builder: (context, state) => const ClientsScreen(),
  )
]);
