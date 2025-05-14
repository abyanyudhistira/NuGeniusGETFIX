import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: const Color(0xF6FBF9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 16),

              Text(
                "Halo! Daftar untuk\nmemulai",
                style: GoogleFonts.urbanist(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),

              _buildTextField("Username"),
              const SizedBox(height: 16),

              _buildTextField("Email"),
              const SizedBox(height: 16),

              Obx(() => _buildTextField(
                    "Password",
                    isPassword: true,
                    obscure: controller.obscurePassword.value,
                    toggle: controller.togglePassword,
                  )),
              const SizedBox(height: 16),

              Obx(() => _buildTextField(
                    "Confirm password",
                    isPassword: true,
                    obscure: controller.obscureConfirm.value,
                    toggle: controller.toggleConfirm,
                  )),

              const SizedBox(height: 24),

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
                    // TODO: Handle Register
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Atau Register Dengan",
                      style: GoogleFonts.urbanist(),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton('assets/icon/facebook.png'),
                  _buildSocialButton('assets/icon/google.png'),
                  _buildSocialButton('assets/icon/apple.png'),
                ],
              ),

              const Spacer(),

              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigasi ke Login
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Sudah punya akun? ",
                      style: GoogleFonts.urbanist(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Login Sekarang",
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

  Widget _buildTextField(
    String hintText, {
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggle,
  }) {
    return TextField(
      obscureText: isPassword ? obscure : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(),
        filled: true,
        fillColor: const Color(0xFFF4F4F4),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: toggle,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
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
