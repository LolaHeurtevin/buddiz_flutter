import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  static const route = '/onboarding';
  const OnboardingPage({super.key});

  Future<void> _onFinish(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
      bodyTextStyle: const TextStyle(fontSize: 16.0),
      imagePadding: const EdgeInsets.only(top: 24.0),
      pageColor: Colors.white,
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Bienvenue sur Buddiz",
          body: "Découvre et partage des activités près de toi.",
          image: Image.asset("assets/images/onboarding/buddy_head.png"),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Carte & activités",
          body: "Visualise les activités sur la carte et en liste.",
          image: Image.asset("assets/images/onboarding/map.png"),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Crée une activité",
          body: "Ajoute facilement une activité avec notre formulaire.",
          image: Image.asset("assets/images/onboarding/buddy_saut.png"),
          decoration: pageDecoration,
        ),

      ],

      // boutons
      onDone: () => _onFinish(context),
      onSkip: () => _onFinish(context),
      showSkipButton: true,
      skip: const Text(
        'Ignorer',
        style: TextStyle(color: Color(0xFF490715)),
      ),
      next: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF490715),
      ),
      done: const Text(
        'Commencer',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF490715)
        )
      ),

      // styles
      dotsDecorator: DotsDecorator(
        size: const Size(6.0, 6.0),
        color: Color(0xFFFFA6C3),
        activeColor: Color(0xFF490715),
        activeSize: const Size(22.0, 6.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(height: 0),
      ),
      globalBackgroundColor: Colors.white,
      animationDuration: 300,
    );
  }
}
