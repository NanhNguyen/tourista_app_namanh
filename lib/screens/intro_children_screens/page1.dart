import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourista_app/screens/login_screen.dart';

class Page1 extends StatefulWidget {
  final PageController controller;
  const Page1({super.key, required this.controller});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/Images/p1bg.jpg"),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.5, sigmaY: 6.5),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ));
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 400,
                ),
                SizedBox(
                  width: 350,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Life is brief, but the universe is ',
                          ),
                          TextSpan(
                              text: "vast",
                              style: TextStyle(color: Color(0xffFF7029)))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 350,
                  child: Text(
                    'At Tourista Adventures, we curate unique and immersive travel experiences to destinations around the globe.',
                    style: TextStyle(color: Color(0xffDBDBDB), fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () => widget.controller.nextPage(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut),
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF6421),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
