import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signup_signin_screen.dart';
import 'package:skywebdesign/views/splash_screen/thrid_splash.dart';
import 'package:skywebdesign/views/splash_screen/widgets/dot_widget.dart';

class SecondSplash extends StatelessWidget {
  const SecondSplash({super.key});

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
            onTap: () => Get.to(() => const SignUpSignInScreen()),
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
              SizedBox(height: 30.h),
              Center(
                child: Image(
                  image: const AssetImage('assets/splashtwo.png'),
                  fit: BoxFit.cover,
                  height: 300.h,
                ),
              ),
              SizedBox(height: 35.h),
              Text(
                'Cooking Safe Food',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff0D1A5C),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'We are maintain safty and We keep \nclean while making food.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xffA9ABB1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DotWidget(position: 1),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ThirdSplash());
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff0D1A5C),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
