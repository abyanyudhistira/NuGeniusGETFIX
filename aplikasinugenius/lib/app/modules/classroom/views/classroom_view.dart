import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassroomView extends StatelessWidget {
  const ClassroomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassroomPage();
  }
}

class ClassroomController extends GetxController {
  var selectedTab = 'Deskripsi'.obs;
  var tabs = ['Deskripsi', 'Diskusi', 'Sumber'];
}

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassroomController());
    
    return Scaffold(
      backgroundColor: const Color(0xFFFCF7FD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hari ini, 17 Sept',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF7B8A8C),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Classroom',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16,top: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3AA56A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                textStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              child: const Text('+ Kelas'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://storage.googleapis.com/a1aa/image/3f480bba-71e9-456f-2ba8-0074aea78b1a.jpg',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Live',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[600],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.videocam,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'HD',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _SubjectDotItem(title: 'Fisika', color: Colors.blue),
                SizedBox(height: 4),
                _DottedLine(),
                SizedBox(height: 4),
                _SubjectDotItem(title: 'Bab 3: Gaya', color: Colors.green),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://storage.googleapis.com/a1aa/image/bb489db1-fe3e-47cc-56c8-ba209d1b2e57.jpg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Muhammad Ali',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF3B3B3B),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.group, size: 18, color: Color(0xFF3B3B3B)),
                    const SizedBox(width: 6),
                    Text(
                      '45 Terdaftar',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF3B3B3B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(
              () => Row(
                children:
                    controller.tabs.map((tab) {
                      final isSelected = controller.selectedTab.value == tab;
                      return GestureDetector(
                        onTap: () => controller.selectedTab.value = tab,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8, right: 24),
                          decoration:
                              isSelected
                                  ? const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                  )
                                  : null,
                          child: Text(
                            tab,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color:
                                  isSelected
                                      ? Colors.black
                                      : const Color(0xFF7B8A8C),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              if (controller.selectedTab.value == 'Deskripsi') {
                return const DescriptionContent();
              } else if (controller.selectedTab.value == 'Diskusi') {
                return Center(
                  child: Text(
                    'Diskusi content goes here',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Sumber content goes here',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _SubjectDotItem extends StatelessWidget {
  final String title;
  final Color color;

  const _SubjectDotItem({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: const Color(0xFF3B3B3B),
          ),
        ),
      ],
    );
  }
}

class _DottedLine extends StatelessWidget {
  const _DottedLine();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final count = (constraints.maxHeight / 4).floor();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(count, (index) {
              return Container(width: 1, height: 2, color: Colors.grey);
            }),
          );
        },
      ),
    );
  }
}

class DescriptionContent extends StatelessWidget {
  const DescriptionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang kelas ini',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color(0xFF3B3B3B),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Gaya: Dorongan atau tarikan pada suatu benda bermassa yang menyebabkan benda tersebut mengubah kecepatannya.',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF3B3B3B),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Gaya adalah agen eksternal yang mampu mengubah keadaan diam atau gerak benda tertentu.',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFFA3A3A3),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Gaya memiliki besaran dan arah. Arah ke mana gaya diterapkan dikenal sebagai arah gaya dan penerapan gaya adalah titik di mana gaya',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFFA3A3A3),
          ),
        ),
      ],
    );
  }
}
