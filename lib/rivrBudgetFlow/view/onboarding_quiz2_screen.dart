import 'package:flutter/material.dart';
import '../../widgets/inter_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'onboarding_quiz3_screen.dart';

class OnboardingQuiz2Screen extends StatefulWidget {
  const OnboardingQuiz2Screen({super.key});

  @override
  State<OnboardingQuiz2Screen> createState() => _OnboardingQuiz2ScreenState();
}

class _OnboardingQuiz2ScreenState extends State<OnboardingQuiz2Screen> {
  final List<Map<String, dynamic>> goals = [
    {'title': 'Emergency Fund', 'image': 'assets/images/emergencyfund.png', 'desc': 'Short-term savings for unexpected events', 'selected': false},
    {'title': 'Home Down Payment', 'image': 'assets/images/homedownpayment.png', 'desc': 'Save for your dream home', 'selected': false},
    {'title': 'Travel Fund', 'image': 'assets/images/travelfund.png', 'desc': 'Plan your next adventure', 'selected': false},
    {'title': 'Car Fund', 'image': 'assets/images/carfund.png', 'desc': 'Save for a new car', 'selected': false},
    {'title': 'Debt Payoff', 'image': 'assets/images/debt.png', 'desc': 'Get out of debt sooner', 'selected': false},
    {'title': 'Education Fund', 'image': 'assets/images/educationfund.png', 'desc': 'Invest in your future', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            LinearPercentIndicator(
              percent: 0.5,
              lineHeight: 8,
              barRadius: const Radius.circular(10),
              backgroundColor: const Color(0xFF303A48),
              linearGradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
            ),
            const SizedBox(height: 12),
            const Center(child: InterText('Step 2 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
            const SizedBox(height: 16),
            const InterText('Set Your Savings Goals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const InterText(
              'Choose goals to match your lifestyle or add your own. These will appear on your goals dashboard.',
              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ...goals.map((goal) => _buildGoalCard(goal, width)).toList(),
                  const SizedBox(height: 16),
                  _buildAddCustomGoalCard(width),
                  const SizedBox(height: 16),
                  Center(
                    child: InterText(
                      '${goals.where((g) => g['selected']).length} goals selected',
                      style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingQuiz3Screen()));
                  },
                  child: const InterText('Continue To Goals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalCard(Map<String, dynamic> goal, double width) {
    final isExpanded = goal['selected'] as bool;
    return GestureDetector(
      onTap: () {
        setState(() {
          goal['selected'] = !goal['selected'];
        });
      },
      child: Container(
        width: width - 32,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(goal['image'], width: 32, height: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child:
                      isExpanded
                          ? GestureDetector(
                            onTap: () {
                              setState(() {
                                goal['selected'] = false;
                              });
                            },
                            child: Image.asset('assets/images/minussignimage.png', width: 32, height: 32),
                          )
                          : Container(
                            height: 24,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/setbudgeticon.png', fit: BoxFit.scaleDown),
                                const SizedBox(width: 6),
                                InterText('SET BUDGET', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
                              ],
                            ),
                          ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InterText(goal['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 4),
          InterText(goal['desc'], style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFF303A48), thickness: 1),
          const SizedBox(height: 8),
          if (!isExpanded)
            Center(
              child: InterText(
                'Tap to Select',
                style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            InterText('Goal Amount', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                hintText: 'Enter amount',
                hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset('assets/images/dollaricon.png', width: 20, height: 20)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            InterText('Timeline (months)', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                hintText: 'Enter months',
                hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset('assets/images/calendaricon.png', width: 20, height: 20)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ],
      ),
      ),
    );
  }

  Widget _buildAddCustomGoalCard(double width) {
    return Container(
      width: width - 32,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3B82F6), style: BorderStyle.solid, width: 1.5),
        // To make it dashed, you can use a custom painter or a package if needed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/plusbuttonicon.png', fit: BoxFit.scaleDown),
          const SizedBox(height: 8),
          const InterText('Add Custom Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const InterText('Create your own savings goal', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
