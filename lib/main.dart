import 'package:flutter/material.dart';
import 'package:target/load_dependencies.dart';
import 'dependency_inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();
  runApp(const LoadDependencies());
}
