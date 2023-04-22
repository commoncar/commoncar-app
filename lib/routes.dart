import 'package:commoncar_app/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final routesList = [
  GoRoute(
    path: LoginScreen.path,
    name: LoginScreen.name,
    builder: (_, __) => const LoginScreen(),
  ),
];
