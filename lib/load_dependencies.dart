import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:target/ui/app.dart';

class LoadDependencies extends StatelessWidget {
  const LoadDependencies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.instance.allReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());

        return App();
      },
    );
  }
}
