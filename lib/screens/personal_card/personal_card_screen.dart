import 'package:flutter/material.dart';
import 'package:mobr1/screens/personal_card/components/personal_card_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalCardScreenParams {
  const PersonalCardScreenParams({
    required this.phoneNumber,
    required this.email,
  });

  final String phoneNumber;
  final String email;
}


class PersonalCardScreen extends StatefulWidget {
  static const routeName = '/personal-card';

  const PersonalCardScreen({
    super.key,
    required this.params
  });

  final PersonalCardScreenParams params;

  @override
  State<PersonalCardScreen> createState() => _PersonalCardScreenState();
}

class _PersonalCardScreenState extends State<PersonalCardScreen> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontFamily: 'DancingScript',
      fontSize: 30,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.jpg'),
                radius: 100,
              ),
              const SizedBox(height: 32),
              const Text(
                'Marcelo',
                textAlign: TextAlign.start,
                style: textStyle,
              ),
              const Text(
                'Montanher',
                textAlign: TextAlign.end,
                style: textStyle,
              ),
              const SizedBox(height: 32),
              PersonalCardButton(
                icon: Icons.phone,
                text: widget.params.phoneNumber,
                onPressed: () {
                  launchUrl(
                    Uri.parse('whatsapp://send?phone=${widget.params.phoneNumber}&text=Olá'),
                  );
                },
              ),
              const SizedBox(height: 16),
              PersonalCardButton(
                icon: Icons.email,
                text: widget.params.email,
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'mailto',
                      path: widget.params.email,
                      query: 'subject=Teste&body=Testando email automático',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
