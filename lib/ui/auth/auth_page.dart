import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:target/app_routes.dart';
import 'package:target/ui/auth/auth_store.dart';
import 'package:target/ui/auth/widgets/auth_form_widget.dart';
import 'package:target/ui/widgets/grandient_bg_wrapper.dart';
import 'package:target/ui/widgets/policy_link_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthStore store;

  @override
  void initState() {
    store = GetIt.instance.get<AuthStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => when((_) => store.isLogged, () => Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
      child: GradientBgWrapper(
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: AuthFormWidget(onSubmit: store.login),
            ),
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(32),
            child: PolicyLinkButton(),
          ),
        ),
      ),
    );
  }
}
