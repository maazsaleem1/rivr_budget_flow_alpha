import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../widgets/inter_text.dart';
import 'onboarding_quiz5_screen.dart';

class OnboardingQuiz4Screen extends StatelessWidget {
  const OnboardingQuiz4Screen({super.key});

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
                const InterText('Connect Your Bank Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                const InterText(
                  'Connect your bank account to automatically\ntrack transactions and get personalized\ninsights.',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                // Pro/Account Connected/Free Trial container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF3B82F6), width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Color(0xFF3B82F6), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('Pro', style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      const InterText('0 of 1 account connected', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: const Color(0xFF232F3E), borderRadius: BorderRadius.circular(6)),
                        child: const Text('Free Trial', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Feature containers
                _featureBox(width, 'assets/images/readonly.png', 'Read-Only Access', 'We can view your transactions but cannot move your money.'),
                const SizedBox(height: 16),
                _featureBox(width, 'assets/images/instantsync.png', 'Instant Sync', 'Automatically categorize and track all your transactions.'),
                const SizedBox(height: 16),
                _featureBox(width, 'assets/images/accounttype.png', 'All Account Types', 'Checking, savings, credit cards, and investment accounts.'),
                const SizedBox(height: 24),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingQuiz5Screen()));
                      },
                      child: const InterText('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: InterText(
                    'You can always connect accounts\nlater in Settings',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureBox(double width, String imagePath, String title, String desc) {
    return Container(
      width: width - 32,
      height: 209,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 48, height: 48),
          const SizedBox(height: 18),
          InterText(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          InterText(desc, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
