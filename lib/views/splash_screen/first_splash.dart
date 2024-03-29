import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/viewModel/splash_controller.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signup_signin_screen.dart';
import 'package:skywebdesign/views/splash_screen/second_splash.dart';
import 'package:skywebdesign/views/splash_screen/widgets/dot_widget.dart';

class FirstSplash extends GetView<SplashController> {
  const FirstSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const SignUpLoginScreen()),
            child: Text(
              'Skip',
              style: TextStyle(
                color: const Color(0xffA9ABB1),
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Order Your Food',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff0D1A5C),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Now you can order food any time \nright from your mobile.',
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xffA9ABB1),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: Image(
                image: const AssetImage('assets/splashone.png'),
                fit: BoxFit.cover,
                height: 300.h,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DotWidget(position: 0),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SecondSplash());
                  },
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: const Color(0xff0D1A5C),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
