import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:target/ui/home/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    store = GetIt.instance.get<HomeStore>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    store.loadRecord();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
