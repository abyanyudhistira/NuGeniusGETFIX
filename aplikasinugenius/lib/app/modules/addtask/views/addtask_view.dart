import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addtask_controller.dart';

class AddtaskView extends StatelessWidget {
  const AddtaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TambahTugasPage();
  }
}

class TambahTugasPage extends StatelessWidget {
  const TambahTugasPage({Key? key}) : super(key: key);

  static const Color green = Color(0xFF3B9B75);
  static const Color orange = Color(0xFFF26B3B);
  static const Color pink = Color(0xFFE94DB7);
  static const Color yellow = Color(0xFFF9B25B);
  static const Color blue = Color(0xFF6B7AF2);
  static const Color lightGray = Color(0xFFE6F0F0);
  static const Color textBlack = Color(0xFF0B0B0B);
  static const Color textGray = Color(0xFF7B8A8A);
  static const Color redBadge = Color(0xFFFF3B30);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTaskController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo Abyan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textGray,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tambahkan Tugas',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: textBlack,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: textBlack, width: 2),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            size: 24,
                            color: textBlack,
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: redBadge,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Kategori',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 12),

                Obx(() => Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildCategory(controller, 'Kelas', green),
                    _buildCategory(controller, 'Exam', orange),
                    _buildCategory(controller, 'Lab', pink),
                    _buildCategory(controller, 'Penugasan', yellow),
                    _buildCategory(controller, 'Presentasi', blue),
                  ],
                )),
                const SizedBox(height: 24),

                // Input Mata Pelajaran
                _buildInputField(
                  icon: Icons.biotech,
                  hint: 'Biologi',
                  onChanged: controller.setSubject,
                ),
                const SizedBox(height: 16),

                // Input Topik
                _buildInputField(
                  icon: Icons.description_outlined,
                  hint: 'Topik / Nama Bab',
                  onChanged: controller.setTopic,
                ),
                const SizedBox(height: 24),

                // Tanggal
                Obx(() => _buildDateTimeDisplay(
                  iconUrl: 'https://storage.googleapis.com/a1aa/image/f62043cb-1fe1-4622-dcd9-a9b3ad423253.jpg',
                  label: '${controller.date.value.day}/${controller.date.value.month}/${controller.date.value.year}',
                )),
                const SizedBox(height: 16),

                // Waktu
                Obx(() => _buildDateTimeDisplay(
                  iconUrl: 'https://storage.googleapis.com/a1aa/image/30862222-a954-4f99-8807-b161195a1fa7.jpg',
                  label: controller.time.value.format(context),
                )),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.snackbar(
                        'Sukses',
                        'Tugas berhasil ditambahkan!',
                        backgroundColor: Colors.green.shade100,
                        colorText: Colors.black,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    child: const Text('Tambahkan Tugas'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(AddTaskController controller, String label, Color color) {
    final isSelected = controller.selectedCategory.value == label;
    return GestureDetector(
      onTap: () => controller.setCategory(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hint, required Function(String) onChanged}) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: textGray),
          hintText: hint,
          hintStyle: const TextStyle(color: textGray),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildDateTimeDisplay({required String iconUrl, required String label}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 16),
          child: Image.network(iconUrl, width: 24, height: 24),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textBlack,
          ),
        ),
      ],
    );
  }
}
