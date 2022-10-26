import 'package:flutter/material.dart';
import 'package:population_app/widgets/top_navigation.dart';
import '../widgets/bottom_navigation_in_filter.dart';
import '../widgets/filter_scroll.dart';
import '../widgets/basic/my_divider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    Object? country = ModalRoute.of(context)?.settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopNavigation(),
            MyDivider(),
            FilterScroll(country: country),
            MyDivider(),
            BottomNavigationInFilter()
          ],
        ),
      ),
    );
  }
}
