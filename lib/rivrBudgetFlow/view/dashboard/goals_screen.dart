import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Text('Savings Goals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.sp)),
            SizedBox(height: 4.h),
            Text('Track and manage your savings goals', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15.sp)),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 22.sp),
                        SizedBox(width: 8.w),
                        Text('New Savings Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Text('Goals In Progress', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.sp)),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () {
                showDialog(context: context, barrierDismissible: false, builder: (context) => GoalDetailDialog());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: BoxDecoration(color: Color(0xFF3B82F6), borderRadius: BorderRadius.circular(8.r)),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset('assets/images/testing.png', fit: BoxFit.cover),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Testing', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
                              SizedBox(height: 2.h),
                              Text('By Dec 2025', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13.sp)),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 28.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            showDialog(context: context, barrierDismissible: false, builder: (context) => AddNewGoalDialog());
                          },
                          child: Container(
                            width: 28.w,
                            height: 28.w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 18.sp),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.top,
                                child: Transform.translate(
                                  offset: Offset(0, -2),
                                  child: Text('\$4', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                                ),
                              ),
                              TextSpan(text: '0', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                              TextSpan(text: '/500', style: TextStyle(fontSize: 15.sp, color: Color(0xFF9CA3AF))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Stack(
                      children: [
                        Container(height: 7, decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(4))),
                        FractionallySizedBox(
                          widthFactor: 0.5, // 50% progress
                          child: Container(
                            height: 7,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text('0% complete', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13.sp)),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ShaderMask(
                              shaderCallback:
                                  (bounds) => LinearGradient(
                                    colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -2),
                                    child: Text('\$4', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                                  ),
                                  Text('100', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                            ),
                            Text('/month', style: TextStyle(fontSize: 13.sp, color: Color(0xFF9CA3AF))),
                          ],
                        ),
                        SizedBox(width: 16.w),
                        Text('0 items', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13.sp)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      // The bottom navigation bar is assumed to be handled globally or in the parent widget.
    );
  }
}

class GoalDetailDialog extends StatelessWidget {
  const GoalDetailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF1F2937),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: Color(0xFF3B82F6), borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/images/testing.png', fit: BoxFit.cover),
                ),
                SizedBox(width: 12),
                Expanded(child: Text('Testing', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
              ],
            ),
            SizedBox(height: 18),
            // Progress Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Color(0xFF232F3E), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Progress', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('0%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(height: 7, decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(4))),
                      FractionallySizedBox(
                        widthFactor: 0.5, // 50% progress
                        child: Container(
                          height: 7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$40', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('\$500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Current', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                      Text('Target', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Details Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Deadline', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                      SizedBox(height: 2),
                      Text('Dec 3, 2025', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priority', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Color(0xFFFBBF24), size: 12),
                          SizedBox(width: 6),
                          Text('Medium', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                      SizedBox(height: 2),
                      Text('General', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                      SizedBox(height: 2),
                      Text('Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            // Monthly Savings Plan Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFF08122E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF3B82F6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback:
                        (bounds) => LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                    child: Text('Monthly Savings Plan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Save '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: ShaderMask(
                            shaderCallback:
                                (bounds) => LinearGradient(
                                  colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                            child: Text('\$4100 per month', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                          ),
                        ),
                        TextSpan(text: ' for the next 5 months to reach your goal.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Delete Button
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDC2625),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.sp)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF6B7280)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: Text('Edit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.sp)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        showDialog(context: context, barrierDismissible: false, builder: (context) => UpdateGoalProgressDialog());
                      },
                      child: Center(
                        child: Text('Update Progress', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10.sp)),
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
  }
}

// Re-add UpdateGoalProgressDialog as per new requirements
class UpdateGoalProgressDialog extends StatefulWidget {
  const UpdateGoalProgressDialog({super.key});

  @override
  State<UpdateGoalProgressDialog> createState() => _UpdateGoalProgressDialogState();
}

class _UpdateGoalProgressDialogState extends State<UpdateGoalProgressDialog> {
  String action = 'deposit';
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF121A28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/updategoal.png', height: 32, fit: BoxFit.contain),
                  SizedBox(width: 10),
                  Expanded(child: Text('Update Goal Progress', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                  GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                ],
              ),
              SizedBox(height: 18),
              Text('Progress', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(height: 7, decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(4))),
                  FractionallySizedBox(
                    widthFactor: 0.5, // 50% progress
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$4' + '0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('Current', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$4' + '500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('Target', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Progress', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From Transactions:', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                        Text('\$4' + '0.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Manual Contributions:', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                        Text('\$4' + '0.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Color(0xFF374151), thickness: 1),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Progress:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                        Text('\$4' + '500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Remaining:', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                        Text('\$4' + '500.00', style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text('Amount (\$4)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => action = 'deposit'),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: action == 'deposit' ? Color(0xFF3B82F6) : Color(0xFF6B7280), width: 2),
                            color: action == 'deposit' ? Color(0xFF3B82F6) : Colors.transparent,
                          ),
                          child: action == 'deposit' ? Icon(Icons.arrow_upward, color: Colors.white, size: 14) : null,
                        ),
                        SizedBox(width: 6),
                        Text('Deposit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(width: 18),
                  GestureDetector(
                    onTap: () => setState(() => action = 'withdraw'),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: action == 'withdraw' ? Color(0xFFDC2625) : Color(0xFF6B7280), width: 2),
                            color: action == 'withdraw' ? Color(0xFFDC2625) : Colors.transparent,
                          ),
                          child: action == 'withdraw' ? Icon(Icons.arrow_downward, color: Colors.white, size: 14) : null,
                        ),
                        SizedBox(width: 6),
                        Text('Withdrawal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text('Amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: amountController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    prefixIcon: Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Icon(Icons.attach_money, color: Color(0xFF9CA3AF))),
                    prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
                    hintText: '0',
                    hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  ),
                ),
              ),
              SizedBox(height: 18),
              if (action == 'withdraw') ...[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 18),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Color(0xFF08122E),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFF3B82F6), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                        },
                        child: Text(
                          'Preview',
                          style: TextStyle(
                            color: Colors.white, // This will be masked by the gradient
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('New Balance:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('\$4' + '250.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Stack(
                        children: [
                          Container(height: 7, decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(4))),
                          FractionallySizedBox(
                            widthFactor: 0.5, // 50% progress
                            child: Container(
                              height: 7,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('New Progress: 50%', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                          Text('+\$250.00', style: TextStyle(color: Color(0xFF17A34A), fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    backgroundColor: action == 'withdraw' ? Color(0xFFDC2625) : null,
                  ),
                  onPressed: () {},
                  child: Ink(
                    decoration:
                        action == 'withdraw'
                            ? null
                            : BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Add Funds', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF6B7280)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add this dialog widget at the end of the file
class AddNewGoalDialog extends StatefulWidget {
  const AddNewGoalDialog({super.key});

  @override
  State<AddNewGoalDialog> createState() => _AddNewGoalDialogState();
}

class _AddNewGoalDialogState extends State<AddNewGoalDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController currentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String priority = 'Medium';
  int selectedIcon = 0;
  int selectedColor = 0;
  final List<Color> colorOptions = [
    Color(0xFF3B82F6),
    Color(0xFF06D4E9),
    Color(0xFF06B6D4),
    Color(0xFF10B981),
    Color(0xFFF59E42),
    Color(0xFFF43F5E),
    Color(0xFF6366F1),
    Color(0xFFFFB6C1),
  ];
  final List<IconData> iconOptions = [
    Icons.savings,
    Icons.flight,
    Icons.directions_car,
    Icons.home,
    Icons.school,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.star,
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF121A28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Add New Financial Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                  GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                ],
              ),
              SizedBox(height: 18),
              Text('Goal Name', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
              SizedBox(height: 6),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  hintText: 'e.g., Vacation Fund',
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  filled: true,
                  fillColor: Color(0xFF1F2937),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Target Amount (\$4)', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
                        SizedBox(height: 6),
                        TextField(
                          controller: targetController,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            hintText: '0',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            filled: true,
                            fillColor: Color(0xFF1F2937),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current Amount (\$4)', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
                        SizedBox(height: 6),
                        TextField(
                          controller: currentController,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            hintText: '0',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            filled: true,
                            fillColor: Color(0xFF1F2937),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Text('Date', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
              SizedBox(height: 6),
              TextField(
                controller: dateController,
                style: TextStyle(color: Colors.white),
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Color(0xFF3B82F6),
                            onPrimary: Colors.white,
                            surface: Color(0xFF232F3E),
                            onSurface: Colors.white,
                          ),
                          dialogBackgroundColor: Color(0xFF1F2937),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    dateController.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                  }
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  hintText: 'Select date',
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  filled: true,
                  fillColor: Color(0xFF1F2937),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  prefixIcon: Icon(Icons.calendar_today, color: Color(0xFF9CA3AF)),
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
                        SizedBox(height: 6),
                        TextField(
                          controller: categoryController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            hintText: 'e.g., Travel',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            filled: true,
                            fillColor: Color(0xFF1F2937),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Priority', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
                        SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          value: priority,
                          dropdownColor: Color(0xFF232F3E),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            filled: true,
                            fillColor: Color(0xFF1F2937),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                          items: ['Low', 'Medium', 'High'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => priority = v ?? 'Medium'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Text('Icon', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: List.generate(
                  iconOptions.length,
                  (i) => GestureDetector(
                    onTap: () => setState(() => selectedIcon = i),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedIcon == i ? Color(0xFF3B82F6) : Color(0xFF232F3E),
                        borderRadius: BorderRadius.circular(8),
                        border: selectedIcon == i ? Border.all(color: Color(0xFF06D4E9), width: 2) : null,
                      ),
                      child: Icon(iconOptions[i], color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text('Color', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: List.generate(
                  colorOptions.length,
                  (i) => GestureDetector(
                    onTap: () => setState(() => selectedColor = i),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: colorOptions[i],
                        borderRadius: BorderRadius.circular(8),
                        border: selectedColor == i ? Border.all(color: Colors.white, width: 2) : null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text('Notes (Optional)', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: 12)),
              SizedBox(height: 6),
              TextField(
                controller: notesController,
                style: TextStyle(color: Colors.white),
                maxLines: 2,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  hintText: 'Add any additional details about your goal',
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  filled: true,
                  fillColor: Color(0xFF1F2937),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                ),
              ),
              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    backgroundColor: null,
                  ),
                  onPressed: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Create Goal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF6B7280)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
