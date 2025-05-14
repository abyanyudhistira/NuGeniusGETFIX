import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nugenius/app/modules/classroom/views/classroom_view.dart';
import 'package:nugenius/app/modules/home/views/home_view.dart';
import 'package:nugenius/app/modules/task/views/task_view.dart';
import '../controllers/bottomnav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      const TaskView(), 
      const ClassroomView()
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage,
            selectedItemColor: const Color(0xFF4FD1C5),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_rounded),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.class_rounded),
                label: 'Classroom',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: 'Discuss',
              ),
            ],
          )),
    );
  }
}
