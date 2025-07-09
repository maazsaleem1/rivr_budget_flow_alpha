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
                    onPressed: () {
                      showDialog(context: context, barrierDismissible: false, builder: (context) => const CreateCategoryDialog());
                    },
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
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (context) =>
                          BudgetCategoryDetailDialog(iconPath: 'assets/images/apartmenticon.png', name: 'Apartment', spent: 314.24, limit: 500.0),
                );
              },
              child: _budgetCategoryCard(
                iconPath: 'assets/images/apartmenticon.png',
                title: 'Apartment',
                description: 'Budget Category',
                amount: '24314,237',
                total: '241,799',
                over: '24312,438 over',
                percentUsed: '17467%',
                progress: 1.0, // 100% for demo
                progressColor: const Color(0xFFF75555),
                isOver: true,
              ),
            ),
            SizedBox(height: 16.h),
            // Food Card
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BudgetCategoryDetailDialog(iconPath: 'assets/images/food.png', name: 'Food', spent: 85.0, limit: 500.0),
                );
              },
              child: _budgetCategoryCard(
                iconPath: 'assets/images/food.png',
                title: 'Food',
                description: 'Budget Category',
                amount: '24314,237',
                total: '24500',
                over: '24312,438 over',
                percentUsed: '17%',
                progress: 0.17,
                progressColor: const Color(0xFF22C55E),
                isOver: false,
              ),
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

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({Key? key}) : super(key: key);

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  int _selectedColor = 0;
  int _selectedIcon = 0;
  final List<Color> _colors = [Color(0xFF3B82F6), Color(0xFF06B6D4), Color(0xFF10B981), Color(0xFFF59E42), Color(0xFFEF4444), Color(0xFFEC4899)];
  final List<IconData> _icons = [
    Icons.shopping_cart,
    Icons.fastfood,
    Icons.home,
    Icons.directions_car,
    Icons.star,
    Icons.sports_esports,
    Icons.school,
    Icons.pets,
    Icons.flight,
    Icons.favorite,
    Icons.savings,
    Icons.coffee,
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF121A28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Create New Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
                  GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                ],
              ),
              SizedBox(height: 18),
              Text('Category Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    hintText: 'E.g., Groceries, Gas, Entertainment',
                    hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Monthly Budget Limit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: _budgetController,
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
              SizedBox(height: 16),
              Text('Color', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              SizedBox(height: 8),
              Row(
                children: List.generate(
                  _colors.length,
                  (i) => GestureDetector(
                    onTap: () => setState(() => _selectedColor = i),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _colors[i],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _selectedColor == i ? Colors.white : Colors.transparent, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Category Icon', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  _icons.length,
                  (i) => GestureDetector(
                    onTap: () => setState(() => _selectedIcon = i),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F2937),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _selectedIcon == i ? _colors[_selectedColor] : Colors.transparent, width: 2),
                      ),
                      child: Icon(_icons[i], color: _selectedIcon == i ? _colors[_selectedColor] : Color(0xFF9CA3AF)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Text('Preview', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Color(0xFF232F3E), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(color: _colors[_selectedColor], borderRadius: BorderRadius.circular(8)),
                      child: Icon(_icons[_selectedIcon], color: Colors.white),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _nameController.text.isEmpty ? 'Category Name' : _nameController.text,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 2),
                          Text(
                            ' 24${_budgetController.text.isEmpty ? '0.00' : _budgetController.text} monthly budget',
                            style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
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
                      gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Create Budget Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
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

class BudgetCategoryDetailDialog extends StatefulWidget {
  final String iconPath;
  final String name;
  final double spent;
  final double limit;

  const BudgetCategoryDetailDialog({super.key, required this.iconPath, required this.name, required this.spent, required this.limit});

  @override
  State<BudgetCategoryDetailDialog> createState() => _BudgetCategoryDetailDialogState();
}

class _BudgetCategoryDetailDialogState extends State<BudgetCategoryDetailDialog> {
  int _tabIndex = 0;
  late TextEditingController _limitController;

  @override
  void initState() {
    super.initState();
    _limitController = TextEditingController(text: widget.limit.toStringAsFixed(0));
  }

  @override
  Widget build(BuildContext context) {
    double percent = (widget.spent / widget.limit).clamp(0, 1);
    final double dialogWidth = MediaQuery.of(context).size.width - 40;
    return Dialog(
      backgroundColor: const Color(0xFF121A28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        width: dialogWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Color(0xFF232F3E), borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(widget.iconPath, width: 28, height: 28),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          Text('Budget Category', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                        ],
                      ),
                    ),
                    GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.close, color: Colors.white, size: 24)),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Manage your budget category and track spending across different line-items.',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                ),
                SizedBox(height: 14),
                Row(
                  children: [
                    Icon(Icons.circle, color: Color(0xFF22C55D), size: 12),
                    SizedBox(width: 4),
                    Text('Spent: ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                    Text(' 24${widget.spent.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(width: 18),
                    Icon(Icons.circle, color: Color(0xFF3B82F6), size: 12),
                    SizedBox(width: 4),
                    Text('Limit: ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                    Text(' 24${widget.limit.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                SizedBox(height: 18),
                // Tabs
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      for (int i = 0; i < 3; i++) ...[
                        if (i > 0) SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _tabIndex = i),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: _tabIndex == i ? Color(0xFF020817) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                i == 0
                                    ? 'Overview'
                                    : i == 1
                                    ? 'Subcategories'
                                    : 'Goals',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 18),
                if (_tabIndex == 0) ...[
                  // Overview Tab
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Spending Limit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                            ShaderMask(
                              shaderCallback:
                                  (bounds) => LinearGradient(
                                    colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                              child: Text('Monthly Budget', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text('Set your monthly spending limit for Food', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(color: Color(0xFF020817), borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            controller: _limitController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Icon(Icons.attach_money, color: Color(0xFF9CA3AF)),
                              ),
                              prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
                              hintText: '0',
                              hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Current Spending', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('This Month', style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' 24${widget.spent.toStringAsFixed(0)}',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Spacer(),
                            Text('of ', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                            Text(
                              ' 24${widget.limit.toStringAsFixed(0)}',
                              style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(value: percent, color: Color(0xFF22C55D), backgroundColor: Color(0xFF374151), minHeight: 8),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(' 40', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                            Spacer(),
                            Text('17% used', style: TextStyle(color: Color(0xFF22C55D), fontSize: 13)),
                            Spacer(),
                            Text(' 4${widget.limit.toStringAsFixed(0)}', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                          ],
                        ),
                        SizedBox(height: 16),
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
                                  colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text('Add Transaction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (_tabIndex == 1) ...[
                  SizedBox(height: 40),
                  Center(child: Text('No subcategories yet.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15))),
                ],
                if (_tabIndex == 2) ...[
                  SizedBox(height: 40),
                  Center(child: Text('No goals yet.', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15))),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
