import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyLinkButton extends StatefulWidget {
  const PolicyLinkButton({super.key});

  @override
  State<PolicyLinkButton> createState() => _PolicyLinkButtonState();
}

class _PolicyLinkButtonState extends State<PolicyLinkButton> {
  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: handleLinkTap,
        child: const Text(
          'Política de privacidade',
          style: TextStyle(color: Colors.white),
        ),
      );

  Future<void> handleLinkTap() async {
    // FIXME: Verificar porque o link não está abrindo
    final uri = Uri.parse('https://google.com.br');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text('Ocorreu um erro ao abrir o link.'),
          behavior: SnackBarBehavior.floating,
        ));
    }
  }
}
