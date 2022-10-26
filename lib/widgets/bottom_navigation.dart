
import 'package:flutter/Material.dart';

import '../main.dart';
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
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FilterDialog();
                },
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt_sharp,
                  size: 40,
                ),
                Text(
                  'Filter By Country',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(
                Icons.close,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
