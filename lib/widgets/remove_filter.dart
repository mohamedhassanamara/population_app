import 'package:flutter/Material.dart';

import '../main.dart';

class RemoveFilter extends StatelessWidget {
  const RemoveFilter({
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
      child: const CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.close,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
