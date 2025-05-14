import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nugenius/app/modules/home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xF6FBF9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                "Selamat Datang\nkembali !",
                style: GoogleFonts.urbanist(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),

              // Email field
              TextField(
                decoration: InputDecoration(
                  hintText: "Masukkan email",
                  hintStyle: GoogleFonts.urbanist(),
                  filled: true,
                  fillColor: const Color(0xFFF4F4F4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password field with Obx
              Obx(() => TextField(
                    obscureText: controller.obscurePassword.value,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      hintStyle: GoogleFonts.urbanist(),
                      filled: true,
                      fillColor: const Color(0xFFF4F4F4),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: controller.togglePassword,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),

              const SizedBox(height: 8),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Handle forgot password
                  },
                  child: Text(
                    "Lupa Password ?",
                    style: GoogleFonts.urbanist(color: Colors.grey[700]),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Atau Login Dengan",
                      style: GoogleFonts.urbanist(),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 16),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton('assets/icon/facebook.png'),
                  _buildSocialButton('assets/icon/google.png'),
                  _buildSocialButton('assets/icon/apple.png'),
                ],
              ),

              const Spacer(),

              // Register link
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigasi ke halaman register
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Belum punya akun? ",
                      style: GoogleFonts.urbanist(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Daftar Sekarang",
                          style: GoogleFonts.urbanist(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(assetPath, height: 24, width: 24),
    );
  }
}
