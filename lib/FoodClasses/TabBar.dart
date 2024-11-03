
import 'package:flutter/material.dart';
import 'package:fooduu/FoodClasses/Food.dart';

class MyTabBarX extends StatelessWidget {
  final TabController tabController;

  const MyTabBarX({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return FoodCatagory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last, // Corrected reference to category
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
