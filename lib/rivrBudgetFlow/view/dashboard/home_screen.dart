import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final scale = width / 375.0; // base iPhone 11 width for scaling
    final horizontalPadding = width * 0.05;
    final cardImageSize = width * 0.13;
    final cardPadding = width * 0.04;
    final cardSpacing = width * 0.04;
    final sectionSpacing = height * 0.03;
    final alertCardHeight = height * 0.22;
    final alertCardPadding = width * 0.05;
    final connectIconSize = width * 0.10;
    final connectTextWidth = width * 0.5;
    final chartSize = width * 0.42;

    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: _getScreen(_selectedIndex)),
            Align(
              alignment: Alignment.bottomCenter,
              child: _CustomNavbar(
                selectedIndex: _selectedIndex,
                onTap: _onNavTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final scale = width / 375.0; // base iPhone 11 width for scaling
    final horizontalPadding = width * 0.05;
    final cardImageSize = width * 0.13;
    final cardPadding = width * 0.04;
    final cardSpacing = width * 0.04;
    final sectionSpacing = height * 0.03;
    final alertCardHeight = height * 0.22;
    final alertCardPadding = width * 0.05;
    final connectIconSize = width * 0.10;
    final connectTextWidth = width * 0.5;
    final chartSize = width * 0.42;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: height * 0.11),
      child: Column(
        children: [
          // Welcome message
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16 * scale),
                Align(
                  alignment: Alignment.topLeft,
                  child: InterText(
                    'Welcome back, Jane!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * scale,
                    ),
                  ),
                ),
                SizedBox(height: 4 * scale),
                InterText(
                  'We love your progress. Keep it up.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14 * scale,
                  ),
                ),
                SizedBox(height: 10 * scale),
                InterText(
                  'June Budget So Far',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16 * scale,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sectionSpacing),
          // Budget summary cards
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(cardPadding),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(cardImageSize / 2),
                              child: Image.asset(
                                'assets/images/money_in.png',
                                height: cardImageSize,
                                width: cardImageSize,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(width: cardSpacing),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InterText(
                                        'Money In',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12 * scale,
                                        ),
                                      ),
                                      InterText(
                                        '\$2,500',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16 * scale,
                                        ),
                                      ),
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
                SizedBox(width: cardSpacing),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(cardPadding),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(cardImageSize / 2),
                              child: Image.asset(
                                'assets/images/money_out.png',
                                height: cardImageSize,
                                width: cardImageSize,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(width: cardSpacing),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InterText(
                                        'Money Out',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12 * scale,
                                        ),
                                      ),
                                      InterText(
                                        '\$85.42',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18 * scale,
                                        ),
                                      ),
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
          SizedBox(height: sectionSpacing),
          // Alert card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: alertCardPadding * 1.5,
                bottom: alertCardPadding * 3,
                left: alertCardPadding,
                right: alertCardPadding,
              ),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/upcoming_bills.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InterText(
                    'You can get back track. Don\'t give up.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * scale,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4 * scale),
                  InterText(
                    '-\$2,414.58',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32 * scale,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2 * scale),
                  InterText(
                    'Minus Pending and Future Transactions',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14 * scale,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing * 0.5),
          // Connect bank button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.012),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: connectIconSize,
                    width: connectIconSize,
                    child: Image.asset('assets/images/connect_account_icon.png', fit: BoxFit.contain)),
                  SizedBox(
                    width: connectTextWidth,
                    child: Image.asset('assets/images/connect_account_text.png', fit: BoxFit.contain)),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing * 0.5),
          // Spending chart
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(cardPadding * 1.5),
              child: Column(
                children: [
                  InterText(
                    "This Month's Spending",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * scale,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 0.6),
                  // Custom circular chart
                  SizedBox(
                    height: chartSize,
                    width: chartSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: Size(chartSize, chartSize),
                          painter: _SpendingChartPainter(),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Surplus',
                              style: TextStyle(
                                color: Color(0xFF4ADE80),
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * scale,
                              ),
                            ),
                            SizedBox(height: 4 * scale),
                            Text(
                              '￠2,414.58',
                              style: TextStyle(
                                color: Color(0xFF4ADE80),
                                fontWeight: FontWeight.bold,
                                fontSize: 22 * scale,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 0.6),
                  Divider(
                    color: const Color(0xFF9CA3AF),
                    thickness: 1,
                    height: 24,
                  ),
                  SizedBox(height: sectionSpacing * 0.6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Color(0xFFFB923C), size: 12 * scale),
                          SizedBox(width: 8 * scale),
                          InterText(
                            'Money Spent So Far',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14 * scale,
                            ),
                          ),
                          Spacer(),
                          InterText(
                            '3%',
                            style: TextStyle(
                              color: Color(0xFFFB923C),
                              fontWeight: FontWeight.bold,
                              fontSize: 14 * scale,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12 * scale),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Color(0xFF4ADE80), size: 12 * scale),
                          SizedBox(width: 8 * scale),
                          InterText(
                            'Budget Left',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14 * scale,
                            ),
                          ),
                          Spacer(),
                          InterText(
                            '97%',
                            style: TextStyle(
                              color: Color(0xFF4ADE80),
                              fontWeight: FontWeight.bold,
                              fontSize: 14 * scale,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing),
        ],
      ),
    );
  }
}

class _CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const _CustomNavbar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

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
                color: Color(0xFF1F2937),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
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
            bottom: 0.04.sh,
            child: Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _mainGradient,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 28),
                    onPressed: () {},
                    splashRadius: 28,
                  ),
                ),
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
    final width = MediaQuery.of(context).size.width;
    final scale = width / 375.0;
    Widget iconWidget = Image.asset(
      isActive && selectedIcon != null ? selectedIcon! : icon,
      height: 64 * scale,
      width: 64 * scale,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
        ],
      ),
    );
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
    final Paint bgPaint = Paint()
      ..color = const Color(0xFF23242A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), 0, 2 * pi, false, bgPaint);

    // Draw green arc (budget left)
    final Paint leftPaint = Paint()
      ..color = const Color(0xFF4ADE80)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle + spentSweep, leftSweep, false, leftPaint);

    // Draw orange arc (money spent)
    final Paint spentPaint = Paint()
      ..color = const Color(0xFFFB923C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle, spentSweep, false, spentPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
