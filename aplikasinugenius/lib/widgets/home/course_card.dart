import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kursus',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Subjek yang berjalan',
          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
        ),
        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CourseCard(
                  title: 'Matematika',
                  color: const Color.fromRGBO(253, 232, 201, 1.0),
                  icon: SvgPicture.asset(
                    'assets/icon/formula.svg',
                    width: 55,
                    height: 55,
                  ),
                ),
                const SizedBox(width: 16),
                CourseCard(
                  title: 'Kimia',
                  color: const Color.fromRGBO(73, 181, 131, 1.0),
                  icon: SvgPicture.asset(
                    'assets/icon/science.svg',
                    width: 55,
                    height: 55,
                  ),
                ),
                const SizedBox(width: 16),
                CourseCard(
                  title: 'Fisika',
                  color: const Color.fromRGBO(127, 134, 255, 1.0),
                  icon: SvgPicture.asset(
                    'assets/icon/fisika.svg',
                    width: 55,
                    height: 55,
                  ),
                ),
                const SizedBox(width: 16),
                CourseCard(
                  title: 'Biologi',
                  color: const Color.fromRGBO(236, 223, 233, 1.0),
                  icon: SvgPicture.asset(
                    'assets/icon/virus.svg',
                    width: 55,
                    height: 55,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final Color color;
  final Widget icon;

  const CourseCard({
    required this.title,
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
