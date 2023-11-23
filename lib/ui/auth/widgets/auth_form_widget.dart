import 'package:flutter/material.dart';
import 'package:target/models/auth_data_model.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key, required this.onSubmit});

  final Future<void> Function(AuthParams) onSubmit;

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  bool isLoading = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    resolveSubmitButtonContent() {
      if (isLoading) return const CircularProgressIndicator();

      return const Text('Entrar');
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: usernameController,
            validator: validateUsername,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label:
                  Padding(padding: labelPadding, child: const Text('Usuário')),
              prefixIcon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            validator: validatePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: Padding(padding: labelPadding, child: const Text('Senha')),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: submit,
            child: resolveSubmitButtonContent(),
          ),
        ],
      ),
    );
  }

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() => isLoading = true);

      await widget.onSubmit.call(output).whenComplete(() {
        if (mounted) {
          setState(() => isLoading = false);
        }
      });
    }
  }

  EdgeInsetsGeometry get labelPadding => const EdgeInsets.fromLTRB(4, 0, 0, 24);

  AuthParams get output => AuthParams(
        username: usernameController.text,
        password: passwordController.text,
      );

  String get invalidUsernameMessage => 'Usuário inválido';
  String get invalidUsernameTooLong =>
      '$invalidUsernameMessage Máximo de 20 caracteres';

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return invalidUsernameMessage;
    if (value.length > 20) return invalidUsernameTooLong;
    return null;
  }

  String get invalidPasswordMessage => 'Senha inválida';
  String get invalidPasswordTooShort =>
      '$invalidPasswordMessage Mínimo de 2 caracteres';
  String get invalidPasswordTooLong =>
      '$invalidPasswordMessage Máximo de 20 caracteres';

  String? validatePassword(String? value) {
    bool isPasswordInvalid = value == null || value.isEmpty;
    if (isPasswordInvalid) return invalidPasswordMessage;

    bool isPasswordTooShort = value.length < 2;
    if (isPasswordTooShort) return invalidPasswordTooShort;

    bool isPasswordTooLong = value.length > 20;
    if (isPasswordTooLong) return invalidPasswordTooLong;

    return null;
  }
}
