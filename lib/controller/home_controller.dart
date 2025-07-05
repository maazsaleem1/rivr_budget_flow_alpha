import 'package:get/get.dart';

class CategoryModel {
  final String image;
  final String title;
  final String amount;
  final String total;
  final int percent;
  final String editIcon;

  CategoryModel({required this.image, required this.title, required this.amount, required this.total, required this.percent, required this.editIcon});
}

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var homeTabIndex = 0.obs;

  // User info and messages
  final userName = 'Jane'.obs;
  final welcomeMessage = 'We love your progress. Keep it up.'.obs;
  final budgetTitle = 'June Budget So Far'.obs;

  // Budget summary
  final moneyIn = 2500.0.obs;
  final moneyOut = 85.42.obs;

  final categories =
      <CategoryModel>[
        CategoryModel(
          image: 'assets/images/entertainment.png',
          title: 'Entertainment',
          amount: '0',
          total: '150',
          percent: 0,
          editIcon: 'assets/images/Edit.png',
        ),
        CategoryModel(
          image: 'assets/images/uncategorized.png',
          title: 'Uncategorized',
          amount: '0',
          total: '150',
          percent: 0,
          editIcon: 'assets/images/Edit.png',
        ),
        CategoryModel(
          image: 'assets/images/utility.png',
          title: 'Utilities',
          amount: '0',
          total: '150',
          percent: 0,
          editIcon: 'assets/images/Edit.png',
        ),
      ].obs;

  void selectTab(int index) => selectedIndex.value = index;
  void onNavTap(int index) => selectedIndex.value = index;
  void selectHomeTab(int index) => homeTabIndex.value = index;
}
