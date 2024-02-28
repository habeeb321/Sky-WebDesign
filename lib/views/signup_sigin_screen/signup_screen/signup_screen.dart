import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signin_screen/signin_screen.dart';
import 'package:skywebdesign/viewModel/skyweb_controller.dart';

class SignUpScreen extends GetView<SkywebController> {
  const SignUpScreen({super.key});

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
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(
                    image: const AssetImage('assets/signin.png'),
                    fit: BoxFit.cover,
                    height: 200.h,
                  ),
                  Positioned(
                    top: 115,
                    child: Container(
                      height: Get.height,
                      width: Get.width,
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
                                  'Create Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                'Full Name',
                                style: TextStyle(fontSize: 11.sp),
                              ),
                              const SizedBox(height: 3),
                              SizedBox(
                                height: 40.h,
                                child: TextFormField(
                                  controller: controller.signUpNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Phone Number',
                                style: TextStyle(fontSize: 11.sp),
                              ),
                              const SizedBox(height: 3),
                              SizedBox(
                                height: 40.h,
                                child: TextFormField(
                                  controller: controller.signUpPhoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Email Address',
                                style: TextStyle(fontSize: 11.sp),
                              ),
                              const SizedBox(height: 3),
                              SizedBox(
                                height: 40.h,
                                child: TextFormField(
                                  controller: controller.signUpEmailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
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
                                        controller:
                                            controller.signUpPasswordController,
                                        obscureText:
                                            controller.isObscured.value,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            controller.updateObscureText(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
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
                              SizedBox(height: 40.h),
                              Center(
                                child: SizedBox(
                                  height: 35.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => controller.signUpButton(),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xffA050FE),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign Up',
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
                                        text: "I'm already a member. ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign In',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: const Color(0xffA050FE),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              Get.to(() => const LoginScreen()),
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
          ),
        ],
      ),
    );
  }
}
