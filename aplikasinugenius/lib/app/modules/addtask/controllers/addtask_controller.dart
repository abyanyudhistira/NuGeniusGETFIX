import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddTaskController extends GetxController {
  var selectedCategory = 'Kelas'.obs;
  var subject = ''.obs;
  var topic = ''.obs;
  var date = DateTime.now().obs;
  var time = TimeOfDay.now().obs;

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void setSubject(String val) {
    subject.value = val;
  }

  void setTopic(String val) {
    topic.value = val;
  }

  void setDate(DateTime val) {
    date.value = val;
  }

  void setTime(TimeOfDay val) {
    time.value = val;
  }
}
