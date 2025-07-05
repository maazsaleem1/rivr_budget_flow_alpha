import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/inter_text.dart';
import 'activity_screen.dart';
import 'budget_screen.dart';
import 'goals_screen.dart';
import '../../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
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

    Widget getScreen(int index) {
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
            Obx(() => Positioned.fill(child: getScreen(controller.selectedIndex.value))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() => _CustomNavbar(selectedIndex: controller.selectedIndex.value, onTap: controller.onNavTap)),
            ),
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
    final HomeController controller = Get.find<HomeController>();
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
                  child: Obx(
                    () => InterText(
                      'Welcome back, ${controller.userName.value}!',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Obx(() => InterText(controller.welcomeMessage.value, style: TextStyle(color: Colors.white70, fontSize: 14))),
                SizedBox(height: 10),
                Obx(() => InterText(controller.budgetTitle.value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const InterText(
                                    'Money In',
                                    style: TextStyle(color: Colors.white70, fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Obx(
                                    () => InterText(
                                      '\$4${controller.moneyIn.value.toStringAsFixed(2)}',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const InterText(
                                    'Money Out',
                                    style: TextStyle(color: Colors.white70, fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Obx(
                                    () => InterText(
                                      '\$4${controller.moneyOut.value.toStringAsFixed(2)}',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008FED),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Obx(
              () => Column(
                children: [
                  // Toggle
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.selectHomeTab(0),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: controller.homeTabIndex.value == 0 ? const Color(0xFF020817) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text('Categories', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.selectHomeTab(1),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: controller.homeTabIndex.value == 1 ? const Color(0xFF020817) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text('Transactions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (controller.homeTabIndex.value == 0) ...[
                    SizedBox(height: 18),
                    Center(child: Text('Budget Categories', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15, fontWeight: FontWeight.w500))),
                    SizedBox(height: 12),
                    ...controller.categories.map(
                      (cat) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _CategoryCard(
                          image: cat.image,
                          title: cat.title,
                          amount: cat.amount,
                          total: cat.total,
                          percent: cat.percent,
                          editIcon: cat.editIcon,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                  if (controller.homeTabIndex.value == 1) ...[
                    SizedBox(height: 18),
                    Center(child: Text('Budget Categories', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15, fontWeight: FontWeight.w500))),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: _TransactionCard(
                        image: 'assets/images/heb.png',
                        title: 'H-E-B',
                        subtitle: 'Food · Today, 2:30 PM',
                        amount: '-\$85.42',
                        amountColor: Color(0xFFDC2625),
                        expandedTitle: 'H-E-B',
                        expandedSubtitle: '',
                        buttons: [
                          _TransactionButton(label: 'Assign to Goal', color: Color(0xFF020817), onPressed: () => showAssignToGoalDialog(context)),
                          _TransactionButton(
                            label: 'Edit',
                            color: Color(0xFF020817),
                            onPressed: () => showEditTransactionDialog(context, horizontalPadding),
                          ),
                          _TransactionButton(label: 'Delete', color: Color(0xFFDC2625), onPressed: () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: _TransactionCard(
                        image: 'assets/images/chase.png',
                        title: 'Salary Deposit - Chase (3505)',
                        subtitle: 'Income · Yesterday',
                        amount: '+\$2500.00',
                        amountColor: Color(0xFF22C55D),
                        expandedTitle: 'Monthly salary',
                        expandedSubtitle: '',
                        buttons: [
                          _TransactionButton(label: 'Assign to Goal', color: Color(0xFF020817), onPressed: () => showAssignToGoalDialog(context)),
                          _TransactionButton(
                            label: 'Edit',
                            color: Color(0xFF020817),
                            onPressed: () => showEditTransactionDialog(context, horizontalPadding),
                          ),
                          _TransactionButton(label: 'Delete', color: Color(0xFFDC2625), onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF6B7280)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: Text('View All Expense Categories', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Budgeting Goals Box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Budgeting Goals',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text("You don't have any active goals yet.", style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15), textAlign: TextAlign.center),
                  SizedBox(height: 18),
                  SizedBox(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Create a Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          // Budgeting Tips Heading
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text('Budgeting Tips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(height: 16),
          // Tips List
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                _TipsTile(title: 'Tips to Improve Your Financial Health'),
                Divider(color: Color(0xFF374151), height: 1),
                _TipsTile(title: 'Debt Management Strategies'),
                Divider(color: Color(0xFF374151), height: 1),
                _TipsTile(title: 'Saving & Investment Basics'),
              ],
            ),
          ),
          SizedBox(height: 28),
          // Need Help Getting Started
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'Need Help Getting Started?',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Watch our Quick Tutorial',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Learn how to make the most of your financial dashboard',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
                  SizedBox(
                    width: 140,
                    height: 38,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Watch Video', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Category Card Widget
class _CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String amount;
  final String total;
  final int percent;
  final String editIcon;

  const _CategoryCard({
    required this.image,
    required this.title,
    required this.amount,
    required this.total,
    required this.percent,
    required this.editIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 32, height: 32),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback:
                              (bounds) => LinearGradient(
                                colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                          child: Text('\$240', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                        Text(' / ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                        Text('\$150', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('0%', style: TextStyle(color: Color(0xff22C55D), fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(height: 2),
                  GestureDetector(onTap: () {}, child: Image.asset(editIcon, width: 20, height: 20)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: percent / 100,
              minHeight: 8,
              backgroundColor: Color(0xFF374151),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Line-items', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
              Spacer(),
              Text('0 items', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
            ],
          ),
          SizedBox(height: 6),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'No line-items yet. ', style: TextStyle(color: Color(0xFF3B82F6), fontSize: 13)),
                  TextSpan(text: 'Click to add some.', style: TextStyle(color: Color(0xFF06B6D4), fontSize: 13, fontWeight: FontWeight.w600)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
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

class _TipsTile extends StatelessWidget {
  final String title;
  const _TipsTile({required this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 26),
      onTap: () {},
    );
  }
}

class _TransactionCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String expandedTitle;
  final String expandedSubtitle;
  final List<_TransactionButton> buttons;

  const _TransactionCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.expandedTitle,
    required this.expandedSubtitle,
    required this.buttons,
  });

  @override
  State<_TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<_TransactionCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.image),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(height: 2),
                      Text(widget.subtitle, style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                ),
                Text(widget.amount, style: TextStyle(color: widget.amountColor, fontWeight: FontWeight.bold, fontSize: 14)),
                IconButton(
                  icon: AnimatedRotation(
                    turns: expanded ? 0.5 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 28),
                  ),
                  onPressed: () => setState(() => expanded = !expanded),
                ),
              ],
            ),
          ),
          if (expanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.expandedTitle, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: widget.buttons),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TransactionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const _TransactionButton({super.key, required this.label, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 0,
        minimumSize: Size(0, 38),
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

// 1. Update showEditTransactionDialog to accept horizontalPadding as a parameter
void showEditTransactionDialog(BuildContext context, double horizontalPadding) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      int transactionType = 0; // 0: Expense, 1: Income
      DateTime _selectedDate = DateTime.now();
      TextEditingController _dateController = TextEditingController(text: 'Today');
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: const Color(0xFF111827),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Edit Transaction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                        GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text('Update the details of your transaction.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
                    SizedBox(height: 22),
                    Text('Transaction Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          hintText: 'HEB',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Transaction Type', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => transactionType = 0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: transactionType == 0 ? LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]) : null,
                                color: transactionType == 0 ? null : Color(0xFF1F2937),
                              ),
                              alignment: Alignment.center,
                              child: Text('Expense', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => transactionType = 1),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: transactionType == 1 ? LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]) : null,
                                color: transactionType == 1 ? null : Color(0xFF1F2937),
                              ),
                              alignment: Alignment.center,
                              child: Text('Income', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Text('Amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset('assets/images/dollaricon.png', width: 18, height: 18),
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
                          hintText: '56.88',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Budget Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset('assets/images/dollaricon.png', width: 18, height: 18),
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
                          hintText: 'Food / \$85.42',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF9CA3AF)),
                        ),
                        readOnly: true,
                        onTap: () {}, // TODO: Implement category dropdown
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Line Item (Optional)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          hintText: 'Select a line item (optional)',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF9CA3AF)),
                        ),
                        readOnly: true,
                        onTap: () {}, // TODO: Implement line item dropdown
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset('assets/images/calendar.png', width: 18, height: 18),
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
                          hintText: 'Today',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? picked = await showCustomDatePicker(context, _selectedDate);
                          if (picked != null) {
                            setState(() {
                              _selectedDate = picked;
                              if (isSameDay(_selectedDate, DateTime.now())) {
                                _dateController.text = 'Today';
                              } else if (isSameDay(_selectedDate, DateTime.now().subtract(Duration(days: 1)))) {
                                _dateController.text = 'Yesterday';
                              } else {
                                _dateController.text = '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
                              }
                            });
                          }
                        },
                        controller: _dateController,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Notes (Optional)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          hintText: 'Weekly grocery shopping',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Update Transaction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Future<DateTime?> showCustomDatePicker(BuildContext context, DateTime initialDate) async {
  DateTime selectedDate = initialDate;
  return showDialog<DateTime>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: const Color(0xFF111827),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    focusedDay: selectedDate,
                    currentDay: selectedDate,
                    selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                    onDaySelected: (day, focusedDay) {
                      setState(() {
                        selectedDate = day;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(8)),
                      selectedDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white),
                      todayTextStyle: TextStyle(color: Colors.white),
                      selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      outsideTextStyle: TextStyle(color: Color(0xFF6B7280)),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = DateFormat.E().format(day); // 'Sun', 'Mon', etc.
                        return Container(
                          alignment: Alignment.center,
                          child: Text(text, style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.w600)),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                          alignment: Alignment.center,
                          child: Text('${day.day}', style: TextStyle(color: Colors.white)),
                        );
                      },
                      todayBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(8)),
                          alignment: Alignment.center,
                          child: Text('${day.day}', style: TextStyle(color: Colors.white)),
                        );
                      },
                      selectedBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text('${day.day}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedDate = DateTime.now();
                              });
                            },
                            child: Text('Today', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedDate = DateTime.now().subtract(Duration(days: 1));
                              });
                            },
                            child: Text('Yesterday', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF374151),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(selectedDate);
                            },
                            child: Text('Done', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// Add this function to show the Assign to Goal dialog
void showAssignToGoalDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xFF111827),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/assigntogoal.png', width: 28, height: 28),
                  SizedBox(width: 10),
                  Expanded(child: Text('Assign to Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                  GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                ],
              ),
              SizedBox(height: 12),
              Text('Select a goal to assign this transaction to.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text('No goals available', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text('Create a goal first to assign transactions.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(color: Color(0xFF374151), height: 1),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(width: 12),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text('Assign', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
