import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/data/database.dart';
import 'package:tourista_app/screens/dashboard_screen.dart';
import 'package:tourista_app/screens/favorite_screen.dart';
import 'package:tourista_app/screens/home_screen.dart';
import 'package:tourista_app/screens/intro_screen.dart';
import 'package:tourista_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await uploadTravelPlacesToFireBaseIfNotExist();
  runApp(const ProviderScope(child: MyApp()));
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
      home: const SplashScreen(),
    );
  }
}
