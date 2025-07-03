import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'rivr_login_screen.dart';
import '../../widgets/inter_text.dart';

class RivrPreLoginScreen extends StatelessWidget {
  const RivrPreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 48),
              // Logo in circle
              Center(
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: const Color(0xFF23242A),
                  ),
                  child: Center(child: Image.asset('assets/images/preLoginLogo.png', width: 220, height: 220)),
                ),
              ),
              const SizedBox(height: 36),
              // App name
              const InterText('Rivr BudgetFlow', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 16),
              // Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF008FED), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                ],
              ),
              const SizedBox(height: 20),
              // Google login button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF23242A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  icon: SvgPicture.asset('assets/images/rivrGoogleIcon.svg', width: 24, height: 24),
                  label: const InterText('Continue with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              // Apple login button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF23242A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  icon: SvgPicture.asset('assets/images/rivrAppleIcon.svg', width: 24, height: 24),
                  label: const InterText('Continue with Apple', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              // Divider with 'or'
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: InterText('or', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 16)),
                  ),
                  const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),
              // Email login button with gradient
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                  ),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: SvgPicture.asset('assets/images/rivrEmailIcon.svg', width: 24, height: 24),
                    label: const InterText('Continue With Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    onPressed: () {
                      Get.to(() => RivrLoginScreen());
                    },
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
