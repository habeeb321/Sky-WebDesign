import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/viewModel/skyweb_controller.dart';

class HomeScreen extends GetView<SkywebController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SkywebController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors.black,
                child: Image(
                  image: const AssetImage('assets/skyweblogo.png'),
                  fit: BoxFit.cover,
                  height: 60.h,
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Welcome To',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'SkyWeb Design',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Obx(
                () => Center(
                  child: Text(
                    controller.userEmail.value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton.icon(
                onPressed: () => controller.logout(),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
