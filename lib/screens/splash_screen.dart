import 'package:flutter/material.dart';
import 'package:tourista_app/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToNextScreen() async {
    // wait 4 sec and then push to intro Screen
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ));
  }

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFF6421),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Text(
          'Tourista',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    );
  }
}
