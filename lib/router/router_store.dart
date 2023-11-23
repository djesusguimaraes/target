import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:target/ui/auth/auth_page.dart';
import 'package:target/ui/auth/auth_store.dart';
import 'package:target/ui/home/home_page.dart';
import 'package:target/router/app_routes.dart';

part 'router_store.g.dart';

class RouterStore = RouterStoreBase with _$RouterStore;

abstract class RouterStoreBase with Store {
  final AuthStore authStore;

  RouterStoreBase({required this.authStore});

  @observable
  List<RouteBase> routes = [
    GoRoute(
      name: AppRoutes.homeNamed,
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AppRoutes.authNamed,
      path: AppRoutes.auth,
      builder: (context, state) => const AuthPage(),
    ),
  ];

  @computed
  GoRouter get router {
    return GoRouter(
      routes: routes,
      redirect: redirect,
      initialLocation: AppRoutes.home,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: navigatorKey,
    );
  }

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (authStore.isLogged) return AppRoutes.home;
    return null;
  }
}
