import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:target/router/router_store.dart';

class App extends StatelessWidget {
  App({super.key});

  final routerStore = GetIt.instance.get<RouterStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Target Test',
        routerConfig: routerStore.router,
        theme: ThemeData(primarySwatch: Colors.blue),
      );
    });
  }
}
