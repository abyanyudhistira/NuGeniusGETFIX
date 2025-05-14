import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // 0 = Home, 1 = Task, 2 = Classroom, 3 = Discuss

  void changePage(int index) {
    currentIndex.value = index; // Update tab yang aktif
  }
}
