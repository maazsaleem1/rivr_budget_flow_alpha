import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/inter_text.dart';

class OnboardingQuiz5Screen extends StatelessWidget {
  const OnboardingQuiz5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                LinearPercentIndicator(
                  percent: 1.0,
                  lineHeight: 8,
                  barRadius: const Radius.circular(10),
                  backgroundColor: const Color(0xFF303A48),
                  linearGradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                ),
                const SizedBox(height: 12),
                const Center(child: InterText('Step 4 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
                const SizedBox(height: 24),
                const InterText('One More Step', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 18),
                // Share with friends container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InterText('Share with friends', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      const InterText(
                        'Youre more likely to follow through when you share your progress — and someone else might need the spark to start too.',
                        style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _socialIconButton('assets/images/twitter.png'),
                              const SizedBox(width: 10),
                              _socialIconButton('assets/images/facebook.png'),
                              const SizedBox(width: 10),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              _socialIconButton('assets/images/linkedin.png'),
                              const SizedBox(width: 10),
                              _socialIconButton('assets/images/email.png'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(color: const Color(0xFF121A28), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(child: InterText('https://app.rivr.me?ref=app', style: const TextStyle(color: Colors.white, fontSize: 14))),
                            IconButton(icon: const Icon(Icons.copy, color: Color(0xFF3B82F6), size: 20), onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const InterText("What's next?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                _checklistItem('Explore your dashboard', 'Get a complete overview of your financial health'),
                const SizedBox(height: 12),
                _checklistItem('Track your transactions', 'See where your money is going'),
                const SizedBox(height: 12),
                _checklistItem('Monitor your budget', 'Stay on track with your spending limits'),
                const SizedBox(height: 12),
                _checklistItem('Work toward your goals', 'Make progress on what matters most to you'),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const InterText('Go to Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIconButton(String imagePath) {
    return Image.asset(imagePath);
  }

  Widget _checklistItem(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 22,
          height: 22,
          decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
              const SizedBox(height: 2),
              InterText(desc, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ],
    );
  }
}
