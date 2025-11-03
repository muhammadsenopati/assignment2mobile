import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            child: Column(
              children: [
                // ======= HEADER GAMBAR =======
                Container(
                  height: screenHeight * 0.45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cinema_2.jpeg'),
                      fit: BoxFit.cover,
                      opacity: 0.95,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login',
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

                // ======= FORM LOGIN =======
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.07,
                    vertical: screenHeight * 0.03,
                  ),
                  child: Column(
                    children: [
                      // Email Field
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon:
                              const Icon(Icons.email_outlined, color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Password Field
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon:
                              const Icon(Icons.lock_outline, color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.cyanAccent.shade400,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ======= LOGIN BUTTON =======
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E3350),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: const BorderSide(
                                  color: Color(0xFF4D5D80), width: 1.2),
                            ),
                            elevation: 6,
                            shadowColor: Colors.cyanAccent.withOpacity(0.3),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[700])),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Or',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[700])),
                        ],
                      ),
                      const SizedBox(height: 22),

                      // ======= LOGIN GOOGLE =======
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            side: const BorderSide(
                                color: Color(0xFF505C7C), width: 1.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png',
                                height: 22,
                                width: 22,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Login With  Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.038,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ======= LOGIN FACEBOOK =======
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            side: const BorderSide(
                                color: Color(0xFF505C7C), width: 1.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook,
                                  color: Colors.blue[400], size: 24),
                              const SizedBox(width: 12),
                              Text(
                                'Login with  Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.038,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ======= REGISTER LINK =======
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Register here',
                              style: TextStyle(
                                color: Colors.cyanAccent.shade400,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
