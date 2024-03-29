import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signup_signin_screen.dart';
import 'package:skywebdesign/views/splash_screen/widgets/dot_widget.dart';

class ThirdSplash extends StatelessWidget {
  const ThirdSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xffA9ABB1),
            ),
          ),
        ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Quick Delivery',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff0D1A5C),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Orders your favourite meals will \nbe immediately deliver.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xffA9ABB1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Image(
                  image: const AssetImage('assets/splashthree.png'),
                  fit: BoxFit.cover,
                  height: 300.h,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DotWidget(position: 2),
                  GestureDetector(
                    onTap: () => Get.to(() => const SignUpLoginScreen()),
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: const Color(0xff0D1A5C),
                      child: Text(
                        'Start',
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
      ),
    );
  }
}
