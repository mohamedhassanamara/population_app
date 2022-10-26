
import 'package:flutter/Material.dart';

import '../main.dart';
import 'filter.dart';
import 'filter_dialog.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
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
        ],
      ),
    );
  }
}

