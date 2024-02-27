import 'package:get/get.dart';

class SkywebController extends GetxController {
  final isObscured = true.obs;

  updateObscureText() {
    isObscured.value = !isObscured.value;
  }
}
