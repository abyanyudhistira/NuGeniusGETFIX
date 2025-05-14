import 'package:nugenius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.WELCOME); // navigasi ke halaman Welcome
    });
  }
}
