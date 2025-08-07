import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rivr_project/rivrBudgetFlow/view/dashboard/calendar_transaction_history_screen.dart';
import 'package:rivr_project/rivrBudgetFlow/view/dashboard/help_and_support_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/inter_text.dart';
import 'activity_screen.dart';
import 'budget_screen.dart';
import 'goals_screen.dart';
import '../../../controller/home_controller.dart';
import 'package:rivr_project/rivrBudgetFlow/view/dashboard/app_settings_screen.dart';
import 'package:rivr_project/rivrBudgetFlow/view/dashboard/contact_support_screen.dart';

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
          return const ActivityScreen(initialSelectedTab: 0);
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
      body: Stack(children: [Positioned.fill(child: Obx(() => getScreen(controller.selectedIndex.value)))]),
      bottomNavigationBar: Obx(() => _CustomNavbar(selectedIndex: controller.selectedIndex.value, onTap: controller.onNavTap)),
    );
  }
}

// Extracted the original home content to a separate widget for clarity
class _HomeContent extends StatefulWidget {
  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  bool _isGettingStartedExpanded = false;
  bool _showSwipeToDismissContainer = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleGettingStarted() {
    setState(() {
      _isGettingStartedExpanded = !_isGettingStartedExpanded;
      if (_isGettingStartedExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
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
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to activity screen with Income tab selected (index 2)
                      controller.onNavTap(3); // Switch to Activity tab
                      // Set the initial tab for the activity screen
                      controller.setActivityInitialTab(2); // Income tab
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(height: 40, width: 40, child: Image.asset('assets/images/money_in.png')),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                                                      const InterText(
                                    'Money In',
                                    style: TextStyle(color: Colors.white70, fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Obx(
                                    () => InterText(
                                      '\$4${controller.moneyIn.value.toStringAsFixed(2)}',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
                ),
                SizedBox(width: cardSpacing),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to activity screen with Expenses tab selected (index 1)
                      controller.onNavTap(3); // Switch to Activity tab
                      // Set the initial tab for the activity screen
                      controller.setActivityInitialTab(1); // Expenses tab
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(height: 40, width: 40, child: Image.asset('assets/images/money_out.png')),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                                                      const InterText(
                                    'Money Out',
                                    style: TextStyle(color: Colors.white70, fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Obx(
                                    () => InterText(
                                      '\$4${controller.moneyOut.value.toStringAsFixed(2)}',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
                ),
              ],
            ),
          ),
          SizedBox(height: sectionSpacing),
          // Alert card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: GestureDetector(
              onTap: () {
                // Navigate to activity screen with All Transactions tab selected (index 0)
                controller.onNavTap(3); // Switch to Activity tab
                controller.setActivityInitialTab(0); // All Transactions tab
              },
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
                    height: chartSize * 1.3, // Increased size by 30%
                    width: chartSize * 1.3, // Increased size by 30%
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(size: Size(chartSize * 1.3, chartSize * 1.3), painter: _SpendingChartPainter()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text('Surplus', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 4),
                            Text('\$ 2,414.58', style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 24)),
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
          if (_showSwipeToDismissContainer)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  // Check if the drag distance is sufficient to dismiss
                  if (details.primaryVelocity != null && 
                      (details.primaryVelocity! > 300 || details.primaryVelocity! < -300)) {
                    setState(() {
                      _showSwipeToDismissContainer = false;
                    });
                  }
                },
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
            ),
          SizedBox(height: sectionSpacing * 0.7),
          // Gradient Getting Started box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
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
                      GestureDetector(
                        onTap: _toggleGettingStarted,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1.5), borderRadius: BorderRadius.circular(20)),
                          child: InterText(_isGettingStartedExpanded ? 'Collapse' : 'Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    child: _isGettingStartedExpanded
                        ? Column(
                            children: [
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
                                  child: GestureDetector(
                                    onTap: () {
                                      if (index == 0) {
                                        // Open the transaction dialog for adding income
                                        showEditTransactionDialog(context, 20.w);
                                      }
                                      // For other steps, you can add more functionality here
                                    },
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
                                  ),
                                );
                              }),
                              // Additional expanded content
                              SizedBox(height: 20.h),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InterText(
                                      'Additional Tips:',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 12.h),
                                    _ExpandedTipItem(
                                      icon: Icons.trending_up,
                                      title: 'Track Your Progress',
                                      description: 'Monitor your spending habits and savings goals regularly.',
                                    ),
                                    SizedBox(height: 8.h),
                                    _ExpandedTipItem(
                                      icon: Icons.notifications,
                                      title: 'Set Reminders',
                                      description: 'Get notified about upcoming bills and budget limits.',
                                    ),
                                    SizedBox(height: 8.h),
                                    _ExpandedTipItem(
                                      icon: Icons.analytics,
                                      title: 'Review Reports',
                                      description: 'Check monthly reports to understand your spending patterns.',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
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
          Positioned(left: 0, right: 0, bottom: 0.04.sh, child: Center(child: _FabWithBubbleMenu())),
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
    Widget iconWidget = Image.asset(isActive && selectedIcon != null ? selectedIcon! : icon, height: 38.w);

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
            _ProfileDialogTile(
              icon: 'assets/images/accounticon.png',
              text: 'Account Information',
              onTap: () {
                showDialog(context: Get.context!, barrierColor: Colors.black54, builder: (context) => const AccountInfoDialog());
              },
            ),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(
              icon: 'assets/images/transaction.png',
              text: 'Transaction History',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CalendarTransactionHistoryScreen()));
              },
            ),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(
              icon: 'assets/images/Setting.png',
              text: 'App Settings',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AppSettingsScreen()));
              },
            ),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(
              icon: 'assets/images/helpandsupport.png',
              text: 'Help & Support',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpSupportScreen()));
              },
            ),
            Divider(color: Color(0x339CA3AF), thickness: 1.h),
            _ProfileDialogTile(
              icon: 'assets/images/customersupport.png',
              text: 'Contact Support',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactSupportScreen()));
              },
            ),
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
                        Expanded(child: Text('Add Transaction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
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

class AccountInfoDialog extends StatefulWidget {
  const AccountInfoDialog({Key? key}) : super(key: key);

  @override
  State<AccountInfoDialog> createState() => _AccountInfoDialogState();
}

class _AccountInfoDialogState extends State<AccountInfoDialog> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Account', 'Bank Accounts', 'Subscription'];
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: 360,
        decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tabs
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (i) {
                  final isSelected = selectedTab == i;
                  return GestureDetector(
                    onTap: () => setState(() => selectedTab = i),
                    child:
                        isSelected
                            ? ShaderMask(
                              shaderCallback:
                                  (rect) => const LinearGradient(
                                    colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(rect),
                              child: Text(
                                tabs[i],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // This will be masked by the gradient
                                ),
                              ),
                            )
                            : Text(tabs[i], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Color(0x339CA3AF), thickness: 1),
            // Tab content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Builder(
                  builder: (context) {
                    if (selectedTab == 0) {
                      // Account Tab
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Photo Box
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Profile Photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/images/profile-avatar.png')),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'PNG, JPG, GIF, WebP. Max 10MB. Min 100x100px. Optimized & cached.',
                                              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            elevation: 0,
                                            padding: EdgeInsets.zero,
                                          ),
                                          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                                          label: Ink(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(vertical: 10),
                                              child: const Text(
                                                'Choose File',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            elevation: 0,
                                            padding: EdgeInsets.zero,
                                          ),
                                          icon: const Icon(Icons.photo_camera_front, color: Colors.white, size: 18),
                                          label: Ink(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(vertical: 10),
                                              child: const Text(
                                                'Take Your Photo',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            // Profile Information Box
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Profile Information', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 12),
                                  const Text('Full Name', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    initialValue: 'Testing',
                                    style: const TextStyle(color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF1F2937),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                      hintText: 'Testing',
                                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text('Email Address', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    initialValue: 'jane.doe@example.com',
                                    style: const TextStyle(color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF1F2937),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                      hintText: 'jane.doe@example.com',
                                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        elevation: 0,
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {},
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: const Text(
                                            'Update Profile',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            // Security Box
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Security', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 12),
                                  const Text('Current Password', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF1F2937),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                      hintText: '*****',
                                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text('New Password', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF1F2937),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                      hintText: '*****',
                                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text('Confirm New Password', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF1F2937),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                      hintText: '*****',
                                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        elevation: 0,
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {},
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: const Text(
                                            'Change Password',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            // Preferences Box
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Preferences', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 12),
                                  const Text('Timezone', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  Container(
                                    decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.access_time, color: Color(0xFF9CA3AF), size: 18),
                                        SizedBox(width: 8),
                                        Expanded(child: Text('Central Time (CT)', style: TextStyle(color: Colors.white, fontSize: 13))),
                                        Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF9CA3AF), size: 20),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Used for displaying dates and times throughout the app.',
                                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
                                  ),
                                  const SizedBox(height: 14),
                                  const Text('Currency', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  Container(
                                    decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.attach_money, color: Color(0xFF9CA3AF), size: 18),
                                        SizedBox(width: 8),
                                        Expanded(child: Text('Central Time (CT)', style: TextStyle(color: Colors.white, fontSize: 13))),
                                        Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF9CA3AF), size: 20),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Used for displaying dates and times throughout the app.',
                                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (selectedTab == 1) {
                      // Bank Accounts Tab
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Connected Bank Accounts',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  const SizedBox(height: 16),
                                  // List of bank accounts
                                  ...List.generate(
                                    3,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF020817),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                                        ),
                                        padding: const EdgeInsets.all(14),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset('assets/images/chase.png', width: 40, height: 40, fit: BoxFit.cover),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Chase Bank',
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text('Connected on Jan 15, 2023', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xFF020817),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1), // white 10% opacity),
                                                ),
                                                elevation: 0,

                                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Manage',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        elevation: 0,
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {},
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: const Text(
                                            'Connect New Bank Account',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Subscription Tab
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Your Subscription', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF008FED), size: 32),
                                      ),
                                      const SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('BudgetFlow Pro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                          SizedBox(height: 2),
                                          Text('Active', style: TextStyle(color: Color(0xFF00D1E9), fontWeight: FontWeight.bold, fontSize: 13)),
                                          SizedBox(height: 6),
                                          Text('\$14.99 Billed Annually', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                          Text('Renews on 1/14/2024', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1A3B2A),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Color(0xFF22C55E), width: 1),
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child: const Text(
                                      "Lifetime Discount Applied: You're saving \$230/year with your exclusive rate!",
                                      style: TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  const Text(
                                    'Pro Benefits Included',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  const SizedBox(height: 14),
                                  ...['Transaction history', 'Savings Goals', 'Budget Categories', 'Budget Calendar', '1 Free Bank Connection'].map(
                                    (benefit) => Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20),
                                          const SizedBox(width: 10),
                                          Expanded(child: Text(benefit, style: const TextStyle(color: Colors.white, fontSize: 14))),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Color(0xFF374151)),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Billing History',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Cancel subscription',
                                        style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.bold, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BubbleMenu extends StatelessWidget {
  final VoidCallback onConnectBank;
  final VoidCallback onAddCategory;
  final VoidCallback onAddTransaction;
  final VoidCallback onAddGoal;
  const _BubbleMenu({required this.onConnectBank, required this.onAddCategory, required this.onAddTransaction, required this.onAddGoal});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _BubbleMenuItem(icon: Icons.account_balance, text: 'Connect Bank', onTap: onConnectBank),
                _BubbleMenuItem(icon: Icons.category, text: 'Add Expense Category', onTap: onAddCategory),
                _BubbleMenuItem(icon: Icons.attach_money, text: 'Add Transaction', onTap: onAddTransaction),
                _BubbleMenuItem(icon: Icons.track_changes, text: 'Add Goal', onTap: onAddGoal),
              ],
            ),
          ),
          // Pointer
          CustomPaint(size: const Size(24, 12), painter: _BubblePointerPainter()),
        ],
      ),
    );
  }
}

class _BubbleMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const _BubbleMenuItem({required this.icon, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 16),
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class _BubblePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF111827);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FabWithBubbleMenu extends StatefulWidget {
  @override
  State<_FabWithBubbleMenu> createState() => _FabWithBubbleMenuState();
}

class _FabWithBubbleMenuState extends State<_FabWithBubbleMenu> {
  bool showMenu = false;
  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (showMenu) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() => showMenu = false);
    } else {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final screenWidth = MediaQuery.of(context).size.width;
      final menuWidth = 280.0;
      _overlayEntry = OverlayEntry(
        builder:
            (context) => Positioned(
              left: (screenWidth - menuWidth) / 2,
              // Reduce the offset so the menu is just above the button
              bottom: MediaQuery.of(context).size.height - position.dy + 20,
              width: menuWidth,
              child: _BubbleMenu(
                onConnectBank: () {
                  _toggleMenu();
                  // TODO: Implement Connect Bank
                },
                onAddCategory: () {
                  _toggleMenu();
                  // TODO: Implement Add Expense Category
                },
                onAddTransaction: () {
                  _toggleMenu();
                  // TODO: Implement Add Transaction
                },
                onAddGoal: () {
                  _toggleMenu();
                  // TODO: Implement Add Goal
                },
              ),
            ),
      );
      overlay.insert(_overlayEntry!);
      setState(() => showMenu = true);
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMenu,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 36),
      ),
    );
  }
}

class _ExpandedTipItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ExpandedTipItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20.w,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 4.h),
              InterText(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
