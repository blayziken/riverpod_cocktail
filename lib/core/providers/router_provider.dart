import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_cocktail/core/controllers/auth/auth_controller.dart';

import '../../pages/auth/login.dart';
import '../../pages/home.dart';
import '../controllers/login_states.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router._routes,
    redirect: router._redirectLogic,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(GoRouterState state) {
    final loginState = _ref.read(loginControllerProvider);

    final isLoggedIn = state.location == '/login';

    // if (loginState == LoginStateInitial) {
    //   return '/login';
    // }

    if (loginState == LoginStateSuccess) {
      return '/accepted';
    }

    // if (isLoggedIn) return '/accepted';

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => EntryPage(),
        ),
        GoRoute(
          path: '/accepted',
          name: 'accepted',
          builder: (context, state) => Accepted(),
        ),
      ];
}
