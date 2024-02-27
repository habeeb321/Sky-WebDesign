import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/home_screen/home_screen.dart';
import 'package:skywebdesign/views/splash_screen/first_splash.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  void checkUserLoggedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => const FirstSplash());
      }
    });
  }
}
