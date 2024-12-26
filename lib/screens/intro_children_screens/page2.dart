import 'dart:ui';

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
            image: AssetImage("assets/Images/p2bg.jpg"),
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
                  height: 380,
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
                            text: 'The world is waiting for you, go ',
                          ),
                          TextSpan(
                              text: "discover it.",
                              style: TextStyle(color: Color(0xffFF7029)))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 350,
                  child: Text(
                    'Embark on an unforgettable journey by venturing outside of your comfort zone. The world is full of hidden gems just waiting to be discovered.',
                    style: TextStyle(color: Color(0xffDBDBDB), fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF6421),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
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
