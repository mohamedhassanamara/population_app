import 'package:flutter/material.dart';

import '../screens/favorite_screen.dart';

class FavoriteNavigator extends StatelessWidget {
  const FavoriteNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => const FavoriteScreen(),
          ),);
      },
      child: const CircleAvatar(
        backgroundColor: Colors.black,
        radius: 30,
        child: Icon(
          Icons.favorite,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
