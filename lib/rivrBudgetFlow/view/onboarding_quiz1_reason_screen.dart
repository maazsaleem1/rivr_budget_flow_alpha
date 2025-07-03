import 'package:flutter/material.dart';
import '../../widgets/inter_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'onboarding_quiz2_screen.dart';

class OnboardingQuiz1ReasonScreen extends StatefulWidget {
  const OnboardingQuiz1ReasonScreen({super.key});

  @override
  State<OnboardingQuiz1ReasonScreen> createState() => _OnboardingQuiz1ReasonScreenState();
}

class _OnboardingQuiz1ReasonScreenState extends State<OnboardingQuiz1ReasonScreen> {
  final List<bool> _expanded = [true, false, false, false, false, false];

  final List<List<bool>> _checked = [
    [false, false, false, false, false, false],
    [false],
    [false],
    [false],
    [false, false, false, false],
    [false],
  ];

  final List<String> panelTitles = [
    'Better Money Habits',
    'Hitting Big Goals',
    'Family & Kids',
    'Building System & Freedom',
    'Chilling Out of Debt',
    'Personal Growth',
  ];

  final List<String> panelSubtitles = [
    'Take control of your daily money decisions',
    'Make your dreams a reality',
    'Create a legacy for your loved ones',
    'Build wealth & freedom',
    'Get out of debt for good',
    'Grow as a person',
  ];

  final List<List<String>> panelOptions = [
    [
      'End my toxic relationships with money',
      'Track my spending',
      'Keep better track of where my money is going',
      'Fix my spending habits',
      'Be more accountable with money',
      'Feel more in control of my money',
    ],
    ['I want to buy a house'],
    ['I want to provide for my family'],
    ['I want to have more freedom'],
    ['No more credit card debt', 'No more student loans', 'No more car payments', 'No more medical debt'],
    ['I want to grow as a person'],
  ];

  final List<String> panelImages = [
    'assets/images/bettermoneyhabbitimage.png',
    'assets/images/hittingbiggoalimage.png',
    'assets/images/famlyandlegacyiamge.png',
    'assets/images/buildingwealth.png',
    'assets/images/gettingoutofdebt.png',
    'assets/images/personalgrowth.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              LinearPercentIndicator(
                percent: 0.25,
                lineHeight: 8,
                barRadius: const Radius.circular(10),
                backgroundColor: const Color(0xFF303A48),
                linearGradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
              ),
              const SizedBox(height: 24),
              const Center(child: InterText('Step 1 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
              const SizedBox(height: 24),
              const InterText(
                'What\'s your reason for\ntaking control of your money?',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 12),
              const InterText(
                'Select one (or more) reasons that resonate with you. You can update these later.',
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int panelIdx = 0; panelIdx < panelTitles.length; panelIdx++) ...[
                        ExpansionPanelList(
                          elevation: 0,
                          expandedHeaderPadding: EdgeInsets.zero,
                          expandIconColor: Colors.white,
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _expanded[panelIdx] = !_expanded[panelIdx];
                            });
                          },
                          children: [
                            ExpansionPanel(
                              canTapOnHeader: true,
                              backgroundColor: const Color(0xFF1F2937),
                              headerBuilder: (context, isExpanded) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(panelImages[panelIdx], width: 28, height: 28),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            InterText(
                                              panelTitles[panelIdx],
                                              style: const TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 16),
                                            ),
                                            if (panelSubtitles[panelIdx].isNotEmpty) ...[
                                              const SizedBox(height: 2),
                                              InterText(
                                                panelSubtitles[panelIdx],
                                                style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              body: Column(
                                children: List.generate(panelOptions[panelIdx].length, (optIdx) {
                                  final isSelected = _checked[panelIdx][optIdx];
                                  return Stack(
                                    children: [
                                      if (isSelected)
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1F2937), // match background
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            height: 64,
                                          ),
                                        ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border:
                                              isSelected
                                                  ? Border.all(color: Colors.transparent, width: 2)
                                                  : Border.all(color: Color(0x26FFFFFF), width: 1),
                                        ),
                                        child: _buildCheckboxTile(panelIdx, optIdx),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                              isExpanded: _expanded[panelIdx],
                            ),
                          ],
                        ),
                        if (panelIdx != panelTitles.length - 1) const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: InterText(
                  'Select the reasons that resonate with you',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16, fontWeight: FontWeight.w400),
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
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingQuiz2Screen()));
                    },
                    child: const InterText('Continue To Goals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxTile(int panelIdx, int optIdx) {
    return CheckboxListTile(
      value: _checked[panelIdx][optIdx],
      onChanged: (val) {
        setState(() {
          _checked[panelIdx][optIdx] = val ?? false;
        });
      },
      title: InterText(panelOptions[panelIdx][optIdx], style: const TextStyle(color: Colors.white, fontSize: 15)),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0xFF06B6D4),
      checkColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
