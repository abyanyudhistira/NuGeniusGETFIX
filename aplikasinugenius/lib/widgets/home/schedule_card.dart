import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jadwal',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kelas dan tugas yang akan datang',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 24),

        // Bagian card jadwal
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF8E98FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 30,
                top: 50,
                child: Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    'assets/icon/atomm.svg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fisika',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Menambahkan jarak antar teks
                    Text(
                      'Bab 3: Gaya',
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_rounded,
                            color: Colors.white, size: 16),
                        const SizedBox(width: 10),
                        Text(
                          '09:30',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/mali.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Muhammad Ali',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/gmeet.svg',
                          color: Colors.white,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Google Meet',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
