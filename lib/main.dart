import 'package:flutter/material.dart';
import 'package:tourista_app/screens/login_screen.dart';
import 'package:tourista_app/screens/sign_up_screen.dart';
import 'package:tourista_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourista',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFF6421)),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
