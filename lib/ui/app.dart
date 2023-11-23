import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target/app_routes.dart';
import 'package:target/ui/auth/auth_page.dart';
import 'package:target/ui/home/home_page.dart';

class App extends StatelessWidget {
  App({super.key});

  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Target Test',
        initialRoute: AppRoutes.auth,
        navigatorKey: navigatorKey,
        routes: {
          AppRoutes.auth: (_) => const AuthPage(),
          AppRoutes.home: (_) => const HomePage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            isDense: true,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: TextStyle(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff44bd6e),
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    });
  }
}
