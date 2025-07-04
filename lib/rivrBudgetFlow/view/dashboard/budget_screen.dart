import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/inter_text.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText('Budget Categories', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp)),
            SizedBox(height: 4.h),
            InterText('Categorize Money In and Money Out', style: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 16.sp)),
            SizedBox(height: 16.h),
            // Create Category Button
            Center(
              child: SizedBox(
                width: 382.w,
                height: 58.h,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
                    label: InterText('Create Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Apartment Card
            _budgetCategoryCard(
              iconPath: 'assets/images/apartmenticon.png',
              title: 'Apartment',
              description: 'Budget Category',
              amount: ' 24314,237',
              total: ' 241,799',
              over: ' 24312,438 over',
              percentUsed: '17467%',
              progress: 1.0, // 100% for demo
              progressColor: const Color(0xFFF75555),
              isOver: true,
            ),
            SizedBox(height: 16.h),
            // Food Card
            _budgetCategoryCard(
              iconPath: 'assets/images/food.png',
              title: 'Food',
              description: 'Budget Category',
              amount: ' 24314,237',
              total: ' 24500',
              over: ' 24312,438 over',
              percentUsed: '17%',
              progress: 0.17,
              progressColor: const Color(0xFF22C55E),
              isOver: false,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _budgetCategoryCard({
  required String iconPath,
  required String title,
  required String description,
  required String amount,
  required String total,
  required String over,
  required String percentUsed,
  required double progress,
  required Color progressColor,
  required bool isOver,
}) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(color: const Color(0xFF232F3E), borderRadius: BorderRadius.circular(12.r)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(iconPath, width: 32.w, height: 32.w),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InterText(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                InterText(description, style: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            InterText(amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp)),
            const Spacer(),
            InterText('of $total', style: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp)),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: LinearProgressIndicator(value: progress, color: progressColor, backgroundColor: const Color(0xFF374151), minHeight: 8.h),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            InterText(over, style: TextStyle(color: progressColor, fontSize: 14.sp)),
            const Spacer(),
            InterText('$percentUsed used', style: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp)),
          ],
        ),
        Divider(color: const Color(0xFF9CA3AF), height: 20.h),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0x9C9CA3AF)), // 36% opacity
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: const Color(0xFF9CA3AF), size: 16.sp),
                      SizedBox(width: 6.w),
                      InterText('Subcategory', style: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      backgroundColor: Colors.transparent,
                    ),
                    child: InterText('Transaction', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
