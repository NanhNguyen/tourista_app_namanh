import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourista_app/screens/intro_children_screens/page1.dart';
import 'package:tourista_app/screens/intro_children_screens/page2.dart';
import 'package:tourista_app/screens/intro_children_screens/page3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: [
              Page1(controller: controller),
              Page2(controller: controller),
              const Page3(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const WormEffect(
                dotColor: Color(0xffCAEAFF),
                activeDotColor: Color(0xffFF6421),
                spacing: 15,
                dotHeight: 9,
                dotWidth: 18),
          ),
        )
      ],
    );
  }
}
