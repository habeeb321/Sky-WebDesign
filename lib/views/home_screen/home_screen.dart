import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywebdesign/views/signup_sigin_screen/signin_screen/signin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Get.offAll(() => const LoginScreen());
            });
          },
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ),
    );
  }
}
