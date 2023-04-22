import 'package:commoncar_app/screens/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:commoncar_app/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterResponse {
  final bool logged;

  const RouterResponse({
    required this.logged,
  });
}

/// This notifier exposes nothing (void) but implements [Listenable].
/// This notifier is meant to just access its internal [Notifier].
///
/// This notifier triggers our router's listener everytime is needed.
/// In this simple case, we do so when `auth` changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. Since it's not meant to be _watched_, it uselessly rebuild a [GoRouter]
///      every time something changes
///   3. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   4. It allows for listening to multiple providers if needed
class RouterNotifier extends AsyncNotifier<RouterResponse>
    implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<RouterResponse> build() async {
    // One could watch more providers and write logic accordingly

    // final logged = await ref.watch(
    //   authProvider.selectAsync((data) => data == true),
    // );
    final logged = false;

    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });

    return RouterResponse(
      logged: logged,
    );
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    final routerResponse = this.state.valueOrNull;

    if (routerResponse == null) return null;
    final bool unloggedScreens = state.subloc == LoginScreen.path;
    // ||
    //     state.subloc.contains(RegisterScreen.path) ||
    //     state.subloc.contains(ForgotPassword.path) ||
    //     state.subloc.contains(OnBoardingScreen.path) ||
    //     state.subloc == DeleteAccountSuccessScreen.path;

    if (state.subloc == '/error') {
      return null;
    }

    // final isSplash = state.location == SplashScreen.path;

    // if (routerResponse.logged) {
    //   if (routerResponse.hasCompletedProfile) {
    //     if (isSplash) {
    //       return Dashboard.path;
    //     }
    //   } else if (!isCreateProfile) {
    //     return CreateProfilePhoto.path;
    //   }

    //   if (unloggedScreens) {
    //     return Dashboard.path;
    //   }
    // } else {
    //   if (isSplash) {
    //     if (routerResponse.onboardingSeen) {
    //       return LoginScreen.path;
    //     } else {
    //       return OnBoardingScreen.path;
    //     }
    //   }

    //   if (!unloggedScreens) {
    //     return LoginScreen.path;
    //   }
    // return LoginScreen.path;

    return LoginScreen.path;
  }

  // List<NavigatorObserver> get observers => [
  //       GoRouterObserver(),
  //     ];

  /// Our application routes. Obtained through code generation
  List<GoRoute> get routes => routesList;

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

final routerNotifierProvider =
    AsyncNotifierProvider<RouterNotifier, RouterResponse>(() {
  return RouterNotifier();
});
