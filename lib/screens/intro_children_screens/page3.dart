import 'dart:ui';

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
            image: AssetImage("assets/Images/p3bg.jpg"),
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
                            text: "People don't take trips, trips take ",
                          ),
                          TextSpan(
                              text: "people",
                              style: TextStyle(color: Color(0xffFF7029)))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 350,
                  child: Text(
                    'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
                    style: TextStyle(color: Color(0xffDBDBDB), fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 74,
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
