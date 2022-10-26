import 'package:flutter/material.dart';

import '../main.dart';

class HomeNafigator extends StatelessWidget {
  const HomeNafigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
      },
      child: Text(
        'POPULATION\nAPP',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
      ),
    );
  }
}
