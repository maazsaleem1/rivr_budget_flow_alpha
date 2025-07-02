import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/inter_text.dart';

class RivrSubscriptionScreen extends StatelessWidget {
  const RivrSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2937),
        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset('assets/images/rivrArrowBack.svg'), onPressed: () => Navigator.of(context).pop()),
        title: const Text('Add your Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 38),
                    const InterText('Add Plan', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 28),
                    // Plan Card
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF00D1E9)),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF23242A),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const InterText(
                                            'Starter',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                          SizedBox(width: 8),
                                          Image.asset('assets/images/textGradient.png', height: 20),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      const InterText('US\$14.99/ billed annually', style: TextStyle(color: Colors.white54, fontSize: 12)),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 28),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -08,
                          left: 24,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 2))],
                            ),
                            child: const InterText('Best Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const InterText('Add Card', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 18),
                    const InterText('Card Information', style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 14),
                    // Card Number Field
                    Container(
                      decoration: BoxDecoration(color: const Color(0xFF23242A), borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SvgPicture.asset('assets/images/rivrCardIcon.svg', width: 22, height: 22, color: Colors.white),
                          ),
                          const Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Card number',
                                hintStyle: TextStyle(color: Colors.white38),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Secure Info
                    Container(
                      decoration: BoxDecoration(color: const Color(0xFF23242A), borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SvgPicture.asset('assets/images/rivrLockIcon.svg', width: 22, height: 22, color: Colors.white),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0),
                              child: InterText(
                                'Your payment information is secure and encrypted',
                                style: TextStyle(color: Colors.white38, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // No charge today
                    Container(
                      width: double.infinity,
                      //padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(color: const Color(0xFF1E4423), borderRadius: BorderRadius.circular(8)),
                      child: Center(child: Image.asset('assets/images/rivrNoCharge.png')),
                    ),
                    const SizedBox(height: 18),
                    // Payment Methods
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/rivrVisa.png', width: 48, height: 32),
                        const SizedBox(width: 16),
                        Image.asset('assets/images/rivrMaster.png', width: 48, height: 32),
                        const SizedBox(width: 16),
                        Image.asset('assets/images/rivrDiscover.png', width: 48, height: 32),
                        const SizedBox(width: 16),
                        Image.asset('assets/images/rivrDiscover.png', width: 48, height: 32),
                      ],
                    ),
                    const Spacer(),
                    // Update Plan Button
                    Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const PlanSelectionBottomSheet(),
                            );
                          },
                          child: const Center(
                            child: InterText('Update Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlanSelectionBottomSheet extends StatefulWidget {
  const PlanSelectionBottomSheet({super.key});

  @override
  State<PlanSelectionBottomSheet> createState() => _PlanSelectionBottomSheetState();
}

class _PlanSelectionBottomSheetState extends State<PlanSelectionBottomSheet> {
  int selectedPlan = 0; // 0: Starter, 1: Premium, 2: Advance

  final List<Map<String, String>> plans = [
    {'name': 'Starter', 'price': 'US\$14.25/Year', 'desc': 'US\$14.99/ billed annually'},
    {'name': 'Premium', 'price': 'US\$14.25/Year', 'desc': 'US\$14.99/ billed annually'},
    {'name': 'Advance', 'price': 'US\$14.25/Year', 'desc': 'US\$14.99/ billed annually'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF23242A),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(plans.length, (index) {
              final plan = plans[index];
              final isSelected = selectedPlan == index;
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF23242A) : const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected ? Border.all(width: 1.5, color: const Color(0xFF00D1E9)) : null,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() {
                      selectedPlan = index;
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(plan['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  const SizedBox(height: 2),
                                  InterText(plan['desc']!, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/textGradient.png', height: 18),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: -14,
                          left: 18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 2))],
                            ),
                            child: const InterText('Current Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // Handle plan update logic here
                    Navigator.of(context).pop();
                    showDialog(context: context, barrierDismissible: false, builder: (context) => const PaymentSuccessDialog());
                  },
                  child: const Center(
                    child: InterText('Update Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF23242A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/rivrPayment.png',
                    //width: 100,
                    // height: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const InterText(
              'Payment Method\nadded Succesfully!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const InterText('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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
