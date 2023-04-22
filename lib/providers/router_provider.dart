import 'package:commoncar_app/providers/router_notifier.dart';
import 'package:commoncar_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  // ignore: unused_local_variable
  final sub = ref.listen(routerNotifierProvider, (_, __) {});
  final notifier = ref.read(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: LoginScreen.path,
    debugLogDiagnostics: true,
    refreshListenable: notifier,
    routes: notifier.routes,
    redirect: notifier.redirect,
    // observers: notifier.observers,
  );
});
