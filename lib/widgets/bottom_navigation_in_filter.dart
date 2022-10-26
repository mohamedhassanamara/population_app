
import 'package:flutter/Material.dart';
import 'package:population_app/widgets/remove_filter.dart';
import 'filter.dart';

class BottomNavigationInFilter extends StatelessWidget {
  const BottomNavigationInFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Filter(),
          RemoveFilter()
        ],
      ),
    );
  }
}

