import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/navigation_controller.dart';
import '../../widgets/inter_text.dart';

class RivrCreateAccountScreen extends StatefulWidget {
  const RivrCreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<RivrCreateAccountScreen> createState() => _RivrCreateAccountScreenState();
}

class _RivrCreateAccountScreenState extends State<RivrCreateAccountScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // Back button
                      GestureDetector(
                        onTap: () {
                          final navigationController = Get.find<NavigationController>();
                          navigationController.navigateToPreLogin();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset('assets/images/rivrArrowBack.svg', width: 18, height: 18),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(child: Image.asset('assets/images/rivrLoginLogo.png', width: 180, height: 80, fit: BoxFit.contain)),
                      const SizedBox(height: 18),
                      Center(
                        child: const InterText(
                          'Create your account',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: const InterText(
                          'Start your free trial today',
                          style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 34),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('First name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                SizedBox(height: 8),
                                _RivrTextField(hintText: 'Harry'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Last name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                SizedBox(height: 8),
                                _RivrTextField(hintText: 'Kane'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text('Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      const _RivrTextField(hintText: 'you@example.com'),
                      const SizedBox(height: 18),
                      const Text('Password', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                obscureText: _obscurePassword,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(color: Colors.white38),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset('assets/images/rivrEyeIcon.svg', width: 22, height: 22, color: Colors.white54),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('Must be at least 8 characters', style: TextStyle(color: Colors.white54, fontSize: 13)),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              // Navigate to subscription screen after successful signup
                              final navigationController = Get.find<NavigationController>();
                              navigationController.handleSuccessfulAuth();
                            },
                            child: const Text('Sign up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Divider with 'or'
                      Row(
                        children: [
                          const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: InterText('or', style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                          const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Google sign up button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F2937),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                          ),
                          icon: SvgPicture.asset('assets/images/rivrGoogleIcon.svg', width: 24, height: 24),
                          label: const InterText('Sign up with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Apple sign up button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F2937),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                          ),
                          icon: SvgPicture.asset('assets/images/rivrAppleIcon.svg', width: 24, height: 24),
                          label: const InterText('Sign up with Apple', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(color: Colors.white70, fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      final navigationController = Get.find<NavigationController>();
                      navigationController.navigateToLogin();
                    },
                    child: const Text('Sign In', style: TextStyle(color: Color(0xFF00A3FF), fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _RivrTextField extends StatelessWidget {
  final String hintText;
  const _RivrTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38),
        ),
      ),
    );
  }
}
