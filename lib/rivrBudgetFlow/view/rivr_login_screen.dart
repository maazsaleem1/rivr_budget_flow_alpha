import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'rivr_create_account_screen.dart';
import 'rivr_subscription_screen.dart';
import '../../widgets/inter_text.dart';

class RivrLoginScreen extends StatefulWidget {
  const RivrLoginScreen({super.key});

  @override
  State<RivrLoginScreen> createState() => _RivrLoginScreenState();
}

class _RivrLoginScreenState extends State<RivrLoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),
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
                      const SizedBox(height: 68),
                      Center(child: Image.asset('assets/images/rivrLoginLogo.png', width: 180, height: 80, fit: BoxFit.contain)),
                      const SizedBox(height: 18),
                      const Center(
                        child: InterText('Sign in to your account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26)),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: InterText(
                          'Welcome back! Please enter your details.',
                          style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const InterText('Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF23242A), borderRadius: BorderRadius.circular(8)),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            hintText: 'you@example.com',
                            hintStyle: TextStyle(color: Colors.white38),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text('Password', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF23242A), borderRadius: BorderRadius.circular(8)),
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
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [GestureDetector(onTap: () {}, child: Image.asset('assets/images/textGradientForgotPass.png', height: 22))],
                      ),
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
                              Get.to(() => const RivrSubscriptionScreen());
                            },
                            child: const Text('Sign in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
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
                  const Text('Don\'t have an account? ', style: TextStyle(color: Colors.white70, fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RivrCreateAccountScreen());
                    },
                    child: const Text('Sign up', style: TextStyle(color: Color(0xFF00D1E9), fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
