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
        child: const Text('Política de privacidade'),
      );

  Future<void> handleLinkTap() async {
    final uri = Uri.parse('https://www.google.com.br/');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Ocorreu um erro ao abrir o link.')));
    }
  }
}
