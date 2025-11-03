import 'package:flutter/material.dart';
import 'profile_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.07,
              vertical: 20,
            ),
            child: Column(
              children: [
                // ======= HEADER GAMBAR CINEMATIC =======
                Container(
                  height: screenHeight * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/cinema_2.jpeg'),
                      fit: BoxFit.cover,
                      opacity: 0.9,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.65),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign-up',
                          style: TextStyle(
                            fontSize: screenWidth * 0.09,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Let's get started",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // ======= FORM INPUT =======
                Column(
                  children: [
                    _buildTextField(
                      controller: _nameController,
                      hint: 'Your Full Name',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 14),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 14),
                    _buildPasswordField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscure: _obscurePassword,
                      onToggle: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    const SizedBox(height: 14),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      hint: 'Confirm Password',
                      obscure: _obscureConfirmPassword,
                      onToggle: () {
                        setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ======= REGISTER BUTTON (warna disesuaikan) =======
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3E4263), // Warna seperti di gambar
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // teks putih
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ======= LOGIN LINK =======
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Login here',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ====== TEXT FIELD BUILDER ======
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ====== PASSWORD FIELD BUILDER ======
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
