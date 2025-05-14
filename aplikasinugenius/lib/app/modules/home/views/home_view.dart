import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nugenius/app/modules/classroom/views/classroom_view.dart';
import 'package:nugenius/app/modules/home/controllers/home_controller.dart';
import 'package:nugenius/app/modules/task/views/task_view.dart';
import 'package:nugenius/widgets/home/header.dart';
import 'package:nugenius/widgets/home/course_card.dart';
import 'package:nugenius/widgets/home/schedule_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _buildHomeContent(),
              const TaskView(),
              const ClassroomView(),
              const Center(child: Text('Discuss Page')),
            ],
          );
        }),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 30),
            Header(),
            SizedBox(height: 40),
            CourseSection(),
            SizedBox(height: 40),
            ScheduleCard(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 62,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 'Home', 0),
              _buildNavItem(Icons.assignment_rounded, 'Tasks', 1),
              _buildNavItem(Icons.class_rounded, 'Classroom', 2),
              _buildNavItem(Icons.chat_bubble_outline_rounded, 'Discuss', 3),
            ],
          )),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF4FD1C5) : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF4FD1C5) : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
