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

  updateObscureText() {
    isObscured.value = !isObscured.value;
  }

  signUpButton() async {
    auth
        .createUserWithEmailAndPassword(
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
    )
        .then((value) {
      Get.offAll(() => const HomeScreen());
    }).onError((error, stackTrace) {
      print('Error is: $error');
    });
  }
}
