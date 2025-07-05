import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
  var selectedTab = 0.obs;

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

  void selectTab(int index) {
    selectedTab.value = index;
  }
}
