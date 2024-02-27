import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:skywebdesign/signup_sigin_screen/signup_screen/signup_screen.dart';
import 'package:skywebdesign/viewModel/skyweb_controller.dart';

class SignInScreen extends GetView<SkywebController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SkywebController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image(
              image: const AssetImage('assets/signin.png'),
              fit: BoxFit.cover,
              height: 200.h,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45.h),
                        Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Email Address',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(fontSize: 11.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        const SizedBox(height: 3),
                        Obx(
                          () => SizedBox(
                            height: 40.h,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                TextFormField(
                                  obscureText: controller.isObscured.value,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(fontSize: 11.sp),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.updateObscureText(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Icon(
                                      controller.isObscured.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xffA050FE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: SizedBox(
                            height: 35.h,
                            width: double.infinity,
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
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "I'm a new user. ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: const Color(0xffA050FE),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Get.to(() => const SignUpScreen()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
