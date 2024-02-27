import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signin_screen/signin_screen.dart';

class SignUpSignInScreen extends StatelessWidget {
  const SignUpSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 420.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'My Cantor.',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.sp,
                        ),
                      ),
                      Image(
                        image: const AssetImage('assets/mycantor.png'),
                        fit: BoxFit.cover,
                        height: 350.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Best way to invest Your Money!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  height: 35.h,
                  width: 250.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xffA050FE),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 35.h,
                  width: 250.w,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignInScreen()),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
