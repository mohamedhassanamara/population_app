import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundColor: Colors.red),
          Text('Tunisia'),
        ],
      ),
    );
  }
}
