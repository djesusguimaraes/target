import 'package:flutter/material.dart';

class GradientBgWrapper extends StatelessWidget {
  const GradientBgWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff224b5b), Color(0xff2c948d)],
          ),
        ),
        child: child);
  }
}
