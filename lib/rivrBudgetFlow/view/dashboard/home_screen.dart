import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/inter_text.dart';
import 'activity_screen.dart';
import 'budget_screen.dart';
import 'goals_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      appBar: CustomAppBar(
        onMenuTap: () {
          showDialog(context: context, barrierColor: Colors.black54, builder: (context) => const ProfileDialog());
        },
      ),
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
                  child: InterText('Welcome back, Jane!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 4),
                InterText('We love your progress. Keep it up.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 10),
                InterText('June Budget So Far', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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

                                      const InterText('\$2,500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
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
          SizedBox(height: sectionSpacing),
          // Alert card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: alertCardPadding * 1.5, bottom: alertCardPadding * 3, left: alertCardPadding, right: alertCardPadding),
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/images/upcoming_bills.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InterText(
                    'You can get back track. Don\'t give up.',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14 * scale),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4 * scale),
                  InterText(
                    '-\$2,414.58',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32 * scale),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2 * scale),
                  InterText(
                    'Minus Pending and Future Transactions',
                    style: TextStyle(color: Colors.white70, fontSize: 14 * scale),
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
          SizedBox(height: sectionSpacing * 0.5),
          // Spending chart
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InterText("This Month's Spending", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 * scale)),
                  SizedBox(height: sectionSpacing * 0.6),
                  // Custom circular chart
                  SizedBox(
                    height: chartSize,
                    width: chartSize,
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
                        children: [
                          Icon(Icons.circle, color: Color(0xFFFB923C), size: 12 * scale),
                          SizedBox(width: 8 * scale),
                          InterText('Money Spent So Far', style: TextStyle(color: Colors.white70, fontSize: 14 * scale)),
                          Spacer(),
                          InterText('3%', style: TextStyle(color: Color(0xFFFB923C), fontWeight: FontWeight.bold, fontSize: 14 * scale)),
                        ],
                      ),
                      SizedBox(height: 12 * scale),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Color(0xFF4ADE80), size: 12 * scale),
                          SizedBox(width: 8 * scale),
                          InterText('Budget Left', style: TextStyle(color: Colors.white70, fontSize: 14 * scale)),
                          Spacer(),
                          InterText('97%', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 14 * scale)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing),
          // White info box: Getting Started
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 20.w),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterText(
                    "Let's get you started with Rivr BudgetFlow",
                    style: TextStyle(color: const Color(0xFF020817), fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  SizedBox(height: 8.h),
                  InterText('Follow the easy steps below to set up your budget', style: TextStyle(color: const Color(0xFF6B7280), fontSize: 14.sp)),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/exclamationicon.png', // Make sure this asset exists
                        height: 20.w,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      InterText('Swipe to dismiss', style: TextStyle(color: const Color(0xFF020817), fontSize: 13.sp, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing * 0.7),
          // Gradient Getting Started box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InterText('Getting Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1.5), borderRadius: BorderRadius.circular(20)),
                        child: InterText('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  // Steps
                  ...List.generate(5, (index) {
                    final steps = [
                      'Add income (money in)',
                      'Add expenses (money out)',
                      'Set your budget limits',
                      'Connect your bank account',
                      'Review and finish',
                    ];
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 4 ? 0 : 12.h),
                      child: Row(
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: InterText(
                                '${index + 1}',
                                style: TextStyle(color: const Color(0xFF008FED), fontWeight: FontWeight.bold, fontSize: 16.sp),
                              ),
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: InterText(steps[index], style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.chevron_right, color: Colors.white, size: 28.w),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: sectionSpacing * 0.7),
          // Dark status box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 28.w, horizontal: 18.w),
              decoration: BoxDecoration(color: const Color(0xFF020817), borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/tickmarkicon.png', height: 44.w, width: 44.w)),
                  SizedBox(height: 18.h),
                  InterText(
                    "Your Budget's On Track",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  InterText(
                    "You're staying within all your budget limits so far. Great job!",
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 170.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008FED),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: InterText('View All Budgets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.sp)),
                    ),
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

  const _CustomNavbar({super.key, required this.selectedIndex, required this.onTap});

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
            bottom: 0.04.sh,
            child: Center(
              child: Container(
                width: 64,
                height: 64,
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

// ProfileDialog for profile menu
class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h, bottom: 40.h),
      child: Container(
        width: 380.w,
        height: 609.h,
        decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(18.r)),
        padding: EdgeInsets.all(25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // User info
            Row(
              children: [
                CircleAvatar(radius: 24.w, backgroundImage: AssetImage('assets/images/profile-avatar.png')),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    InterText('Free Trial (12 days left)', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(icon: 'assets/images/accounticon.png', text: 'Account Information', onTap: () {}),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(icon: 'assets/images/transaction.png', text: 'Transaction History', onTap: () {}),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(icon: 'assets/images/Setting.png', text: 'App Settings', onTap: () {}),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(icon: 'assets/images/helpandsupport.png', text: 'Help & Support', onTap: () {}),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(icon: 'assets/images/customersupport.png', text: 'Contact Support', onTap: () {}),
            SizedBox(height: 22.h),
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(minHeight: 44.h),
                    child: InterText('Log out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileDialogTile extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const _ProfileDialogTile({required this.icon, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(icon, height: 24.h, width: 24.w),
      title: InterText(text, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.white, size: 22.w),
      onTap: onTap,
    );
  }
}
