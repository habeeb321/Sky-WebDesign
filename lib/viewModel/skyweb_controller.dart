import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/home_screen/home_screen.dart';

class SkywebController extends GetxController {
  var auth = FirebaseAuth.instance;
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isObscured = true.obs;

  updateObscureText() {
    isObscured.value = !isObscured.value;
  }

  signUpButton() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
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
        email: signInEmailController.text,
        password: signInPasswordController.text,
      );
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
}
