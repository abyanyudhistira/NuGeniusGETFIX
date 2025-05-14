import 'package:get/get.dart';

class RegisterController extends GetxController {
  var obscurePassword = true.obs;
  var obscureConfirm = true.obs;

  void togglePassword() {
    obscurePassword.toggle();
  }

  void toggleConfirm() {
    obscureConfirm.toggle();
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
