import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/inter_text.dart';
import '../../../widgets/custom_app_bar.dart';
import 'budget_screen.dart';
import 'goals_screen.dart';
import 'activity_screen.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return _HomeContent();
      case 1:
        return const BudgetScreen();
      case 2:
        return const GoalsScreen();
      case 3:
        return const ActivityScreen();
      default:
        return _HomeContent();
    }
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: _getScreen(_selectedIndex)),
            Align(alignment: Alignment.bottomCenter, child: _CustomNavbar(selectedIndex: _selectedIndex, onTap: _onNavTap)),
          ],
        ),
      ),
    );
  }
}

// Extracted the original home content to a separate widget for clarity
class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 90),
      child: Column(
        children: [
          // Welcome message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: InterText('Welcome back, Jane!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 4),
                InterText('We love your progress. Keep it up.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 10),
                InterText('June Budget So Far', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Budget summary cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 50, width: 50, child: Image.asset('assets/images/money_in.png')),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const InterText('Money In', style: TextStyle(color: Colors.white70, fontSize: 14)),

                                      const InterText('\$3,500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 50, width: 50, child: Image.asset('assets/images/money_out.png')),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const InterText('Money Out', style: TextStyle(color: Colors.white70, fontSize: 14)),

                                      const InterText('\$85.42', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          // Alert card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, bottom: 60, left: 20, right: 20),
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/images/upcoming_bills.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  InterText(
                    'You can get back track. Don\'t give up.',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  InterText(
                    '-\$2,414.58',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2),
                  InterText(
                    'Minus Pending and Future Transactions',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Connect bank button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40, width: 40, child: Image.asset('assets/images/connect_account_icon.png')),
                  SizedBox(
                    // height: 120,
                    width: 220,
                    child: Image.asset('assets/images/connect_account_text.png'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Spending chart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const InterText("This Month's Spending", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  // Custom circular chart
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(size: const Size(160, 160), painter: _SpendingChartPainter()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Surplus', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 4),
                            Text('￠2,414.58', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 22)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Color(0xFF9CA3AF), thickness: 1, height: 24),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.circle, color: Color(0xFFFB923C), size: 12),
                          SizedBox(width: 8),
                          InterText('Money Spent So Far', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          Spacer(),
                          InterText('3%', style: TextStyle(color: Color(0xFFFB923C), fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.circle, color: Color(0xFF4ADE80), size: 12),
                          SizedBox(width: 8),
                          InterText('Budget Left', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          Spacer(),
                          InterText('97%', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const _CustomNavbar({Key? key, required this.selectedIndex, required this.onTap}) : super(key: key);

  static const LinearGradient _mainGradient = LinearGradient(
    colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Nav bar background and items
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF23242A),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavbarItem(
                    icon: 'assets/images/normal_home.png',
                    selectedIcon: 'assets/images/gradient_home.png',
                    label: 'Home',
                    isActive: selectedIndex == 0,
                    useGradient: true,
                    gradient: _mainGradient,
                    onTap: () => onTap(0),
                  ),
                  _NavbarItem(
                    icon: 'assets/images/normal_budget.png',
                    selectedIcon: 'assets/images/gradient_budget.png',
                    label: 'My Budget',
                    isActive: selectedIndex == 1,
                    onTap: () => onTap(1),
                  ),
                  const SizedBox(width: 64), // Space for FAB
                  _NavbarItem(
                    icon: 'assets/images/normal_goal.png',
                    selectedIcon: 'assets/images/gradient_goal.png',
                    label: 'Goals',
                    isActive: selectedIndex == 2,
                    onTap: () => onTap(2),
                  ),
                  _NavbarItem(
                    icon: 'assets/images/normal_activity.png',
                    selectedIcon: 'assets/images/gradient_activity.png',
                    label: 'Activity',
                    isActive: selectedIndex == 3,
                    onTap: () => onTap(3),
                  ),
                ],
              ),
            ),
          ),
          // Floating center FAB
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _mainGradient,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Center(child: IconButton(icon: const Icon(Icons.add, color: Colors.white, size: 36), onPressed: () {}, splashRadius: 36)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavbarItem extends StatelessWidget {
  final String icon;
  final String? selectedIcon;
  final String label;
  final bool isActive;
  final bool isPng;
  final bool useGradient;
  final Gradient? gradient;
  final VoidCallback onTap;

  const _NavbarItem({
    Key? key,
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.isActive = false,
    this.isPng = true,
    this.useGradient = false,
    this.gradient,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Image.asset(isActive && selectedIcon != null ? selectedIcon! : icon, height: 44);

    return GestureDetector(onTap: onTap, behavior: HitTestBehavior.opaque, child: Column(mainAxisSize: MainAxisSize.min, children: [iconWidget]));
  }
}

class _SpendingChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 14;
    final Rect rect = Offset.zero & size;
    final double startAngle = -pi / 2;
    final double spentSweep = 2 * pi * 0.15; // 15%
    final double leftSweep = 2 * pi * 0.85; // 85%

    // Draw background circle (optional, for subtle shadow)
    final Paint bgPaint =
        Paint()
          ..color = const Color(0xFF23242A)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), 0, 2 * pi, false, bgPaint);

    // Draw green arc (budget left)
    final Paint leftPaint =
        Paint()
          ..color = const Color(0xFF4ADE80)
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle + spentSweep, leftSweep, false, leftPaint);

    // Draw orange arc (money spent)
    final Paint spentPaint =
        Paint()
          ..color = const Color(0xFFFB923C)
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle, spentSweep, false, spentPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
