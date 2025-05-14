import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nugenius/app/modules/addtask/views/addtask_view.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "17 September",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: const Color(0xFF8B8B8B),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Hari ini",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const AddtaskView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3BA66D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 6,
                      shadowColor: Colors.black26,
                    ),
                    child: Text(
                      "+ Tugas",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // DATES ROW
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DateItem(day: 14, label: "Mon"),
                    DateItem(day: 15, label: "Tue"),
                    DateItem(day: 16, label: "Wed"),
                    DateItem(day: 17, label: "Thu", isSelected: true),
                    DateItem(day: 18, label: "Fri"),
                    DateItem(day: 19, label: "Sat"),
                    DateItem(day: 20, label: "Sun"),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // TIMELINE & TASKS
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    TimelineTaskCard(
                      time: "09:30",
                      endTime: "10:20",
                      title: "Fisika",
                      desc: "Chapter 3: Force",
                      teacher: "Muhammad Ali",
                      platform: "Google Meet",
                      icon: Icons.science,
                      bgColor: Color(0xFF7B8AFB),
                      textColor: Colors.white,
                      avatarUrl:
                          "https://storage.googleapis.com/a1aa/image/830bc4eb-b58c-4c47-abf2-b4d6f2d984b6.jpg",
                    ),
                    SizedBox(height: 32),
                    TimelineTaskCard(
                      time: "11:00",
                      endTime: "11:50",
                      title: "Geografi",
                      desc: "Bab 12: Fisik Bumi",
                      teacher: "Clara Monchy",
                      platform: "Zoom",
                      icon: Icons.public,
                      bgColor: Color(0xFFE6FCFA),
                      textColor: Color(0xFF1B1B1B),
                      avatarUrl:
                          "https://storage.googleapis.com/a1aa/image/847cefe8-6902-4a5a-730b-66e1ebc92bcb.jpg",
                    ),
                    SizedBox(height: 32),
                    TimelineTaskCard(
                      time: "12:20",
                      endTime: "13:00",
                      title: "Penugasan",
                      desc: "Pola Regional Dunia",
                      teacher: "Alexa Tenorio",
                      platform: "Google Docs",
                      icon: Icons.description,
                      bgColor: Color(0xFFE6FCFA),
                      textColor: Color(0xFF1B1B1B),
                      avatarUrl:
                          "https://storage.googleapis.com/a1aa/image/6b130de7-6a2c-418f-3c9a-1dc57bdfb683.jpg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final int day;
  final String label;
  final bool isSelected;

  const DateItem({
    super.key,
    required this.day,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? const Color(0xFF3BA66D) : Colors.black.withOpacity(0.9);
    final fontWeight = isSelected ? FontWeight.w600 : FontWeight.w600;
    final border = isSelected
        ? Border(
            bottom: BorderSide(
              color: const Color(0xFF3BA66D),
              width: 2,
            ),
          )
        : null;

    return Container(
      width: 48,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(border: border),
            child: Text(
              day.toString(),
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineTaskCard extends StatelessWidget {
  final String time;
  final String endTime;
  final String title;
  final String desc;
  final String teacher;
  final String platform;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final String avatarUrl;
  final String? decorationImageUrl;

  const TimelineTaskCard({
    super.key,
    required this.time,
    required this.endTime,
    required this.title,
    required this.desc,
    required this.teacher,
    required this.platform,
    required this.icon,
    required this.bgColor,
    required this.textColor,
    required this.avatarUrl,
    this.decorationImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time & timeline circle
        SizedBox(
          width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                endTime,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: const Color(0xFF8B8B8B),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF7B8AFB), width: 2),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),

        // Card
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      desc,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: textColor.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(avatarUrl),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            teacher,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          icon,
                          size: 18,
                          color: textColor.withOpacity(0.8),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          platform,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: textColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (decorationImageUrl != null)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Opacity(
                    opacity: 0.15,
                    child: Image.network(
                      decorationImageUrl!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
  