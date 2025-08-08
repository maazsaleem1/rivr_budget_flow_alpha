import 'package:flutter/material.dart';
import '../../widgets/inter_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'onboarding_quiz4_screen.dart';

class OnboardingQuiz3Screen extends StatefulWidget {
  const OnboardingQuiz3Screen({super.key});

  @override
  State<OnboardingQuiz3Screen> createState() => _OnboardingQuiz3ScreenState();
}

// Move currencyList to top-level
const List<Map<String, dynamic>> currencyList = [
  {'code': 'USD', 'name': 'US Dollar', 'flag': '🇺🇸'},
  {'code': 'EUR', 'name': 'Euro', 'flag': '🇪🇺'},
  {'code': 'CAD', 'name': 'Canadian Dollar', 'flag': '🇨🇦'},
  {'code': 'MXN', 'name': 'Mexican Peso', 'flag': '🇲🇽'},
  {'code': 'UGX', 'name': 'Ugandan Shilling', 'flag': '🇺🇬'},
];

class _OnboardingQuiz3ScreenState extends State<OnboardingQuiz3Screen> {
  bool incomeExpanded = false;

  // Category data
  final List<Map<String, dynamic>> categories = [
    {'title': 'Transportation', 'icon': 'assets/images/transportationicon.png', 'expanded': false, 'budget': '', 'notes': ''},
    {'title': 'Food & Dining', 'icon': 'assets/images/foodanddrinking.png', 'expanded': false, 'budget': '', 'notes': ''},
    {'title': 'Utilities', 'icon': 'assets/images/utilities.png', 'expanded': false, 'budget': '', 'notes': ''},
    {'title': 'Entertainment', 'icon': 'assets/images/entertainment.png', 'expanded': false, 'budget': '', 'notes': ''},
    {'title': 'Shopping', 'icon': 'assets/images/shopping.png', 'expanded': false, 'budget': '', 'notes': ''},
  ];

  // Custom categories (for future extension)
  final List<Map<String, dynamic>> customCategories = [];

  bool incomeCurrencyDropdownOpen = false;
  String incomeCurrency = 'USD';
  List<bool> categoryCurrencyDropdownOpen = [false, false, false, false, false];
  List<String> categoryCurrency = ['USD', 'USD', 'USD', 'USD', 'USD'];

  // Add state for custom category form
  bool showCustomCategoryForm = false;
  TextEditingController customCategoryController = TextEditingController();
  TextEditingController customBudgetController = TextEditingController();
  List<bool> customCategoryCurrencyDropdownOpen = [];

  @override
  void dispose() {
    customCategoryController.dispose();
    customBudgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            LinearPercentIndicator(
              percent: 0.75,
              lineHeight: 8,
              barRadius: const Radius.circular(10),
              backgroundColor: const Color(0xFF303A48),
              linearGradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
            ),
            const SizedBox(height: 12),
            const Center(child: InterText('Step 3 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
            const SizedBox(height: 16),
            const InterText(
              'Set Your Budget Categories',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const InterText(
              "You've defined your goals- now give your money a clear plan. Choose the categories that reflect matters most, and connit towhere yourr money will go next.",
              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildIncomeCard(width),
                  ...categories.asMap().entries.map((entry) => _buildCategoryCard(entry.key, entry.value, width)).toList(),
                  ...customCategories.asMap().entries.map((entry) => _buildCustomCategoryCard(entry.key, entry.value, width)).toList(),
                  _buildAddCustomCategoryCard(width),
                  const SizedBox(height: 16),
                  _buildSummarySection(),
                  const SizedBox(height: 16),
                  _buildContinueButton(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeCard(double width) {
    return Container(
      width: width - 32,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/estimatemonthlyincome.png', width: 32, height: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText('Estimate Monthly Income', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 4),
                    InterText(
                      'Estimate your total monthly income from all sources (salary, freelance, side income, etc.)',
                      style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFF303A48), thickness: 1),
          const SizedBox(height: 8),
          if (!incomeExpanded)
            GestureDetector(
              onTap: () {
                setState(() {
                  incomeExpanded = true;
                });
              },
              child: Center(
                child: InterText('Tap to select', style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
            ),
          if (incomeExpanded) ...[
            const SizedBox(height: 16),
            InterText('Monthly Income', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.15), width: 1),
                ),
                hintText: 'Enter amount',
                hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset('assets/images/dollaricon.png', width: 20, height: 20)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            InterText('Primary Currency', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            InlineCurrencyDropdown(
              selectedCode: incomeCurrency,
              expanded: incomeCurrencyDropdownOpen,
              onChanged: (val) {
                setState(() {
                  incomeCurrency = val;
                });
              },
              onExpandChanged: (open) {
                setState(() {
                  incomeCurrencyDropdownOpen = open;
                });
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCategoryCard(int index, Map<String, dynamic> category, double width) {
    final isExpanded = category['expanded'] as bool;
    // Determine if this category should show the 'Need' pill
    final showNeed = index == 0 || index == 1 || index == 2;
    // Determine if this category should show the 'Want' pill
    final showWant = index == 3 || index == 4;
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var c in categories) {
            c['expanded'] = false;
          }
          categories[index]['expanded'] = !categories[index]['expanded'];
        });
      },
      child: Container(
        width: width - 32,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(category['icon'], width: 32, height: 32),
              const SizedBox(width: 12),
              InterText(category['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
              if (showNeed) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFF75555), width: 1),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                  ),
                  child: const Text('Need', style: TextStyle(color: Color(0xFFF75555), fontSize: 10, fontWeight: FontWeight.w600)),
                ),
              ],
              if (showWant) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF008FED), width: 1),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                  ),
                  child: const Text('Want', style: TextStyle(color: Color(0xFF008FED), fontSize: 10, fontWeight: FontWeight.w600)),
                ),
              ],
              const Spacer(),
              isExpanded
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        categories[index]['expanded'] = false;
                      });
                    },
                    child: Image.asset('assets/images/minussignimage.png', width: 32, height: 32),
                  )
                  : GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var c in categories) {
                          c['expanded'] = false;
                        }
                        categories[index]['expanded'] = true;
                      });
                    },
                    child: Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/setbudgeticon.png', width: 16, height: 16),
                          const SizedBox(width: 6),
                          const InterText('SET BUDGET', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Color(0xFF303A48), thickness: 1),
          if (!isExpanded)
            Center(
              child: InterText('Tap to Select', style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
            ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            InterText('Monthly Income', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.15), width: 1),
                ),
                hintText: 'Enter amount',
                hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset('assets/images/dollaricon.png', width: 20, height: 20)),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (val) {
                setState(() {
                  categories[index]['budget'] = val;
                });
              },
            ),
            const SizedBox(height: 12),
            InterText('Primary Currency', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            InlineCurrencyDropdown(
              selectedCode: categoryCurrency[index],
              expanded: categoryCurrencyDropdownOpen[index],
              onChanged: (val) {
                setState(() {
                  categoryCurrency[index] = val;
                });
              },
              onExpandChanged: (open) {
                setState(() {
                  for (int i = 0; i < categoryCurrencyDropdownOpen.length; i++) {
                    categoryCurrencyDropdownOpen[i] = false;
                  }
                  categoryCurrencyDropdownOpen[index] = open;
                });
              },
            ),
          ],
        ],
      ),
      ),
    );
  }

  Widget _buildAddCustomCategoryCard(double width) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showCustomCategoryForm = true;
            });
          },
          child: Container(
            width: width - 32,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF3B82F6), width: 1.5, style: BorderStyle.solid),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)])),
                    child: const Center(child: Icon(Icons.add, color: Colors.white, size: 28)),
                  ),
                  const SizedBox(height: 16),
                  const InterText(
                    'Add Custom Category',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const InterText(
                    'Define a category that reflects your priorities',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showCustomCategoryForm) ...[
          const SizedBox(height: 16),
          Container(
            width: width - 32,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF3B82F6), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InterText('Category Name', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: customCategoryController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E.g., Groceries, Gas, Entertainment',
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const InterText('Budget Amount', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: customBudgetController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '500',
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                        ),
                        child: TextButton(
                          onPressed: () {
                            final name = customCategoryController.text.trim();
                            final budget = customBudgetController.text.trim();
                            if (name.isNotEmpty && budget.isNotEmpty) {
                              setState(() {
                                customCategories.add({
                                  'title': name,
                                  'icon': 'assets/images/customMapIcon.png',
                                  'expanded': false,
                                  'budget': budget,
                                  'currency': 'USD',
                                });
                                customCategoryCurrencyDropdownOpen.add(false);
                                showCustomCategoryForm = false;
                                customCategoryController.clear();
                                customBudgetController.clear();
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.zero,
                          ),
                          child: const InterText('ADD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF232F3E),
                          border: Border.all(color: Colors.white24, width: 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showCustomCategoryForm = false;
                              customCategoryController.clear();
                              customBudgetController.clear();
                            });
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.zero,
                          ),
                          child: const InterText('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCustomCategoryCard(int index, Map<String, dynamic> category, double width) {
    final isExpanded = category['expanded'] as bool;
    // Determine if this category should show the 'Need' pill
    final showNeed = index == 0 || index == 1 || index == 2;
    // Determine if this category should show the 'Want' pill
    final showWant = index == 3 || index == 4;
    return GestureDetector(
      onTap: () {
        setState(() {
          // Close all regular categories
          for (var c in categories) {
            c['expanded'] = false;
          }
          // Close all custom categories
          for (var c in customCategories) {
            c['expanded'] = false;
          }
          // Open this custom category
          customCategories[index]['expanded'] = !customCategories[index]['expanded'];
        });
      },
      child: Container(
        width: width - 32,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(16)),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(category['icon'], width: 32, height: 32),
              const SizedBox(width: 12),
              InterText(category['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
              if (showNeed) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFF75555), width: 1),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                  ),
                  child: const Text('Need', style: TextStyle(color: Color(0xFFF75555), fontSize: 10, fontWeight: FontWeight.w600)),
                ),
              ],
              if (showWant) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF008FED), width: 1),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                  ),
                  child: const Text('Want', style: TextStyle(color: Color(0xFF008FED), fontSize: 10, fontWeight: FontWeight.w600)),
                ),
              ],
              const Spacer(),
              isExpanded
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        categories[index]['expanded'] = false;
                      });
                    },
                    child: Image.asset('assets/images/minussignimage.png', width: 32, height: 32),
                  )
                  : GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var c in categories) {
                          c['expanded'] = false;
                        }
                        categories[index]['expanded'] = true;
                      });
                    },
                    child: Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/setbudgeticon.png', width: 16, height: 16),
                          const SizedBox(width: 6),
                          const InterText('SET BUDGET', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Color(0xFF303A48), thickness: 1),
          if (!isExpanded)
            Center(
              child: InterText('Tap to Select', style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13, fontWeight: FontWeight.w400)),
            ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            InterText('Budget Amount', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.15), width: 1),
                ),
                hintText: 'Enter amount',
                hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset('assets/images/dollaricon.png', width: 20, height: 20)),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (val) {
                setState(() {
                  customCategories[index]['budget'] = val;
                });
              },
            ),
            const SizedBox(height: 12),
            InterText('Primary Currency', style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            InlineCurrencyDropdown(
              selectedCode: customCategories[index]['currency'] ?? 'USD',
              expanded: customCategoryCurrencyDropdownOpen[index],
              onChanged: (val) {
                setState(() {
                  customCategories[index]['currency'] = val;
                });
              },
              onExpandChanged: (open) {
                setState(() {
                  for (int i = 0; i < customCategoryCurrencyDropdownOpen.length; i++) {
                    customCategoryCurrencyDropdownOpen[i] = false;
                  }
                  customCategoryCurrencyDropdownOpen[index] = open;
                });
              },
            ),
          ],
        ],
      ),
      ),
    );
  }

  Widget _buildSummarySection() {
    int selectedCount = categories.where((c) => c['budget'].toString().isNotEmpty).length;
    double total = 0;
    for (var c in categories) {
      if (c['budget'].toString().isNotEmpty) {
        total += double.tryParse(c['budget']) ?? 0;
      }
    }
    return Center(
      child: InterText(
        '$selectedCount categories selected. Total committed: \$${total.toStringAsFixed(2)}',
        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
        ),
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingQuiz4Screen()));
          },
          child: const InterText('Commit to My Budget Plan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}

class InlineCurrencyDropdown extends StatefulWidget {
  final String selectedCode;
  final ValueChanged<String> onChanged;
  final bool expanded;
  final ValueChanged<bool> onExpandChanged;
  const InlineCurrencyDropdown({
    super.key,
    required this.selectedCode,
    required this.onChanged,
    required this.expanded,
    required this.onExpandChanged,
  });

  @override
  State<InlineCurrencyDropdown> createState() => _InlineCurrencyDropdownState();
}

class _InlineCurrencyDropdownState extends State<InlineCurrencyDropdown> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final selected = currencyList.firstWhere((c) => c['code'] == widget.selectedCode, orElse: () => currencyList[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            widget.onExpandChanged(!widget.expanded);
          },
          child: Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Row(
              children: [
                Text(selected['flag'], style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 8),
                InterText(selected['code'], style: const TextStyle(color: Colors.white, fontSize: 15)),
                const Spacer(),
                Icon(widget.expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: Colors.white, size: 24),
              ],
            ),
          ),
        ),
        if (widget.expanded)
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF020817),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              children: [
                Container(
                  height: 44,
                  decoration: BoxDecoration(color: const Color(0xFF121A28), borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.all(8),
                  child: TextField(
                    onChanged:
                        (val) => setState(() {
                          search = val;
                        }),
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search currency...',
                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF9CA3AF)),
                    ),
                  ),
                ),
                ...currencyList
                    .where(
                      (c) =>
                          c['code'].toString().toLowerCase().contains(search.toLowerCase()) ||
                          c['name'].toString().toLowerCase().contains(search.toLowerCase()),
                    )
                    .map(
                      (c) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.transparent,
                          ),
                          child: ListTile(
                            leading: Text(c['flag'], style: const TextStyle(fontSize: 22)),
                            title: InterText('${c['code']} - ${c['name']}', style: const TextStyle(color: Colors.white)),
                            trailing: GradientCheckbox(
                              value: widget.selectedCode == c['code'],
                              onChanged: (val) {
                                widget.onChanged(c['code']);
                                widget.onExpandChanged(false);
                              },
                            ),
                            onTap: () {
                              widget.onChanged(c['code']);
                              widget.onExpandChanged(false);
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
                if (currencyList
                    .where(
                      (c) =>
                          c['code'].toString().toLowerCase().contains(search.toLowerCase()) ||
                          c['name'].toString().toLowerCase().contains(search.toLowerCase()),
                    )
                    .isEmpty)
                  const Padding(padding: EdgeInsets.all(16.0), child: InterText('No currencies found', style: TextStyle(color: Color(0xFF9CA3AF)))),
                const SizedBox(height: 8),
              ],
            ),
          ),
      ],
    );
  }
}

// Add this custom widget for gradient checkbox
class GradientCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  const GradientCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: value ? const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]) : null,
          color: value ? null : const Color(0xFF232F3E),
          border: Border.all(color: value ? Colors.transparent : const Color(0xFF9CA3AF), width: 1.5),
        ),
        child: value ? const Icon(Icons.check, color: Colors.white, size: 18) : null,
      ),
    );
  }
}
