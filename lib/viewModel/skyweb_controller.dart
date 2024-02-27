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
  final isObscured = true.obs;
  final isLoading = false.obs;

  updateObscureText() {
    isObscured.value = !isObscured.value;
  }

  signUpButton() {
    isLoading.value = true;
    auth
        .createUserWithEmailAndPassword(
            email: signUpEmailController.text,
            password: signUpPasswordController.text)
        .then((value) => Get.offAll(() => const HomeScreen()))
        .onError((error, stackTrace) {
      print('Error is: $error');
      return null;
    });
    isLoading.value = false;
  }

  sigInpButton() {
    isLoading.value = true;
    auth
        .signInWithEmailAndPassword(
            email: signInEmailController.text,
            password: signInPasswordController.text)
        .then((value) => Get.offAll(() => const HomeScreen()))
        .onError((error, stackTrace) {
      print('Error : $error');
      return null;
    });
    isLoading.value = false;
  }
}
