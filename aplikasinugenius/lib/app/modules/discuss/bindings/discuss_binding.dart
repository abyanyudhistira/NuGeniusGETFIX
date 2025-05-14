import 'package:get/get.dart';

import '../controllers/discuss_controller.dart';

class DiscussBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscussController>(
      () => DiscussController(),
    );
  }
}
