import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:skywebdesign/views/splash_screen/first_splash.dart';
import 'package:skywebdesign/views/splash_screen/second_splash.dart';
import 'package:skywebdesign/views/splash_screen/thrid_splash.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.position});

  final int position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      onTap: (position) {
        if (position == 0) {
          Get.to(() => const FirstSplash());
        } else if (position == 1) {
          Get.to(() => const SecondSplash());
        } else if (position == 2) {
          Get.to(() => const ThirdSplash());
        }
      },
      dotsCount: 3,
      position: position,
      decorator: const DotsDecorator(
        colors: [
          Color(0xffA9ABB1),
          Color(0xffA9ABB1),
          Color(0xffA9ABB1),
        ],
        activeColors: [
          Color(0xff0D1A5C),
          Color(0xff0D1A5C),
          Color(0xff0D1A5C),
        ],
      ),
    );
  }
}
