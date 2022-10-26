
import 'package:flutter/Material.dart';

import 'favorite_navigator.dart';
import 'home_navigator.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HomeNafigator(),
        FavoriteNavigator()
      ],
    );
  }
}
