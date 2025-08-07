import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home_screen.dart' show showEditTransactionDialog;
import '../../../controller/home_controller.dart';

class ActivityScreen extends StatefulWidget {
  final int initialSelectedTab;
  
  const ActivityScreen({super.key, this.initialSelectedTab = 0});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late int selectedTab;
  String sortOption = 'Newest First';
  final List<String> sortOptions = ['Newest First', 'Oldest First', 'Amount (High-Low)', 'Amount (Low-High)'];
  final GlobalKey _sortKey = GlobalKey();
  final GlobalKey _filterKey = GlobalKey();
  OverlayEntry? _filterOverlay;
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    // Use the controller's activityInitialTab if available, otherwise use widget parameter
    selectedTab = controller.activityInitialTab.value != 0 ? controller.activityInitialTab.value : widget.initialSelectedTab;
    
    // Listen to changes in activityInitialTab
    ever(controller.activityInitialTab, (int tabIndex) {
      if (mounted) {
        setState(() {
          selectedTab = tabIndex;
        });
      }
    });
  }

  void _showSortMenu(BuildContext context) async {
    final RenderBox box = _sortKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + box.size.height, offset.dx + box.size.width, offset.dy),
      color: const Color(0xFF121A28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      items:
          sortOptions
              .map(
                (option) => PopupMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.white, fontWeight: option == sortOption ? FontWeight.bold : FontWeight.normal, fontSize: 14.sp),
                  ),
                ),
              )
              .toList(),
      elevation: 8,
    );
    if (selected != null && selected != sortOption) {
      setState(() => sortOption = selected);
    }
  }

  void _showFilterPopup() {
    final RenderBox box = _filterKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero, ancestor: overlay);
    final double popupWidth = 320.w;
    final double iconCenter = offset.dx + box.size.width / 2;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double rightPadding = 20.w;
    _filterOverlay = OverlayEntry(
      builder:
          (context) => Positioned(
            right: rightPadding,
            top: offset.dy + box.size.height + 4.h,
            child: Material(color: Colors.transparent, child: _FilterPopup(onClose: _hideFilterPopup)),
          ),
    );
    Overlay.of(context).insert(_filterOverlay!);
  }

  void _hideFilterPopup() {
    _filterOverlay?.remove();
    _filterOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Row(
                children: [
                  Expanded(child: Text('Transaction History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.file_upload_outlined, color: Colors.white, size: 18.sp),
                        SizedBox(width: 6.w),
                        Text('Export File', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              // Toggle
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: selectedTab == 0 ? const Color(0xFF020817) : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          alignment: Alignment.center,
                          child: Text('All Transactions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12.sp)),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 1),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: selectedTab == 1 ? const Color(0xFF020817) : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          alignment: Alignment.center,
                          child: Text('Expenses', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp)),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 2),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: selectedTab == 2 ? const Color(0xFF020817) : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          alignment: Alignment.center,
                          child: Text('Income', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              // Money In/Out boxes
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          Image.asset('assets/images/money_in.png', height: 36.h, width: 36.w),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Money In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp)),
                              SizedBox(height: 6.h),
                              Text('\$4' + '2,500', style: TextStyle(color: Color(0xFF22C55D), fontWeight: FontWeight.bold, fontSize: 18.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          Image.asset('assets/images/money_out.png', height: 36.h, width: 36.w),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Money Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp)),
                              SizedBox(height: 6.h),
                              Text('\$4' + '85.42', style: TextStyle(color: Color(0xFFDC2625), fontWeight: FontWeight.bold, fontSize: 18.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              // Search and filter row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8.r)),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          hintText: 'Search transactions',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14.sp),
                          prefixIcon: Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    key: _sortKey,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFF121A28),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: () => _showSortMenu(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(sortOption, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp)),
                          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 20.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 48.w,
                    height: 40.h,
                    key: _filterKey,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: _showFilterPopup,
                      child: Center(child: Image.asset('assets/images/filters.png', width: 24.w, height: 24.w)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              // Transaction cards list
              Expanded(
                child: ListView(
                  children: [
                    _TransactionCard(
                      image: 'assets/images/chase.png',
                      title: 'Salary Deposit - Chase (3505)',
                      subtitle: 'Food · Yesterday',
                      amount: '+\$2500.00',
                      amountColor: Color(0xFF22C55D),
                      expandedTitle: 'Monthly salary',
                      expandedSubtitle: '',
                      buttons: [
                        _TransactionButton(label: 'Assign to Goal', color: Color(0xFF020817), onPressed: () {}),
                        SizedBox(width: 8.w),
                        _TransactionButton(label: 'Edit', color: Color(0xFF020817), onPressed: () {}),
                        SizedBox(width: 8.w),
                        _TransactionButton(label: 'Delete', color: Color(0xFFDC2625), onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _TransactionCard(
                      image: 'assets/images/heb.png',
                      title: 'H-E-B',
                      subtitle: 'Food · Today, 2:30 PM',
                      amount: '-\$85.42',
                      amountColor: Color(0xFFDC2625),
                      expandedTitle: 'H-E-B',
                      expandedSubtitle: '',
                      buttons: [
                        _TransactionButton(label: 'Assign to Goal', color: Color(0xFF020817), onPressed: () {}),
                        SizedBox(width: 8.w),
                        _TransactionButton(label: 'Edit', color: Color(0xFF020817), onPressed: () {}),
                        SizedBox(width: 8.w),
                        _TransactionButton(label: 'Delete', color: Color(0xFFDC2625), onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _TransactionCard(
                      image: 'assets/images/chase.png',
                      title: 'Salary Deposit - Chase (3505)',
                      subtitle: 'Food · Yesterday',
                      amount: '+\$4' + '85.42',
                      amountColor: Color(0xFF22C55D),
                      expandedTitle: 'Salary Deposit - Chase (3505)',
                      expandedSubtitle: '',
                      buttons: [],
                    ),
                    SizedBox(height: 12.h),
                    _TransactionCard(
                      image: 'assets/images/heb.png',
                      title: 'H-E-B',
                      subtitle: 'Food · Today, 2:30 PM',
                      amount: '-\$4' + '85.42',
                      amountColor: Color(0xFFDC2625),
                      expandedTitle: 'H-E-B',
                      expandedSubtitle: '',
                      buttons: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100.h, right: 0.w),
        child: IconButton(
          icon: Image.asset('assets/images/iconplus.png', fit: BoxFit.scaleDown),
          onPressed: () {
            showEditTransactionDialog(context, 20.w);
          },
          splashRadius: 32.w,
        ),
      ),
    );
  }
}

// Reuse/adapt _TransactionCard from home_screen.dart
class _TransactionCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String expandedTitle;
  final String expandedSubtitle;
  final List<Widget> buttons;

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
      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(14.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.image, width: 36.w, height: 36.w),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp)),
                      SizedBox(height: 2.h),
                      Text(widget.subtitle, style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12.sp)),
                    ],
                  ),
                ),
                Text(widget.amount, style: TextStyle(color: widget.amountColor, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                IconButton(
                  icon: AnimatedRotation(
                    turns: expanded ? 0.5 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 28.sp),
                  ),
                  onPressed: () => setState(() => expanded = !expanded),
                ),
              ],
            ),
          ),
          if (expanded) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.expandedTitle, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp)),
                  SizedBox(height: 10.h),
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

// Add _TransactionButton widget for action buttons
class _TransactionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const _TransactionButton({super.key, required this.label, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
          elevation: 0,
          minimumSize: Size(0, 36.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

// Add the _FilterPopup widget at the end of the file
class _FilterPopup extends StatefulWidget {
  final VoidCallback onClose;
  const _FilterPopup({required this.onClose, Key? key}) : super(key: key);

  @override
  State<_FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<_FilterPopup> {
  String dateRange = 'All Time';
  double minAmount = 0;
  double maxAmount = 5000;
  RangeValues amountRange = RangeValues(0, 5000);
  final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'color': Color(0xFF22C55D), 'checked': false, 'amount': 85, 'total': 500},
    {'name': 'Shopping', 'color': Color(0xFF3B82F6), 'checked': false, 'amount': 0, 'total': 300},
    {'name': 'Entertainment', 'color': Color(0xFFF59E42), 'checked': false, 'amount': 85, 'total': 500},
    {'name': 'Utilities', 'color': Color(0xFF06D4E9), 'checked': false, 'amount': 85, 'total': 500},
    {'name': 'Income', 'color': Color(0xFF22C55D), 'checked': false, 'amount': 85, 'total': 500},
    {'name': 'Uncategorized', 'color': Color(0xFF9CA3AF), 'checked': false, 'amount': 85, 'total': 500},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 284.w,
        height: 465.h,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 16)],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp))),
                        GestureDetector(
                          onTap: widget.onClose,
                          behavior: HitTestBehavior.translucent,
                          child: Icon(Icons.close, color: Colors.white, size: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text('Date Range', style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.w600, fontSize: 12.sp)),
                    SizedBox(height: 6.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(color: Color(0xFF121A28), borderRadius: BorderRadius.circular(8.r)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dateRange,
                          dropdownColor: Color(0xFF121A28),
                          style: TextStyle(color: Colors.white, fontSize: 12.sp),
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 18.sp),
                          items:
                              [
                                'All Time',
                                'Today',
                                'This Week',
                                'This Month',
                                'This Year',
                              ].map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontSize: 12.sp)))).toList(),
                          onChanged: (v) => setState(() => dateRange = v ?? 'All Time'),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text('Amount Range', style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.w600, fontSize: 12.sp)),
                    SizedBox(height: 6.h),
                    RangeSlider(
                      values: amountRange,
                      min: minAmount,
                      max: maxAmount,
                      divisions: 100,
                      activeColor: Color(0xFF3B82F6),
                      inactiveColor: Color(0xFF374151),
                      onChanged: (v) => setState(() => amountRange = v),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$4${amountRange.start.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                        Text('\$4${amountRange.end.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text('Budget Categories', style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.w600, fontSize: 12.sp)),
                    SizedBox(height: 6.h),
                    ...categories.map(
                      (cat) => Row(
                        children: [
                          Checkbox(
                            value: cat['checked'],
                            onChanged: (v) => setState(() => cat['checked'] = v ?? false),
                            activeColor: cat['color'],
                            checkColor: Colors.white,
                            side: BorderSide(color: cat['color'], width: 2),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          Container(width: 8.w),
                          Container(width: 8.w, height: 8.w, decoration: BoxDecoration(color: cat['color'], shape: BoxShape.circle)),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              '${cat['name']}  (\$4${cat['amount']}/${cat['total']})',
                              style: TextStyle(color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFF6B7280)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                            onPressed: () {},
                            child: Text('Reset', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12.sp)),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () {
                              widget.onClose();
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF3B82F6), Color(0xFF06D4E9)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Text('Apply Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12.sp)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
