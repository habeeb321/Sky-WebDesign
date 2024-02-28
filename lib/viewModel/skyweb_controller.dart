import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/home_screen/home_screen.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signin_screen/signin_screen.dart';

class SkywebController extends GetxController {
  var auth = FirebaseAuth.instance;
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final isObscured = true.obs;
  RxString userEmail = 'Abc@gmail.com'.obs;

  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  updateObscureText() {
    isObscured.value = !isObscured.value;
  }

  signUpButton() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text.trim(),
        password: signUpPasswordController.text.trim(),
      );
      storage.write(key: 'email', value: signUpEmailController.text.trim());
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      String errorMessage =
          e.toString().substring(e.toString().indexOf(']') + 1);
      if (signUpNameController.text.isEmpty ||
          signUpPhoneController.text.isEmpty ||
          signUpEmailController.text.isEmpty ||
          signUpPasswordController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Fields cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  signInButton() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      );
      storage.write(key: 'email', value: signInEmailController.text.trim());
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      if (signInEmailController.text.isEmpty ||
          signInPasswordController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Fields cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      Get.snackbar(
        'Error',
        'Email or Password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logout() {
    Get.defaultDialog(
      title: "Logout Confirmation",
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () {
            auth.signOut().then((value) {
              Get.offAll(() => const LoginScreen());
            });
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("No"),
        ),
      ],
    );
  }

  void getDetails() async {
    userEmail.value = await storage.read(key: 'email') ?? '';
  }

  void resetPassword() async {
    try {
      await auth.sendPasswordResetEmail(
          email: forgotPasswordController.text.trim());
      Get.defaultDialog(
        title: "Reset",
        content: const Text("Password reset link sent! check your email"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              forgotPasswordController.clear();
            },
            child: const Text("Ok"),
          ),
        ],
      );
    } catch (e) {
      String errorMessage =
          e.toString().substring(e.toString().indexOf(']') + 1);
      if (forgotPasswordController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Field cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
