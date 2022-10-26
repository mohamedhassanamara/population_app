import 'package:flutter/material.dart';
import 'package:population_app/widgets/basic/my_divider.dart';
import 'package:population_app/widgets/top_navigation.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/favorite_scroll.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            TopNavigation(),
            MyDivider(),
            FavoriteScroll(),
            MyDivider(),
            BottomNavigation(),
          ],
        ),
      ),
    );
  }
}
